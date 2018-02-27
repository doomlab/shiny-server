####Measure of the Effect: A Shiny App using the MOTE library####
##Developed by: Erin M. Buchanan, Will Padfield, Abbie Van Nuland, Addie Wikowsky
##MOTE library maintained by Erin M. Buchanan, John E. Scofield, K.D. Valentine

####libraries####
library(shiny)
library(MOTE)
source("output_functions.R")

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
  
  ####z test from means####
  output$ZMsummary <- renderUI({ 
    
    ##check for N
    n = as.numeric(input$ZMn)
    
    ##check for SE
    if (input$ZMse1 != "") {
      sd1 = as.numeric(input$ZMse1) * sqrt(n)
    } else { sd1 = as.numeric(input$ZMsd1) }
    
    if (input$ZMse2 != "") {
      sd2 = as.numeric(input$ZMse2) * sqrt(n)
    } else { sd2 = as.numeric(input$ZMsd2) }
    
    ZMdscore = d.z.mean(mu = as.numeric(input$ZMmean2),
                        m1 = as.numeric(input$ZMmean1),
                        sig = sd2,
                        sd1 = sd1,
                        n = n,
                        a = as.numeric(input$ZMalpha))
    
    HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
      "<b>Effect Size:</b> ", apa_d(ZMdscore, input$ZMalpha), "<p/>", #effect size
      "<b>Interpretation:</b> ", checkzero(ZMdscore$dlow, ZMdscore$dhigh), "<p/>", #effect size interpretation
      "<b>Summary Statistics:</b> ", apa_M(ZMdscore, 1, input$ZMalpha), "<p/>", #means
      "<b>Test Statistic:</b> ", apa_stat(ZMdscore, "Z"), "<p/>", #test stats
      "<b>Interpretation:</b> ", checkp(ZMdscore$p, input$ZMalpha), #test interpretation
      sep = ""))
    
  }) ##close z from means

  ####Z test from Z####
  output$ZZsummary <- renderText({ 
    
    ZZdscore = d.z.z(as.numeric(input$ZZz), sig = NA, as.numeric(input$ZZn),
                     as.numeric(input$ZZalpha))
    
    paste("d = ", apa(ZZdscore$d, 3),
          ", ", (1-as.numeric(input$ZZalpha))*100, "%[", apa(ZZdscore$dlow, 3), 
          " - ", apa(ZZdscore$dhigh, 3), "]", sep = "")
    
  }) ##close z from z
  
  ####Single Sample T From Means####
  output$STMsummary <- renderText({ 
    
    ##check for N
    if (input$STMdfstuff != "") {
      n = as.numeric(input$STMdfstuff) + 1
    } else { n = as.numeric(input$STMnstuff) }
    
    ##check for SE
    if (input$STMsediff != "" | !is.null(input$STMsediff)) {
      sddiff = as.numeric(input$STMsediff) * sqrt(n)
    } else { sddiff = as.numeric(input$STMsddiff) }
    
    stmdscore = d.single.t(as.numeric(input$stmmean1),
                          as.numeric(input$stmmean2), as.numeric(input$stmsd1), as.numeric(input$stmn), 
                        as.numeric(input$stmalpha))
    
    paste("d = ", apa(stmdscore$d, 3),
          ", ", (1-as.numeric(input$stmalpha))*100, "%[", apa(stmdscore$dlow, 3), 
          " - ", apa(stmdscore$dhigh, 3), "]", sep = "")
    
  }) #close STM
  
  ####Single Sample T From T####
  output$STTMsummary <- renderText({ 
    
    ##check for N
    if (input$STTdfstuff != "") {
      n = as.numeric(input$STTdfstuff) + 1
    } else { n = as.numeric(input$STTnstuff) }
    
    ##check for SE
    if (input$STTsediff != "" | !is.null(input$STTsediff)) {
      sddiff = as.numeric(input$STTsediff) * sqrt(n)
    } else { sddiff = as.numeric(input$STTsddiff) }
    
    sttdscore = d.single.t.t(as.numeric(input$sttt),
                        as.numeric(input$sttn), n, as.numeric(input$sttalpha))
    
    paste("d = ", apa(sttdscore$d, 3),
          ", ", (1-as.numeric(input$sttalpha))*100, "%[", apa(sttdscore$dlow, 3), 
          " - ", apa(sttdscore$dhigh, 3), "]", sep = "")
    
  }) #close STT
  
  ####Dependent t Averages from Mean####
  output$DTAMsummary <- renderText({ 
    
    ##check for N
    if (input$DTAMdf != "") {
      dtamn = as.numeric(input$DTAMdf) + 1
    } else { n = as.numeric(input$DTAMn) }
    
    ##check for sediff
    if (input$DTAMsediff != "" | !is.null(input$DTAMsediff)) {
      sddiff = as.numeric(input$DTAMsediff) * sqrt(n)
    } else { sddiff = as.numeric(input$DTAMsddiff) }
    
    dscore = d.dep.t.avg(as.numeric(input$DTAMm1), as.numeric(input$DTAMm2),
                          as.numeric(input$DTAMsd1), as.numeric(input$DTAMsd2),
                         dtamn, as.numeric(input$DTAMalpha))
    
    paste("d = ", apa(dscore$d, 3),
          ", ", (1-as.numeric(input$alpha))*100, "%[", apa(dscore$dlow, 3), 
          " - ", apa(dscore$dhigh, 3), "]", sep = "")
    
  }) #close DTDM
  
  ####dependent t with difference score standard deviation####

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
    
  }) #close d.dep.t.diffAPA
  
