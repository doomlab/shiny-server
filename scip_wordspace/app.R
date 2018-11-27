#Shiny Word Space App for SCIP 2018
#Written by Erin M. Buchanan, William Padfield, Arielle Cunningham, 
#Addie Wikowsky, Abbie Van Nuland, Amber Gillenwaters

# Load Libraries ----------------------------------------------------------
  library(shiny)
  library(lsa)
  library(LSAfun)
  library(haven)
  library(readr)
  library(shinydashboard)
  library(kableExtra)
  library(rhandsontable)
  library(DT)
  library(tm)
  library(ggplot2)
  library(dplyr)
  library(tidytext)
  library(topicmodels)
  library(slam)
  library(knitr)
  
  cleanup = theme(panel.grid.major = element_blank(), 
                  panel.grid.minor = element_blank(), 
                  panel.background = element_blank(), 
                  axis.line.x = element_line(color = "black"),
                  axis.line.y = element_line(color = "black"),
                  legend.key = element_rect(fill = "white"),
                  text = element_text(size = 15))

# Source Files ------------------------------------------------------------
  load("engbnc.rda")
  EN_100k_lsa <<- EN_100k_lsa
  source("data_tab.R")
  source("lsa_tab_single.R")
  source("lsa_tab_multiple.R")
  source("lsa_document_tab.R")
  source("topics_tab.R")
  source("code_tab.R")

# Define UI ---------------------------------------------------------------
ui <- dashboardPage(skin = "blue",
  dashboardHeader(title = tags$b("Word Space Creator")),
  dashboardSidebar(
    sidebarMenu(
      menuItem(tags$b("1. Select Data"), tabName = "data_tab"),
      menuItem(tags$b("2. LSA Single Word Functions"), tabName = "lsa_tab_single"),
      menuItem(tags$b("2a. LSA Single English Corpus"), tabName = "lsa_tab_single_corpus"),
      menuItem(tags$b("3. LSA Multiple Word Functions"), tabName = "lsa_tab_multiple"),
      menuItem(tags$b("3a. LSA Multiple English Corpus"), tabName = "lsa_tab_multiple_corpus"),
      menuItem(tags$b("4. LSA Document Functions"), tabName = "lsa_document_tab"),
      menuItem(tags$b("5. Topics Models"), tabName = "topics_tab"),
      menuItem(tags$b("6. See the Code"), tabName = "code_tab")
    )
  ),
  dashboardBody(
    tabItems(
      data_tab,
      lsa_tab_single,
      lsa_tab_single_corpus,
      lsa_tab_multiple,
      lsa_tab_multiple_corpus,
      lsa_document_tab,
      topics_tab,
      code_tab
      ) # end tabItems
    ) # end dashboardBody
  ) # end dashboardPage

# Define server logic -----------------------------------------------------

