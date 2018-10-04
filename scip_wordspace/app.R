library(shiny)
library(lsa)
library(LSAfun)
library(haven)
library(readr)

load("TASA.rda")
load("EN_100k.rda")
load("EN_100k_lsa.rda")

# Define UI
ui <- fluidPage(
  
  # Application title
  
  titlePanel("Word Visualization"),
  selectInput("dataset", "Data Set:",
              c("English LSA Space: TASA" = "TASA",
                "English HAL Space: BNC/ukWaC/Wikipedia" = "EN",
                "English LSA Space: BNC/ukWaC/Wikipedia" = "ENLSA")
  

    )
      
)

# Define server logic

TASA <- load("TASA.rda")
EN = load("EN_100k.rda")
ENLSA = load("EN_100k_lsa.rda")

server <- function(input, output) {
  

  }







# Run the application 
shinyApp(ui = ui, server = server)