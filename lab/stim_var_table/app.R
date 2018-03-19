library(shiny)
library(DT)
options(scipen = 999)

stimwordtable = read.csv("../StimWordTab.csv")
stimworddata = read.csv("../lab_table.csv")

stimwordtable$Minimum = c(apa(apply(stimworddata[ , 2:9], 2, min, na.rm = T), 2), 
                            NA, apa(apply(stimworddata[ , 11:15], 2, min, na.rm = T), 2))
stimwordtable$Maximum = c(apa(apply(stimworddata[ , 2:9], 2, max, na.rm = T), 2), 
                            NA, apa(apply(stimworddata[ , 11:15], 2, max, na.rm = T), 2))
stimwordtable$M = c(apa(apply(stimworddata[ , 2:9], 2, mean, na.rm = T), 2), 
                      NA, apa(apply(stimworddata[ , 11:15], 2, mean, na.rm = T), 2))
stimwordtable$SD = c(apa(apply(stimworddata[ , 2:9], 2, sd, na.rm = T), 2), 
                       NA, apa(apply(stimworddata[ , 11:15], 2, sd, na.rm = T), 2))



  ui = fluidPage(
    titlePanel("Stimuli Variable List"),
    DTOutput('tbl'))
  
  server = function(input, output) {
    output$tbl = renderDT(
      stimwordtable, 
      extensions = 'Responsive',
      options = list(
        dom = 'tp'
      ),
      rownames = FALSE
      
    )
  }

shinyApp(ui, server)