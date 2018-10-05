#Shiny Word Space App for SCIP 2018
#Written by Erin M. Buchanan, ... add your names here

# Load Libraries ----------------------------------------------------------
library(shiny)
library(lsa)
library(LSAfun)
library(haven)
library(readr)
library(shinydashboard)

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
  # TASA <- load("TASA.rda")
  # EN = load("EN_100k.rda")
  # ENLSA = load("EN_100k_lsa.rda")  

  }

# Run the application 
shinyApp(ui = ui, server = server)