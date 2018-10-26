# DataSpice 2.0 written by Erin M. Buchanan altering the great work by the rOpenSciLabs group
# Code also borrowed from ddcreator by Lisa DeBruine, Alicia Moher, and Erin M. Buchanan
# Research Team: Sarah Crain, Arielle Cunningham, Hannah Johnson, Hannah Stash
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
      menuItem("2. Edit Attributes", tabName = "attributes_tab"),
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

  #values <- reactiveValues()

  # output for attributes table
  output$hot_attributes <- renderRHandsontable({

    if(!is.null(rawdata)){
    # update the attributes data
    attributes_df <- tibble::add_row(attributes_df,
                                     variableName = names(rawdata),
                                     fileName = file_name)
    } #close non-null data

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

  ## Message
  output$message_attributes <- renderUI({
    if(input$save_attributes==0){
      helpText("Hit the Save Changes button to save this file.")
    }else{
      helpText("The attributes file has been saved.")
    }
  })



  # Access Table Editing ----------------------------------------------------------

  ## output for access table
  output$hot_access <- renderRHandsontable({

    if(!is.null(rawdata)){
    # update the access data
    access_df <- tibble::add_row(access_df, fileName = file_name,
                                 name = file_name,
                                 contentUrl = NA,
                                 fileFormat = tools::file_ext(inFile$datapath))
    } #close non-null-data

    # pad if no data
    if(nrow(access_df) == 0){
      access_df <- dplyr::add_row(access_df)
    }

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

  ## Message
  output$message_access <- renderUI({
    if(input$save_access==0){
      helpText("Hit the Save Changes button to save this file.")
    }else{
      helpText("The access file has been saved.")
    }
  })

  # Bib Table Editing ----------------------------------------------------------

  # output for bib table
  output$hot_bib <- renderRHandsontable({

    if(!is.null(rawdata)){
    # update the bib data
    bib_df <- tibble::add_row(bib_df,
                              title = file_name)
    }

    # pad if no data
    if(nrow(bib_df) == 0){
      bib_df <- dplyr::add_row(bib_df)
    }

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

  ## Message
  output$message_bib <- renderUI({
    if(input$save_bib==0){
      helpText("Hit the Save Changes button to save this file.")
    }else{
      helpText("The bibliography file has been saved.")
    }
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

  ## Message
  output$message_creators <- renderUI({
    if(input$save_creators==0){
      helpText("Hit the Save Changes button to save this file.")
    }else{
      helpText("The creators file has been saved.")
    }
  })


  # Create json format ------------------------------------------------------

  # output for creators table
  output$print_json <- renderText({

    if(!is.null(bib_df_final) &
       !is.null(access_df_final) &
       !is.null(attributes_df_final) &
       !is.null(creators_df_final))
    {
    write_spice(creators_df_final, access_df_final,
                attributes_df_final, bib_df_final, inFile$datapath)
    } else { #only run if all files are there

      "Please save the Bibliography, Access, Attributes, and Creators file."

      }

  })

  ## Save
  observeEvent(input$save_json, {

    write(
      write_spice(creators_df_final, access_df_final,
                  attributes_df_final, bib_df_final, inFile$datapath),
      file = "dataspice_complete.json") #write out json file
  })

  ## Message
  output$message_json <- renderUI({
    if(input$save_json==0){
      helpText("Hit the Save Changes button to save this file.")
    }else{
      helpText("The json file has been saved.")
    }
  })



  # Create Text output ------------------------------------------------------

  title_report <- reactive({

    if (!is.null(bib_df_final)){
      paste("Report for", bib_df_final$title, sep = " ")
    }else {"Please save the Bibliography, Access, Attributes, and Creators file."}

  })

  report_report <- reactive({

  if(!is.null(bib_df_final) &
     !is.null(access_df_final) &
     !is.null(attributes_df_final) &
     !is.null(creators_df_final))
  {
    HTML(paste(
      #add css style sheet
    "<head><link type=\"text/css\" rel=\"stylesheet\" href=\"styles.css\"/></head>",
    "<body>",
    #section printing bib information
    "<h4>Dataset Information</h4><p>",
    #bib table
    kable(bib_df_final, format = "html",
          col.names = c("Title", "Description", "Date Published", "Citation",
                         "Keywords", "License", "Funder", "Geographic Information",
                         "Start Date", "End Date")) %>% kable_styling(position="left", bootstrap_options = c("striped", "hover")),
    "<p>",
    #section printing access information
    "<h4>Accessing the Data</h4><p>",
    #access table
    kable(access_df_final, format = "html",
          col.names = c("File Name", "Name of Data", "URL", "File Format")) %>% kable_styling(
            position="left", bootstrap_options = c("striped", "hover")
          ),
    "<p>",
    #section printing authors
    "<h4>Authors</h4><p>",
    #creators table
    kable(creators_df_final, format = "html",
          col.names = c("ORC-Id", "First Name", "Last Name",
                        "Affliation", "Email")) %>% kable_styling(position="left", bootstrap_options = c("striped", "hover")),
    "<p>",
    #section printing attributes
    "<h4>Data Attributes</h4><p>",
    #attributes table
    kable(attributes_df_final[,-1], format = "html",
          col.names = c("Variable Name", "Description", "Units of Measure")) %>% kable_styling(
            position="left", bootstrap_options = c("striped", "hover")),
    sep = ""),
    "</body>"
    ) #end paste
  }else{ "Waiting for information."}

  })

  output$title <- renderText(title_report())
  output$report <- renderUI(report_report())

  ## Save
  observeEvent(input$save_report, {

    write(report_report(),
          file = "report.html") #write out json file
  })

  ## Message
  output$message_report <- renderUI({
    if(input$save_report==0){
      helpText("Hit the Save Changes button to save this file.")
    }else{
      helpText("The report file has been saved.")
    }
  })



} # end server()

shinyApp(ui, server)
