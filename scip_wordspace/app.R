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

# Source Files ------------------------------------------------------------
source("data_tab.R")
source("ourdata_tab.R")

# Define UI ---------------------------------------------------------------
ui <- dashboardPage(
  dashboardHeader(title = "Word Space Creator"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("1. Upload Data", tabName = "data_tab"),
      menuItem("2. Use Our Data", tabName = "ourdata_tab")
    )
  ),
  dashboardBody(
    tabItems(
      data_tab,
      ourdata_tab
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
    dat()
    datatable(dataset, rownames = F)
  
   load("TASA.rda")
   load("EN_100k.rda")
   load("EN_100k_lsa.rda")
   
  })
  }

# Run the application 
shinyApp(ui = ui, server = server)