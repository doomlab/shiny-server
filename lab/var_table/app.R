library(shiny)
library(DT)
library(MOTE)
options(scipen = 999)

singlewordtable = read.csv("../SingleWordTab.csv")
singleworddata = read.csv("../single_word.csv")
singleworddata$Length1 = as.numeric(singleworddata$Length1)

singlewordtable$Minimum = c(apa(apply(singleworddata[ , 2:9], 2, min, na.rm = T), 2), 
                            NA, apa(apply(singleworddata[ , 11:15], 2, min, na.rm = T), 2))
singlewordtable$Maximum = c(apa(apply(singleworddata[ , 2:9], 2, max, na.rm = T), 2), 
                            NA, apa(apply(singleworddata[ , 11:15], 2, max, na.rm = T), 2))
singlewordtable$M = c(apa(apply(singleworddata[ , 2:9], 2, mean, na.rm = T), 2), 
                      NA, apa(apply(singleworddata[ , 11:15], 2, mean, na.rm = T), 2))
singlewordtable$SD = c(apa(apply(singleworddata[ , 2:9], 2, sd, na.rm = T), 2), 
                       NA, apa(apply(singleworddata[ , 11:15], 2, sd, na.rm = T), 2))


  ui = fluidPage(
    titlePanel("Single Words Variable List"),
    DTOutput('tbl'))
  
  server = function(input, output) {
    output$tbl = renderDT(
      singlewordtable, 
      extensions = 'Responsive',
      options = list(
        dom = 'tp'
      ),
      rownames = FALSE
      
    )
  }

shinyApp(ui, server)