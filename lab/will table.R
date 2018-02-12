#Tags Per Year

library(shiny)
library(ggplot2)
library(DT)
library(MOTE)
options(scipen = 999)
tag_table = read.csv("../lab_table.csv")


ui = fluidPage(
  titlePanel("Tags Per Year"),
  DTOutput('tbl'))

server = function(input, output) {
  output$tbl = renderDT(
    tag_table, 
    extensions = 'Responsive',
    options = list(
      dom = 'tp'
    ),
    rownames = FALSE
    
  )
}

shinyApp(ui, server)