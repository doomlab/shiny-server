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
   div(style = 'overflow-x: scroll', DTOutput("singletable"))
   ) #fluidpage

server <- function(input, output) {
   
   output$singletable <- renderDT(server = FALSE, {
     
     datatable(singleword,
               filter = 'top',
               rownames = FALSE,
               extensions = 'Buttons',
               options = list(
                 dom = 'rtpB',
                 buttons = c('copy', 'csv', 'excel')
               ) #close options
               ) #close data table 
     
   }) #close render DT
      
}

# Run the application 
shinyApp(ui = ui, server = server)