####dependent t from t####
output$DTTsummary <- renderText({ 
  
  ##check for N
  if (input$DTTdf != "") {
    n = as.numeric(input$DTTdf) + 1
  } else { n = as.numeric(input$DTTn) }
  
  DTTdscore = d.dep.t.diff.t(as.numeric(input$DTTtscore),
                             n, as.numeric(input$DTTalpha))
  
  paste("d = ", apa(DTTdscore$d, 3),
        ", ", (1-as.numeric(input$DTTalpha))*100, "%[", apa(DTTdscore$dlow, 3), 
        " - ", apa(DTTdscore$dhigh, 3), "]", sep = "")
  
}) ##close dependent t from t  

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

 ####independent t from t
  output$ITTsummary <- renderText({ 
    
    dscore = d.ind.t.t(as.numeric(input$ITTt1),
                       as.numeric(input$ITTn1), as.numeric(input$ITTn2), as.numeric(input$ITTalpha))
    
    paste("d = ", apa(dscore$d, 3),
          ", ", (1-as.numeric(input$ITTalpha))*100, "%[", apa(dscore$dlow, 3), 
          " - ", apa(dscore$dhigh, 3), "]", sep = "")
  }) #close ITT
  
 ####independent t delta####
output$ITDsummary <- renderText({ 
  
  ##check for SE1
  if (input$ITDse1 != "") {
    sd1 = as.numeric(input$ITDse1) * sqrt(input$ITDn)
  } else { sd1 = as.numeric(input$ITDsd1) }
  
  ##check for SE2
  if (input$se2 != "") {
    sd2 = as.numeric(input$ITDse2) * sqrt(input$ITDn2)
  } else { sd2 = as.numeric(input$ITDsd2) }
  
  dscore = delta.ind.t(as.numeric(input$ITDmean1), as.numeric(input$ITDmean2),
                   sd1, sd2, 
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
  } else { sd1 = as.numeric(input$ITGsd1) }
  
  ##check for SE2
  if (input$ITGse2 != "") {
    sd2 = as.numeric(input$ITGse2) * sqrt(input$ITGn2)
  } else { sd2 = as.numeric(input$ITGsd2) }
  
  dscore = g.ind.t(as.numeric(input$ITGmean1), as.numeric(input$ITGmean2),
                   sd1, sd2, 
                   as.numeric(input$ITGn), as.numeric(input$ITGn2), 
                   as.numeric(input$ITGalpha))
  
  paste("d = ", apa(dscore$d, 3),
        ", ", (1-as.numeric(input$ITGalpha))*100, "%[", apa(dscore$dlow, 3), 
        " - ", apa(dscore$dhigh, 3), "]", sep = "")
  
}) #close ITG

 ####independent proportions####
output$IPsummary = renderText({
  
  dscore = d.prop(as.numeric(input$IPprop1), as.numeric(input$IPprop2),
                  as.numeric(input$IPn), as.numeric(input$IPn2),
                  as.numeric(input$IPalpha))
  
  paste("d = ", apa(dscore$d, 3),
        ", ", (1-as.numeric(input$IPalpha))*100, "%[", apa(dscore$dlow, 3), 
        " - ", apa(dscore$dhigh, 3), "]", sep = "")
  
}) #close IP

} ##close server

# Run the application 
shinyApp(ui = ui, server = server)

