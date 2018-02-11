library(shiny)
library(DT)
library(MOTE)
library(plyr)
options(scipen = 999)

##fix this part here when the new values are avaliable 
#doublewordtable$Minimum[6:10] = c(apa(apply(doubleworddata[ , 3:7], 2, min, na.rm = T), 2))
#doublewordtable$Maximum[6:10] = c(apa(apply(doubleworddata[ , 3:7], 2, max, na.rm = T), 2))
#doublewordtable$M[6:10] = c(apa(apply(doubleworddata[ , 3:7], 2, mean, na.rm = T), 2))
#doublewordtable$SD[6:10] = c(apa(apply(doubleworddata[ , 3:7], 2, sd, na.rm = T), 2))


ui = fluidPage(
  selectInput("Nselect", "Select N Scaling:",
              c("N" = "N",
                "Log N" = "log")),
  
  htmlOutput("slider_selector")) # ... other stuff)

server = function(input, output) {
  output$slider_selector = renderUI({
    
    if (input$Nselect == "N") { minN = 10; maxN = 1000; stepN = 10}
    if (input$Nselect == "log") { minN = round(log(10),1) 
    maxN = round(log(1000),1)
    stepN = .1}
    
    sliderInput("xaxisrange", "X-Axis Range:",
                min = minN, max = maxN,
                value = c(minN,maxN),
                sep = "",
                round = -1,
                step = stepN)
    
  }
)
}
shinyApp(ui, server)