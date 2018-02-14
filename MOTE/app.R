####Measure of the Effect: A Shiny App using the MOTE library####
##Developed by: Erin M. Buchanan, Will Padfield, Abbie Van Nuland, Addie Wikowsky
##MOTE library maintained by Erin M. Buchanan, John E. Scofield, K.D. Valentine

####libraries####
library(shiny)
library(MOTE)

####user interface####
ui <- fluidPage(
  
  ####make the navbar pages####
  shinyUI(
    navbarPage("MOTE",
               navbarMenu("Mean Differences",
                          tabPanel("Z-Test - Means",
                                   source("ztestM_page.R")$value),
                          tabPanel("Z-Test - Z",
                                   source("ztestZ_page.R")$value),
                          tabPanel("Single Sample t - Means",
                                   source("singletM_page.R")$value),
                          tabPanel("Single Sample t - t",
                                   source("singletT_page.R")$value),
                          tabPanel("Dependent t Averages - Means",
                                   source("deptavgM_page.R")$value),
                          tabPanel("Dependent t Differences - Means",
                                   source("deptdiffM_page.R")$value),
                          tabPanel("Dependent t Differences - t",
                                   source("deptT_page.R")$value),
                          tabPanel("Dependent t Repeated Measures - Means",
                                   source("deptrmM_page.R")$value),
                          tabPanel("Independent t - Means",
                                   source("indtM_page.R")$value),
                          tabPanel("Independent t - t",
                                   source("indtT_page.R")$value),
                          tabPanel("Independent t Delta - Means",
                                   source("indtD_page.R")$value),
                          tabPanel("Independent t g - Means",
                                   source("indtG_page.R")$value),
                          tabPanel("Independent Proportions",
                                   source("prop_page.R")$value)
               ), ##close navbarMenu
               
               navbarMenu("Variance Overlap",
                          tabPanel("d to r"),
                          tabPanel("r"),
                          tabPanel("Eta"),
                          tabPanel("Partial Eta"),
                          tabPanel("Generalized Eta"),
                          tabPanel("Omega"),
                          tabPanel("Partial Omega"),
                          tabPanel("Epsilon"),
                          tabPanel("Chi-square V"),
                          tabPanel("Chi-square Odds")
               ) ##close navbarMenu
    ) ##close navbarpage
  ) ##close shinyUI
  
) ## close fluid page


####server section####
server <- function(input, output) {
  
  ##math goes here
  
  ####z test from means####
  output$ZMsummary <- renderText({ 
    
    ##check for N
    if (input$ZMdf != "") {
      n = as.numeric(input$ZMdf) + 1
    } else { n = as.numeric(input$ZMn) }
    
    ##check for SE
    if (input$ZMse1 != "") {
      sd1 = as.numeric(input$ZMse1) * sqrt(n)
    } else { sd1 = as.numeric(input$ZMsd1) }
    
    d = (as.numeric(input$ZMmean1)-as.numeric(input$ZMmean2)) / sd1
    dll = as.numeric(d)-qnorm(as.numeric(input$ZMalpha), lower.tail = F)*sd1/sqrt(n)
    dul = as.numeric(d)+qnorm(as.numeric(input$ZMalpha), lower.tail = F)*sd1/sqrt(n)
    
    paste("d = ", apa(d, 3),
          ", ", (1-as.numeric(input$ZMalpha))*100, "% CI[", apa(dll, 3), 
          " - ", apa(dul, 3), "]", sep = "")
    
  }) ##close z from means
  
  ####dependent t from t####
  output$DTTsummary <- renderText({ 
    
    ##check for N
    if (input$DTTdf != "") {
      n = as.numeric(input$DTTdf) + 1
    } else { n = as.numeric(input$DTTn) }
    
    dscore = d.dep.t.diff.t(as.numeric(input$DTTtscore),
                            n, as.numeric(input$DTTalpha))
    
    paste("d = ", apa(dscore$d, 3),
          ", ", (1-as.numeric(input$DTTalpha))*100, "%[", apa(dscore$dlow, 3), 
          " - ", apa(dscore$dhigh, 3), "]", sep = "")
    
  }) #close deptt.from.tAPA
  
output$ITMsummary <- renderText({ 
    
    ##check for SE1
    if (input$ITMse1 != "") {
      sd1 = as.numeric(input$ITMse1) * sqrt(input$ITMn)
    } else { sd1 = as.numeric(input$ITMsd1) }
    
    ##check for SE2
    if (input$se2 != "") {
      sd2 = as.numeric(input$ITMse2) * sqrt(input$ITMn2)
    } else { sd2 = as.numeric(input$ITMsd2) }
    
    dscore = d.ind.t(as.numeric(input$ITMmean1), as.numeric(input$ITMmean2),
                         sd1, sd2, as.numeric(input$ITMn), as.numeric(input$ITMn2), as.numeric(input$ITMalpha))
    
    paste("d = ", apa(dscore$d, 3),
          ", ", (1-as.numeric(input$ITMalpha))*100, "%[", apa(dscore$dlow, 3), 
          " - ", apa(dscore$dhigh, 3), "]", sep = "")
    
  }) #close ITM
  
  
} ##close server

# Run the application 
shinyApp(ui = ui, server = server)