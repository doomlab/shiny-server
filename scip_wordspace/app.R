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

# Source Files ------------------------------------------------------------
source("data_tab.R")
source("ourdata_tab.R")
source("lsa_tab.R")


# Figure out this step ----------------------------------------------------

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
import_lsa = lsa(import_weight)

#Convert to textmatrix for coherence
import_lsa = as.textmatrix(import_lsa)

# Define UI ---------------------------------------------------------------
ui <- dashboardPage(
  dashboardHeader(title = "Word Space Creator"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("1. Upload Data", tabName = "data_tab"),
      menuItem("2. Use Our Data", tabName = "ourdata_tab"),
      menuItem("3. LSA", tabName = "lsa_tab")
    )
  ),
  dashboardBody(
    tabItems(
      data_tab,
      ourdata_tab,
      lsa_tab
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
  }

# Run the application 
shinyApp(ui = ui, server = server)