server <- function(input, output, session) {
  
  # Load Data ---------------------------------------------------------------
  dat <- reactive({
    inFile <<- input$inFile
    if (is.null(inFile)) return(NULL)
    
    file_extension <- tools::file_ext(inFile$datapath)
    if (file_extension == "csv") {
      input_data <<- read.csv(inFile$datapath, header = input$header,
                           stringsAsFactors = F)
    } else if (file_extension %in% c("xls", "xlsx")) {
      input_data <<- as.data.frame(readxl::read_excel(inFile$datapath, 
                                                   col_names = input$header))
    } else if (file_extension %in% c("sav")) {
      input_data <<- haven::read_sav(inFile$datapath)
    } else if (file_extension %in% c("sas")) {
      input_data <<- haven::read_sas(inFile$datapath)
    }
    
    #save file name as global variable for writing
    file_name <<- gsub(paste0("." , file_extension), "", inFile$name)
    
  }) #close dat
  
  # Output the table --------------------------------------------------------
  
  output$inputdata_table <- renderDataTable({
    
    dat()
    
    if (exists("input_data")) { #if user defined data
      
      #run the lsa stuff
      #Create a corpus from a vector of documents
      #therefore the data needs to be a column in a DF that includes all the text files
      import_corpus = Corpus(VectorSource(input_data[ , 1]))
      
      #Lower case all words
      import_corpus = tm_map(import_corpus, tolower)
      
      #Remove punctuation for creating spaces
      import_corpus = tm_map(import_corpus, removePunctuation)
      
      #Remove stop words
      import_corpus = tm_map(import_corpus,
                             function(x) removeWords(x, stopwords("english")))
      
      #Create the term by document matrix
      import_mat = as.matrix(TermDocumentMatrix(import_corpus))
      
      #Weight the semantic space
      import_weight = lw_logtf(import_mat) * gw_idf(import_mat)
      
      #Run the SVD
      import_lsa = lsa(import_weight)
      
      #Convert to textmatrix for coherence
      final_lsa_data <<- as.textmatrix(import_lsa)
      
      words_for_input <<- rownames(final_lsa_data)
      
    } #save the final lsa data 
    
    if (exists("input_data")) {
    #shorten view
    if (ncol(input_data) > 3){
      datatable(input_data[ , 1:3], rownames = F)
    } else { datatable(input_data, rownames = F) }
      } #output the dataframe
    
  }) #close renderDT
    
  
  # Update the inputs -------------------------------------------------------
  
  output$rownames_selectUI <- renderUI({
    selectInput("rownames_select", "Select target word:", words_for_input)
  })
  
  output$multiple_selectUI <- renderUI({
    selectizeInput("multiple_select", "Select Words:", 
                   choices = words_for_input,
                   multiple = TRUE) #close selectizeInput
  })
  
  output$document_selectUI <- renderUI({
    selectInput(inputId = "document_select",
                label = "Select Document:",
                choices = 1:nrow(input_data))
  })
  
  # Single Words LSA Functions ----------------------------------------------

    output$lsa_plotneighbors = renderPlot({

      temp = plot_neighbors(input$rownames_select,
                   n = input$neighbors,
                   tvectors = final_lsa_data,
                   method = "MDS",
                   dims = 2)

      neighbor_plot = ggplot(temp, aes(x,y))
        neighbor_plot +
          cleanup +
          geom_point(alpha = .2) +
          geom_text(position=position_jitter(width=.01,height=.01), aes(label = rownames(temp))) +
          xlab("Dimension 1") +
          ylab("Dimension 2")
      }) #close plot

  output$lsa_choosetarget = renderDataTable({
    targets = as.data.frame(choose.target(input$rownames_select,
                  lower = input$select_range[1],
                  upper = input$select_range[2],
                  n = input$neighbors,
                  tvectors = final_lsa_data))
    colnames(targets) = "cosine"

    datatable(targets,
              extensions = 'Buttons',
              options = list(
                searching = T,
                dom = 'frtpB',
                buttons = c('copy')
              ) #close list
    ) #close datatable
  }) #close renderDT

  # Single Words LSA Corpus -------------------------------------------------
  
  output$lsa_plotneighbors_corpus = renderPlot({
    
    temp = plot_neighbors(input$rownames_select_corpus,
                          n = input$neighbors_corpus,
                          tvectors = EN_100k_lsa,
                          method = "MDS",
                          dims = 2)
    
    neighbor_plot = ggplot(temp, aes(x,y))
    neighbor_plot +
      cleanup +
      geom_point(alpha = .2) +
      geom_text(position=position_jitter(width=.01,height=.01), aes(label = rownames(temp))) +
      xlab("Dimension 1") +
      ylab("Dimension 2")
  }) #close plot
  
  output$lsa_choosetarget_corpus = renderDataTable({
    targets = as.data.frame(choose.target(input$rownames_select_corpus,
                                          lower = input$select_range_corpus[1],
                                          upper = input$select_range_corpus[2],
                                          n = input$neighbors_corpus,
                                          tvectors = EN_100k_lsa))
    colnames(targets) = "cosine"
    
    datatable(targets,
              extensions = 'Buttons',
              options = list(
                searching = T,
                dom = 'frtpB',
                buttons = c('copy')
              ) #close list
    ) #close datatable
  }) #close renderDT

  # Multiword LSA functions -------------------------------------------------

  output$lsa_multicos = renderDataTable({

    datatable(multicos(input$multiple_select, tvectors=final_lsa_data),
              extensions = 'Buttons',
              options = list(
                searching = T,
                scrollX = T,
                dom = 'frtpB',
                buttons = c('copy')
                ) #close list
              ) #close datatable

  })

  output$lsa_plotwordlist = renderPlot({

    temp_wl = plot_wordlist(input$multiple_select,
                             method = "MDS",
                             dims = 2,
                             tvectors = final_lsa_data)

    wordlist_plot = ggplot(temp_wl, aes(x,y))
    wordlist_plot +
      cleanup +
      geom_point(alpha = .2) +
      geom_text(position=position_jitter(width=.01,height=.01), aes(label = rownames(temp_wl))) +
      xlab("Dimension 1") +
      ylab("Dimension 2")

  })
  
  # Multiword LSA Corpus -------------------------------------------------
  
  output$lsa_multicos_corpus = renderDataTable({
    
    datatable(multicos(input$multiple_select_corpus, tvectors=EN_100k_lsa),
              extensions = 'Buttons',
              options = list(
                searching = T,
                scrollX = T,
                dom = 'frtpB',
                buttons = c('copy')
              ) #close list
    ) #close datatable
    
  })
  
  output$lsa_plotwordlist_corpus = renderPlot({
    
    temp_wl = plot_wordlist(input$multiple_select_corpus,
                            method = "MDS",
                            dims = 2,
                            tvectors = EN_100k_lsa)
    
    wordlist_plot = ggplot(temp_wl, aes(x,y))
    wordlist_plot +
      cleanup +
      geom_point(alpha = .2) +
      geom_text(position=position_jitter(width=.01,height=.01), aes(label = rownames(temp_wl))) +
      xlab("Dimension 1") +
      ylab("Dimension 2")
    
  })

  # Document LSA Functions --------------------------------------------------

  output$local_coherence = renderDataTable({

    temp_lc = as.data.frame(coherence(input_data[input$document_select, 1],
              tvectors = final_lsa_data)$local)
    colnames(temp_lc)= "Coherence"

    datatable(temp_lc,
              extensions = 'Buttons',
              options = list(
                searching = T,
                dom = 'frtpB',
                buttons = c('copy')
              ) #close list
    ) # close data table

  })

  output$global_coherence = renderText({

    coherence(input_data[input$document_select, 1],
                                      tvectors = final_lsa_data)$global
  })

  output$generic_summary = renderText({

   genericSummary(input_data[input$document_select, 1], k = 1)

  })
  
  # Run Topics Models ---------------------------------------------
  
  run_topics = reactive({
    
    if (exists("input_data")) { #if user defined data
      
      #run the lsa stuff
      #Create a corpus from a vector of documents
      #therefore the data needs to be a column in a DF that includes all the text files
      import_corpus = Corpus(VectorSource(input_data[ , 1]))
      
      
      #create corpus textmatrix
      import_mat = DocumentTermMatrix(import_corpus,
                                      control = list(stemming = TRUE, stopwords = TRUE, minWordLength = 3,
                                                     removeNumbers = TRUE, removePunctuation = TRUE))
      
      #weighting scheme
      import_weight = tapply(import_mat$v/row_sums(import_mat)[import_mat$i], import_mat$j, mean) *
        log2(nDocs(import_mat)/col_sums(import_mat > 0))
      
      #ignore very frequent and 0 terms
      final_topics = import_mat[ , import_weight >= .1]
      final_topics = final_topics[ row_sums(final_topics) > 0, ]
      
      #make the user pick a number of topics
      LDA_fit <<- LDA(final_topics, k = input$notopics, control = list(seed = input$SEED))
      LDA_fixed <<- LDA(final_topics, k = input$notopics, control = list(estimate.alpha = FALSE, seed = input$SEED))
      LDA_gibbs <<- LDA(final_topics, k = input$notopics, method = "Gibbs",
                        control = list(seed = input$SEED, burnin = 1000, thin = 100, iter = 1000))
      CTM_fit <<- CTM(final_topics, k = input$notopics,
                      control = list(seed = input$SEED,
                                     var = list(tol = 10^-4),
                                     em = list(tol = 10^-3)))
    }
    
  }) #close reactive
  

  # Topics Tab --------------------------------------------------------------

  output$alpha_topics = renderText({
    run_topics()

    if (input$pick_model == "LDA_fit"){
      alpha_print = LDA_fit@alpha
    }

    if (input$pick_model == "LDA_fixed"){
      alpha_print = LDA_fixed@alpha
    }

    if (input$pick_model == "LDA_gibbs"){
      alpha_print = LDA_gibbs@alpha
    }

    if(input$pick_model == "CTM_fit"){
      alpha_print = "No alpha provided with this model"
    }

    alpha_print

  })

  output$entropy_topics = renderText({

    entropy_numbers = sapply(list(LDA_fit, LDA_fixed, LDA_gibbs, CTM_fit), function (x)
      mean(apply(posterior(x)$topics, 1, function(z)
        - sum(z * log(z)))))

    if (input$pick_model == "LDA_fit"){
      entropy_print = entropy_numbers[1]
    }

    if (input$pick_model == "LDA_fixed"){
      entropy_print = entropy_numbers[2]
    }

    if (input$pick_model == "LDA_gibbs"){
      entropy_print = entropy_numbers[3]
    }

    if(input$pick_model == "CTM_fit"){
      entropy_print = entropy_numbers[4]
    }

    entropy_print

  })

  output$topic_matrix = renderDataTable({

    if (input$pick_model == "LDA_fit"){
      matrix_print = topics(LDA_fit, input$notopics)
    }

    if (input$pick_model == "LDA_fixed"){
      matrix_print = topics(LDA_fixed, input$notopics)
    }

    if (input$pick_model == "LDA_gibbs"){
      matrix_print = topics(LDA_gibbs, input$notopics)
    }

    if(input$pick_model == "CTM_fit"){
      matrix_print = topics(CTM_fit, input$notopics)
    }

    datatable(matrix_print,
              extensions = 'Buttons',
              options = list(
                scrollX = T,
                searching = T,
                dom = 'frtpB',
                buttons = c('copy')
              ) #close list
    ) # close data table

  }) #close datatable

  output$topic_summary = renderDataTable({

    if (input$pick_model == "LDA_fit"){
      topic_print = as.data.frame(table(topics(LDA_fit, 1)))
    }

    if (input$pick_model == "LDA_fixed"){
      topic_print = as.data.frame(table(topics(LDA_fixed, 1)))
    }

    if (input$pick_model == "LDA_gibbs"){
      topic_print = as.data.frame(table(topics(LDA_gibbs, 1)))
    }

    if(input$pick_model == "CTM_fit"){
      topic_print = as.data.frame(table(topics(CTM_fit, 1)))
    }
    
    colnames(topic_print) = c("Topic_Number", "Frequency")

    datatable(topic_print,
              rownames = F,
              extensions = 'Buttons',
              options = list(
                scrollX = T,
                searching = T,
                dom = 'frtpB',
                buttons = c('copy')
              ) #close list
    ) # close data table

  }) #close datatable

  output$topic_terms = renderDataTable({

    if (input$pick_model == "LDA_fit"){
      term_print = terms(LDA_fit, input$noterms)
    }

    if (input$pick_model == "LDA_fixed"){
      term_print = terms(LDA_fixed, input$noterms)
    }

    if (input$pick_model == "LDA_gibbs"){
      term_print = terms(LDA_gibbs, input$noterms)
    }

    if(input$pick_model == "CTM_fit"){
      term_print = terms(CTM_fit, input$noterms)
    }

    datatable(term_print,
              extensions = 'Buttons',
              options = list(
                scrollX = T,
                searching = T,
                dom = 'frtpB',
                buttons = c('copy')
              ) #close list
    ) # close data table

  }) #close datatable

  output$beta_plot = renderPlot({

    if (input$pick_model == "LDA_fit"){
     LDA_fit_topics = tidy(LDA_fit, matrix = "beta")
     top_terms <<- LDA_fit_topics %>%
       group_by(topic) %>%
       top_n(10, beta) %>%
       ungroup() %>%
       arrange(topic, -beta)
     }

   if (input$pick_model == "LDA_fixed"){
     LDA_fix_topics = tidy(LDA_fixed, matrix = "beta")
     top_terms <<- LDA_fix_topics %>%
       group_by(topic) %>%
       top_n(10, beta) %>%
       ungroup() %>%
       arrange(topic, -beta)
     }

   if (input$pick_model == "LDA_gibbs"){
     LDA_gibbs_topics <<- tidy(LDA_gibbs, matrix = "beta")
     top_terms = LDA_gibbs_topics %>%
       group_by(topic) %>%
       top_n(10, beta) %>%
       ungroup() %>%
       arrange(topic, -beta)
     }

   if (input$pick_model == "CTM_fit"){
     CTM_fit_topics <<- tidy(CTM_fit, matrix = "beta")
     top_terms = CTM_fit_topics %>%
       group_by(topic) %>%
       top_n(10, beta) %>%
       ungroup() %>%
       arrange(topic, -beta)
   }

    top_terms %>%
      mutate(term = reorder(term, beta)) %>%
      ggplot(aes(term, beta, fill = factor(topic))) +
      geom_bar(stat = "identity", show.legend = FALSE) +
      facet_wrap(~ topic, scales = "free") +
      cleanup +
      coord_flip()
  })
     
}  #close server  

# Run the application 
shinyApp(ui = ui, server = server)