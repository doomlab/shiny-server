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
                          tabPanel("Z-Test",
                                   source("ztest_page.R")),
                          tabPanel("Single Sample t - Means"),
                          tabPanel("Single Sample t - t"),
                          tabPanel("Dependent t Averages - Means",
                                   source("deptavg_page.R")),
                          tabPanel("Dependent t Differences - Means"),
                          tabPanel("Dependent t Differences - t"),
                          tabPanel("Dependent t Repeated Measures - Means"),
                          tabPanel("Independent t - Means"),
                          tabPanel("Independent t - t"),
                          tabPanel("Independent t Delta - Means"),
                          tabPanel("Independent t g - Means"),
                          tabPanel("Independent Proportions")
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
  
  ####z test####
  output$zAPA <- renderText({ 
    library(MOTE)
    
    d = (as.numeric(input$mean1)-as.numeric(input$mean2))/as.numeric(input$sd1)
    dll = as.numeric(d)-qnorm(as.numeric(input$alpha))*as.numeric(input$se1)
    dul = as.numeric(d)+qnorm(as.numeric(input$alpha), lower.tail = F)*as.numeric(input$se1)
    
    paste("d = ", apa(d, 3),
          ", ", (1-as.numeric(input$alpha))*100, "%[", apa(dll, 3), 
          " - ", apa(dul, 3), "]", sep = "")
  }) ##close z test
  
  ####dependent t with average standard deviation####
  output$davAPA <- renderText({ 
    
    ##check for N
    if (input$df != "") {
      n = as.numeric(input$df) + 1
    } else { n = as.numeric(input$n) }
    
    ##check for SE1
    if (input$se1 != "") {
      sd1 = as.numeric(input$se1) * sqrt(n)
    } else { sd1 = as.numeric(input$sd1) }
    
    ##check for SE2
    if (input$se2 != "") {
      sd2 = as.numeric(input$se2) * sqrt(n)
    } else { sd2 = as.numeric(input$sd2) }
    
    dscore = d.dep.t.avg(as.numeric(input$mean1), as.numeric(input$mean2),
                         sd1, sd2, n, as.numeric(input$alpha))
    
    paste("d = ", apa(dscore$d, 3),
          ", ", (1-as.numeric(input$alpha))*100, "%[", apa(dscore$dlow, 3), 
          " - ", apa(dscore$dhigh, 3), "]", sep = "")
    
  }) #close davAPA
  

  ####dependent t with difference score standard deviation####
  output$d.dep.t.diffAPA <- renderText({ 
    
    ##check for N
    if (input$df != "") {
      n = as.numeric(input$df) + 1
    } else { n = as.numeric(input$n) }
    
    ##check for sediff
    if (input$sediff != "") {
      sddiff = as.numeric(input$sediff) * sqrt(n)
    } else { sddiff = as.numeric(input$sddiff) }
    dscore = d.dep.t.avg(as.numeric(input$meandiff),
                         sddiff, n, as.numeric(input$alpha))
    
    paste("d = ", apa(dscore$d, 3),
          ", ", (1-as.numeric(input$alpha))*100, "%[", apa(dscore$dlow, 3), 
          " - ", apa(dscore$dhigh, 3), "]", sep = "")
    
  }) #close d.dep.t.diffAPA
  
  ####dependent t from t####
  output$deptt.from.tAPA <- renderUI({
    definition = "Definition: <br> This t-test is a comparison of two means 
    given by an existing value for t.",
    effectsize = "<br>Cohen's d is an indication of the magnitude of an effect for t-tests.
    It is the difference in means given in terms of standard deviations.",
    confidenceinterval = "<br>The 95% confidence interval is the range for which 
    we can expect to find the population mean 95% of the time."
    if (dscore$dlow < 0 & dscore$dhigh > 0) {
      cioutput = "As the CI contains 0, we probably cannot conclude
      that the effect is different from 0." ##confidence interval includes zero
    } if (dscore$dlow > 0 & dscore$high < 0) {
      cioutput = "As the CI contains 0, we probably cannot conclude
      that the effect is different from 0."##confidence interval includes zero
    } else {
      cioutput = "As the CI does not contain 0, one might conclude
      the effect is different from 0.", ##confidence interval does not include zero
      teststatistic = "Brief interpretation of test statistic:"
    } if (dscore$p < alpha) {
      tstatoutput = "The p-value is less than the given alpha level.
      This test would traditionally be considered significant"
    } else (dscore$p >= alpha) { 
      tstatoutput = "The p-value does not fall below the alpha level.
      This test would not traditionally be considered significant."}
    
  }) #close deptt.from.tAPA
  
  ####Summary of dept t diff####
    output$tdiff <- renderUI({
      definition = "Definition: <br> This t-test is a comparison of two means 
taking into account differences in standard deviation and/or standard error",
      effectsize = "<br>Cohen's d is an indication of the magnitude of an effect for t-tests.
      It is the difference in means given in terms of standard deviations.",
      confidenceinterval = "<br>The 95% confidence interval is the range for which 
      we can expect to find the population mean 95% of the time."
      if (dscore$dlow < 0 & dscore$dhigh > 0) {
        cioutput = "As the CI contains 0, we probably cannot conclude
that the effect is different from 0." ##confidence interval includes zero
      } if (dscore$dlow > 0 & dscore$high < 0) {
        cioutput = "As the CI contains 0, we probably cannot conclude
that the effect is different from 0."##confidence interval includes zero
      } else {
        cioutput = "As the CI does not contain 0, one might conclude
the effect is different from 0.", ##confidence interval does not include zero
        teststatistic = "Brief interpretation of test statistic:"
      } if (dscore$p < alpha) {
        tstatoutput = "The p-value is less than the given alpha level.
        This test would traditionally be considered significant"
      } else (dscore$p >= alpha) { 
        tstatoutput = "The p-value does not fall below the alpha level.
        This test would not traditionally be considered significant."}

      paste(definite, cioutput, teststatistic, sep = “ ”) #????
    }) ## end render UI 
      
    
    
    
  }) #Close renderUI, close summary of dept t diff
} ##close server

# Run the application 
shinyApp(ui = ui, server = server)

