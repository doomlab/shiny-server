library(shiny)
library(DT)
library(MOTE)
options(scipen = 999)

doublewordtable = read.csv("../DoubleWordTab.csv")
doubleworddata = read.csv("../double_words.csv")
doubleworddata$Length1 = as.numeric(doubleworddata$Length1)

doublewordtable$Minimum = c(apa(apply(doubleworddata[ , 2:9], 2, min, na.rm = T), 2), 
                            NA, apa(apply(doubleworddata[ , 11:15], 2, min, na.rm = T), 2))
doublewordtable$Maximum = c(apa(apply(doubleworddata[ , 2:9], 2, max, na.rm = T), 2), 
                            NA, apa(apply(doubleworddata[ , 11:15], 2, max, na.rm = T), 2))
doublewordtable$M = c(apa(apply(doubleworddata[ , 2:9], 2, mean, na.rm = T), 2), 
                      NA, apa(apply(doubleworddata[ , 11:15], 2, mean, na.rm = T), 2))
doublewordtable$SD = c(apa(apply(doubleworddata[ , 2:9], 2, sd, na.rm = T), 2), 
                       NA, apa(apply(doubleworddata[ , 11:15], 2, sd, na.rm = T), 2))


ui = fluidPage(
  titlePanel("Double Words Variable List"),
  DTOutput('tbl'))

server = function(input, output) {
  output$tbl = renderDT(
    doublewordtable, 
    extensions = 'Responsive',
    options = list(
      dom = 'tp'
    ),
    rownames = FALSE
    
  )
}

shinyApp(ui, server)