library(shiny)
library(DT)
library(MOTE)
options(scipen = 999)

stimwordtable = read.csv("../StimWordTab.csv")
stimworddata = read.csv("../lab_table.csv")

type1 = stimworddata[ , c("no1", "type1")]
type2 = stimworddata[ , c("no2", "type2")]
colnames(type2) = c("no1", "type1")
stimworddata = rbind(type1, type2)
stimworddata = subset(stimworddata, type1 != "")
stimworddata$type1 = droplevels(stimworddata$type1)
stimworddata$type1 = factor(stimworddata$type1, 
                            levels = stimwordtable$Stimuli)

stimwordtable$N = table(stimworddata$type1)

stimwordtable$Minimum = apa(tapply(stimworddata$no1, stimworddata$type1, min, na.rm = T),2)
stimwordtable$Maximum = apa(tapply(stimworddata$no1, stimworddata$type1, max, na.rm = T),2)
stimwordtable$M = apa(tapply(stimworddata$no1, stimworddata$type1, mean, na.rm = T),2)
stimwordtable$SD = apa(tapply(stimworddata$no1, stimworddata$type1, sd, na.rm = T),2)

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