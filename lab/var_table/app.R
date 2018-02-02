singlewordtable = read.csv("../SingleWordTab.csv")
singleworddata = read.csv("../single_word.csv")

singlewordtable$Minimum = apply(singleworddata[ , -1], 2, min, na.rm = T)
singlewordtable$Minimum = apply(singleworddata[ , -1], 2, max, na.rm = T)
singlewordtable$Minimum = apply(singleworddata[ , -1], 2, mean, na.rm = T)
singlewordtable$Minimum = apply(singleworddata[ , -1], 2, sd, na.rm = T)

library(ggplot2)
library(shiny)
library(DT)

  ui = fluidPage(DTOutput('tbl'))
  
  server = function(input, output) {
    output$tbl = renderDT(
      singlewordtable, options = list(lengthChange = FALSE)
    )
  }

shinyApp(ui, server)