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
<<<<<<< HEAD

  ####dependent t from t####
=======
  
  ####dependent t with difference score standard deviation####
  output$DTDMsummary <- renderText({ 
    
    ##check for N
    if (input$DTDMdfstuff != "") {
      n = as.numeric(input$DTDMdfstuff) + 1
    } else { n = as.numeric(input$DTDMnstuff) }
    
    ##check for sediff
    if (input$DTDMsediff != "" | !is.null(input$DTDMsediff)) {
      sddiff = as.numeric(input$DTDMsediff) * sqrt(n)
    } else { sddiff = as.numeric(input$DTDMsddiff) }
    
    dscore = d.dep.t.diff(as.numeric(input$DTDMmeandiff),
                         as.numeric(input$DTDMsddiff), n, as.numeric(input$DTDMalpha))
    
    paste("d = ", apa(dscore$d, 3),
              ", ", (1-as.numeric(input$alpha))*100, "%[", apa(dscore$dlow, 3), 
              " - ", apa(dscore$dhigh, 3), "]", sep = "")
    
  }) #close DTDM
  
   ####dependent t from t####
>>>>>>> 3c964c5825e53baf4c9c149b80b09fab407a6442
  output$DTTsummary <- renderText({ 
    
    ##check for N
    if (input$DTTdf != "") {
      n = as.numeric(input$DTTdf) + 1
    } else { n = as.numeric(input$DTTn) }
    
<<<<<<< HEAD
    DTTdscore = d.dep.t.diff.t(as.numeric(input$DTTtscore),
                               n, as.numeric(input$DTTalpha))
    
    paste("d = ", apa(DTTdscore$d, 3),
          ", ", (1-as.numeric(input$DTTalpha))*100, "%[", apa(DTTdscore$dlow, 3), 
          " - ", apa(DTTdscore$dhigh, 3), "]", sep = "")
    
  }) ##close dependent t from t  
=======
    dscore = d.dep.t.diff.t(as.numeric(input$DTTtscore),
                            n, as.numeric(input$DTTalpha))
    
    paste("d = ", apa(dscore$d, 3),
          ", ", (1-as.numeric(input$DTTalpha))*100, "%[", apa(dscore$dlow, 3), 
          " - ", apa(dscore$dhigh, 3), "]", sep = "")
    
  }) #close DTT
 
 ####dept RM####
  output$DTRMsummary <- renderText({ 
    
    ##check for N
    if (input$DTRMdf != "") {
      n = as.numeric(input$DTRMdf) + 1
    } else { n = as.numeric(input$DTRMn) }
    
    ##check for SE1
    if (input$DTRMse1 != "") {
      sd1 = as.numeric(input$DTRMse1) * sqrt(n)
    } else { sd1 = as.numeric(input$DTRMsd1) }
    
    dscore = d.dep.t.rm(as.numeric(input$DTRMmean1), as.numeric(input$DTRMmean2),
                        sd1, as.numeric(input$DTRMsd2), as.numeric(input$DTRMr), n, as.numeric(input$DTRMalpha))
                        
                        paste("d = ", apa(dscore$d, 3),
                              ", ", (1-as.numeric(input$DTRMalpha))*100, "%[", apa(dscore$dlow, 3), 
                              " - ", apa(dscore$dhigh, 3), "]", sep = "")
                        
  }) #close DTRM
   
  ####independent t from means#### 
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
  
  ####independent t from t####
output$ITTsummary <- renderText({ 
  
  dscore = d.ind.t.t(as.numeric(input$ITTt1),
                   as.numeric(input$ITTn1), as.numeric(input$ITTn2), as.numeric(input$ITTalpha))
  
  paste("d = ", apa(dscore$d, 3),
        ", ", (1-as.numeric(input$ITTalpha))*100, "%[", apa(dscore$dlow, 3), 
        " - ", apa(dscore$dhigh, 3), "]", sep = "")
}) #close ITT

####independent t delta####
output$ITDsummary <- renderText({ 
  ##check for SE
  if (input$ITDse2 != "") {
    ITDsd1 = as.numeric(input$ITDse2) * sqrt(ITDn1)
  } else { ITDsd1 = as.numeric(input$ITDsd1) }
  
  dscore = d.ind.t(as.numeric(input$ITDmean1), as.numeric(input$ITDmean2),
                   as.numeric(input$ITDsd1), as.numeric(input$ITDse1), 
                   as.numeric(input$ITDn), as.numeric(input$ITDn2), as.numeric(input$ITDalpha))
  
  paste("d = ", apa(dscore$d, 3),
        ", ", (1-as.numeric(input$ITDalpha))*100, "%[", apa(dscore$dlow, 3), 
        " - ", apa(dscore$dhigh, 3), "]", sep = "")
}) #close ITD

####independent t g####
output$ITGsummary = renderText({
  
  ##check for SE1
  if (input$ITGse1 != "") {
    sd1 = as.numeric(input$ITGse1) * sqrt(input$ITGn)
  } else { ITGsd1 = as.numeric(input$ITGsd1) }
  
  ##check for SE2
  if (input$ITGse2 != "") {
    sd2 = as.numeric(input$ITGse2) * sqrt(input$ITGn2)
  } else { ITGsd2 = as.numeric(input$ITGsd2) }
  dscore = d.ind.t(as.numeric(input$ITGmean1), as.numeric(input$ITGmean2),
                   as.numeric(input$ITGsd1), as.numeric(input$ITGsd2), 
                   as.numeric(input$ITGn), as.numeric(input$ITGn2), 
                   as.numeric(input$ITGalpha))
  
  paste("d = ", apa(dscore$d, 3),
        ", ", (1-as.numeric(input$ITGalpha))*100, "%[", apa(dscore$dlow, 3), 
        " - ", apa(dscore$dhigh, 3), "]", sep = "")
  
}) #close ITG

####independent proportions####
output$IP = renderText({
  
  dscore = d.prop(as.numeric(input$IPprop1), as.numeric(input$IPprop2),
                  as.numeric(input$IPn), as.numeric(input$IPn2),
                  as.numeric(input$IPalpha))
  paste("d = ", apa(dscore$d, 3),
        ", ", (1-as.numeric(input$IPalpha))*100, "%[", apa(dscore$dlow, 3), 
        " - ", apa(dscore$dhigh, 3), "]", sep = "")
}) #close IP
>>>>>>> 3c964c5825e53baf4c9c149b80b09fab407a6442

} ##close server

# Run the application 
<<<<<<< HEAD
shinyApp(ui = ui, server = server)
=======
shinyApp(ui = ui, server = server)
>>>>>>> 3c964c5825e53baf4c9c149b80b09fab407a6442
