#Shiny Word Space App for SCIP 2018
#Written by Erin M. Buchanan, ... add your names here

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

# Figure out this step LSA ----------------------------------------------------

#just to get this nonsense working 
importdf = read.csv('exam_answers.csv', header = F, stringsAsFactors = F)

##if own file imported
#Create a corpus from a vector of documents
#therefore the data needs to be a column in a DF that includes all the text files
import_corpus = Corpus(VectorSource(importdf$V1)) 

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
import_lsa <<- lsa(import_weight)

#Convert to textmatrix for coherence
import_lsa <<- as.textmatrix(import_lsa)


# Figure out this step topics ---------------------------------------------

library(tm)
library(topicmodels)
library(slam)
library(lsa)

##just some example data so you can see
importdf = read.csv('exam_answers.csv', header = F, stringsAsFactors = F)

##if own file imported
#Create a corpus from a vector of documents
#therefore the data needs to be a column in a DF that includes all the text files
import_corpus = Corpus(VectorSource(importdf$V1)) 

#create corpus textmatrix
import_mat = DocumentTermMatrix(import_corpus,
                                control = list(stemming = TRUE, stopwords = TRUE, minWordLength = 3,
                                               removeNumbers = TRUE, removePunctuation = TRUE)) 

#weighting scheme
import_weight = tapply(import_mat$v/row_sums(import_mat)[import_mat$i], import_mat$j, mean) *
  log2(nDocs(import_mat)/col_sums(import_mat > 0))

#ignore very frequent and 0 terms
import_mat = import_mat[ , import_weight >= .1]
import_mat = import_mat[ row_sums(import_mat) > 0, ]

#make the user pick a number of topics
k = 5
SEED = 2010

LDA_fit <<- LDA(import_mat, k = k, control = list(seed = SEED))
LDA_fixed <<- LDA(import_mat, k = k, control = list(estimate.alpha = FALSE, seed = SEED))
LDA_gibbs <<- LDA(import_mat, k = k, method = "Gibbs", 
                control = list(seed = SEED, burnin = 1000, thin = 100, iter = 1000))
CTM_fit <<- CTM(import_mat, k = k, 
              control = list(seed = SEED, 
                             var = list(tol = 10^-4), 
                             em = list(tol = 10^-3)))

alltogether <<- list(LDA_fit, LDA_fixed, LDA_gibbs, CTM_fit)

# Source Files ------------------------------------------------------------
source("data_tab.R")
source("ourdata_tab.R")
source("lsa_tab_single.R")
source("lsa_tab_multiple.R")

# Define UI ---------------------------------------------------------------
ui <- dashboardPage(
  dashboardHeader(title = "Word Space Creator"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("1. Upload Data", tabName = "data_tab"),
      menuItem("2. Use Our Data", tabName = "ourdata_tab"),
      menuItem("3. LSA Single Word Functions", tabName = "lsa_tab_single"),
      menuItem("4. LSA Multiple Word Functions", tabName = "lsa_tab_multiple")
    )
  ),
  dashboardBody(
    tabItems(
      data_tab,
      ourdata_tab,
      lsa_tab_single,
      lsa_tab_multiple
      ) # end tabItems
    ) # end dashboardBody
  ) # end dashboardPage

# Define server logic -----------------------------------------------------

server <- function(input, output) {
  
  # Load Data ---------------------------------------------------------------
  dat <- reactive({
    inFile <<- input$inFile
    if (is.null(inFile)) return(NULL)
    
    file_extension <- tools::file_ext(inFile$datapath)
    if (file_extension == "csv") {
      rawdata <<- read.csv(inFile$datapath, header = input$header,
                           stringsAsFactors = F)
    } else if (file_extension %in% c("xls", "xlsx")) {
      rawdata <<- as.data.frame(readxl::read_excel(inFile$datapath, 
                                                   col_names = input$header))
    } else if (file_extension %in% c("sav")) {
      rawdata <<- haven::read_sav(inFile$datapath)
    } else if (file_extension %in% c("sas")) {
      rawdata <<- haven::read_sas(inFile$datapath)
    }
    
    #save file name as global variable for writing
    file_name <<- gsub(paste0("." , file_extension), "", inFile$name)
    
  }) #close dat
  
  # Output the table --------------------------------------------------------
  
  output$rawdata_table <- renderDataTable({
    dat()
    datatable(rawdata, rownames = F)
  }) #close renderDT
  
  output$ourdata_table = renderDataTable({
    
    #pull in the information from the ourdata_tab input$pick_data
    if (input$pick_data == "TASA"){
      load("TASA.rda")
      prelsa_data = TASA
      rm(TASA)
    }
    if (input$pick_data == "EN"){
      load("EN_100k.rda")
      prelsa_data = EN
      rm(EN)
    }
    if (input$pick_data == "ENLSA"){
      load("EN_100k_lsa.rda")
      prelsa_data = ENLSA
      rm(ENLSA)
    }
    
    datatable(prelsa_data[1:10, 1:10], rownames = T)
  
   
  }) #close renderDataTable
  
  # Single Words LSA Functions ----------------------------------------------

    output$lsa_plotneighbors = renderPlot({
    plot_neighbors(input$rownames_select, 
                   n = input$neighbors, 
                   tvectors = import_lsa, 
                   method = "MDS", 
                   dims = 2)
      cleanup = theme(panel.grid.major = element_blank(), 
                      panel.grid.minor = element_blank(), 
                      panel.background = element_blank(), 
                      axis.line.x = element_line(color = "black"),
                      axis.line.y = element_line(color = "black"),
                      legend.key = element_rect(fill = "white"),
                      text = element_text(size = 15))
      output$neighbor_plot = renderPlot({
        neighbor_plot = ggplot(import_lsa, aes(x,y))
        neighbor_plot + 
          cleanup +
          geom_point() + 
          xlab("Dimension 1") +
          ylab("Dimension 2")
      })
      }) #close plot
  
  output$lsa_choosetarget = renderDataTable({
    targets = as.data.frame(choose.target(input$rownames_select,
                  lower = input$select_range[1],
                  upper = input$select_range[2],
                  n = input$neighbors,
                  tvectors = import_lsa))
    colnames(targets) = "cosine"
    
    datatable(targets)
  }) #close renderDT
  
  # Multiword LSA functions -------------------------------------------------

  output$lsa_multicos = renderDataTable({
    
    datatable(multicos(input$tags, tvectors=import_lsa))
    
  })
  
  output$lsa_plotwordlist = renderPlot({
    
    plot_wordlist(input$tags,
                  method = "MDS", 
                  dims = 2,
                  tvectors = import_lsa)
    
  })

  
  }

# Run the application 
shinyApp(ui = ui, server = server)