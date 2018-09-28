# DataSpice 2.0 written by Erin M. Buchanan altering the great work by the rOpenSci group
# Code also borrowed from ddcreator
library(shiny)
library(shinydashboard)
library(DT)
library(rhandsontable)
library(jsonlite)
library(knitr)
library(kableExtra)

# Interface files ---------------------------------------------------------
source("data_tab.R")
source("ds_functions.R")
source("attributes_tab.R")
source("access_tab.R")
source("bib_tab.R")
source("creators_tab.R")
source("json_tab.R")
source("write_spice.R")
source("report_tab.R")
source("PropertyValue.R")
source("Person.R")

# Global Variables --------------------------------------------------------
rawdata <- NULL
file_name <- NULL
inFile <- NULL
bib_df_final <- NULL
access_df_final <- NULL
creators_df_final <- NULL
attributes_df_final <- NULL

# Interface ---------------------------------------------------------------

ui <- dashboardPage(
  dashboardHeader(title = "Data Spice 2.0"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("1. Upload Data", tabName = "data_tab"),
      menuItem("2. Edit Attribues", tabName = "attributes_tab"),
      menuItem("3. Edit Access", tabName = "access_tab"),
      menuItem("4. Edit Bibliography", tabName = "bib_tab"),
      menuItem("5. Edit Creators", tabName = "creators_tab"),
      menuItem("6. Create json", tabName = "json_tab"),
      menuItem("7. View Report", tabName = "report_tab")
    )
  ),
  dashboardBody(
    tabItems(
      data_tab,
      attributes_tab,
      access_tab,
      bib_tab,
      creators_tab,
      json_tab,
      report_tab
    ) # end tabItems
  ) # end dashboardBody
) # end dashboardPage


# Server ------------------------------------------------------------------

server <- function(input, output, session) { 
  
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
  

  # Attributes Table Editing ------------------------------------------------
  
  values <- reactiveValues()
  
  # output for attributes table
  output$hot_attributes <- renderRHandsontable({
    
    # update the attributes data
    attributes_df <- tibble::add_row(attributes_df,
                                     variableName = names(rawdata),
                                     fileName = file_name)
    # pad if no data
    if(nrow(attributes_df) == 0){
      attributes_df <- dplyr::add_row(attributes_df)
    }
    
    #make pretty table  
    rhandsontable(attributes_df,
                  useTypes = TRUE,
                  stretchH = "all") %>%
      hot_context_menu(allowColEdit = FALSE)
  })
  
  ## Save
  observeEvent(input$save_attributes, {
    finalDF <- hot_to_r(input$hot_attributes)
    attributes_df_final <<- finalDF
    # remove padding if none edited
    finalDF %>%
      dplyr::filter_all(dplyr::any_vars(!is.na(.))) %>%
      write.csv(file = "attributes.csv")
  })
  

  # Access Table Editing ----------------------------------------------------------
  
  # output for access table
  output$hot_access <- renderRHandsontable({
    
    # update the access data
    access_df <- tibble::add_row(access_df, fileName = file_name, 
                                 name = file_name,
                                 contentUrl = NA,
                                 fileFormat = tools::file_ext(inFile$datapath))
    
    #make pretty table  
    rhandsontable(access_df,
                  useTypes = TRUE,
                  stretchH = "all") %>%
      hot_context_menu(allowColEdit = FALSE)
  })
  
  ## Save
  observeEvent(input$save_access, {
    finalDF <- hot_to_r(input$hot_access)
    access_df_final <<- finalDF
    # remove padding if none edited
    finalDF %>%
      dplyr::filter_all(dplyr::any_vars(!is.na(.))) %>%
      write.csv(file = "access.csv")
  })

  # Bib Table Editing ----------------------------------------------------------
  
  # output for bib table
  output$hot_bib <- renderRHandsontable({
    
    # update the bib data
    bib_df <- tibble::add_row(bib_df,
                                title = file_name)
    
    #make pretty table  
    rhandsontable(bib_df,
                  useTypes = TRUE,
                  stretchH = "all") %>%
      hot_context_menu(allowColEdit = FALSE)
  })
  
  ## Save
  observeEvent(input$save_bib, {
    finalDF <- hot_to_r(input$hot_bib)
    bib_df_final <<- finalDF
    # remove padding if none edited
    finalDF %>%
      dplyr::filter_all(dplyr::any_vars(!is.na(.))) %>%
      write.csv(file = "bib.csv")
  })
  
  # Creator Table Editing ----------------------------------------------------------
  
  # output for creators table
  output$hot_creators <- renderRHandsontable({
    
    # update the creators data
    creators_df <- tibble::add_row(creators_df,
                              id = "your ORC ID",
                              givenName = "First Name", 
                              familyName = "Last Name")
    
    #make pretty table  
    rhandsontable(creators_df,
                  useTypes = TRUE,
                  stretchH = "all") %>%
      hot_context_menu(allowColEdit = FALSE)
  })
  
  ## Save
  observeEvent(input$save_creators, {
    finalDF <- hot_to_r(input$hot_creators)
    creators_df_final <<- finalDF
    # remove padding if none edited
    finalDF %>%
      dplyr::filter_all(dplyr::any_vars(!is.na(.))) %>%
      write.csv(file = "creators.csv")
  })
  

  # Create json format ------------------------------------------------------

  # output for creators table
  output$print_json <- renderText({
    write_spice(creators_df_final, access_df_final,
                attributes_df_final, bib_df_final, inFile$datapath)
  })
  
  ## Save
  observeEvent(input$save_json, {
    
    write(
    write_spice(creators_df_final, access_df_final,
                attributes_df_final, bib_df_final, inFile$datapath),
    file = "dataspice_complete.json") #write out json file
  })
  

  # Create Text output ------------------------------------------------------

  title_report <- reactive({
    
    if (!is.null(bib_df_final)){
      paste("Report for", bib_df_final$title, sep = " ")
    }else {"Waiting for information."}
    
  })

  report_report <- reactive({
  
  if(!is.null(bib_df_final) & 
     !is.null(access_df_final) &
     !is.null(attributes_df_final) &
     !is.null(creators_df_final))
  {
    HTML(paste(
    #section printing bib information
    "<h4>Dataset information: </h4><p>",  
    #bib table
    kable(bib_df_final, format = "html", 
          col.names = c("Title", "Description", "Date Published", "Citation",
                         "Keywords", "License", "Funder", "Geographic Information",
                         "Start Date", "End Date")) %>% kable_styling(),
    "<p>",
    #section printing access information
    "<h4>Accessing the Data: </h4><p>",
    #access table
    kable(access_df_final, format = "html",
          col.names = c("File Name", "Name of Data", "URL", "File Format")) %>% kable_styling(), 
    "<p>",
    #section printing authors
    "<h4>Authors: </h4><p>",
    #creators table
    kable(creators_df_final, format = "html",
          col.names = c("ORC-Id", "First Name", "Last Name", 
                        "Affliation", "Email")) %>% kable_styling(),
    "<p>",
    #section printing attributes
    "<h4>Data Attributes: </h4><p>",
    #attributes table
    kable(attributes_df_final[,-1], format = "html",
          col.names = c("Variable Name", "Description", "Units of Measure")) %>% kable_styling(),
    sep = ""
    )) #end paste
  }else{ "Waiting for information."}

  })
      
  output$title <- renderText(title_report())
  output$report <- renderUI(report_report())
  
  ## Save
  observeEvent(input$save_report, {
    
    write(report_report(),
      file = "report.html") #write out json file
  })


} # end server()

shinyApp(ui, server)
