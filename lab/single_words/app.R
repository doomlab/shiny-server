library(shiny)
library(DT)

singleword = read.csv("../single_word.csv")

ui <- fluidPage(
   titlePanel("Single Word Norms"),
   helpText("Please note the table loads slowly. 
            Use the search filters at the top of the table to 
            pick specific ranges of variables or categories. 
            A complete variable list can be found on the single 
            word norms page."),
   DTOutput("singletable")
   ) #fluidpage

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$singletable <- renderDT({
     
     datatable(singleword,
               filter = 'top',
               extensions = list('Scroller', "Buttons"),
               options = list(
                 dom = 'tB',
                 buttons = c('copy', 'csv', 'excel'),
                 scrollX = TRUE,
                 scrollY = 300,
                 scrollCollapse = TRUE,
                 paging = FALSE
               ) #close options
               ) #close data table 
     
   }) #close render DT
      
}

# Run the application 
shinyApp(ui = ui, server = server)

