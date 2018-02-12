library(shiny)
library(DT)
library(MOTE)
options(scipen = 999)

doublewordtable = read.csv("../DoubleWordTab.csv")
doubleworddata = read.csv("../double_words.csv")

##fix this part here when the new values are avaliable 
doublewordtable$Minimum[3:10] = c(apa(apply(doubleworddata[ , 3:10], 2, min, na.rm = T), 2))
doublewordtable$Maximum[3:10] = c(apa(apply(doubleworddata[ , 3:10], 2, max, na.rm = T), 2))
doublewordtable$M[3:10] = c(apa(apply(doubleworddata[ , 3:10], 2, mean, na.rm = T), 2))
doublewordtable$SD[3:10] = c(apa(apply(doubleworddata[ , 3:10], 2, sd, na.rm = T), 2))


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