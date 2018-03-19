####Measure of the Effect: A Shiny App using the MOTE library####
##Developed by: Erin M. Buchanan, Will Padfield, Abbie Van Nuland, Addie Wikowsky
##MOTE library maintained by Erin M. Buchanan, John E. Scofield, K.D. Valentine

####libraries####
library(shiny)
library(MOTE)
library(knitr)
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
                          tabPanel("Eta",
                                   source("eta_page.R")$value),
                          tabPanel("Partial Eta"),
                          tabPanel("Generalized Eta"),
                                   #source("etaf_page.R")$value), #not working so turned off temp
                          tabPanel("Omega",
                                   source("omega_page.R")$value),
                                  source("omegaf_page.R")$value),
                          tabPanel("Partial Omega",
                                   source("partialomega_page.R")$value),
                          tabPanel("Partial Omega - Repeated Measures",
                                   source("bnpartialomega_page.R")$value),
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
    
    ##check for N
    n = as.numeric(input$ZZn)
    
    ##check for SE
    if (input$ZZse1 != "") {
      sd1 = as.numeric(input$ZZse1) * sqrt(n)
    } else { sd1 = as.numeric(input$ZZsd1) }
    
    ZZdscore = d.z.z(z = as.numeric(input$ZZz), 
                     sig = sd1, 
                     n = n,
                     a = as.numeric(input$ZZalpha))
    
    HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
               "<b>Effect Size:</b> ", apa_d(ZZdscore, input$ZZalpha), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(ZZdscore$dlow, ZZdscore$dhigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(ZZdscore, "Z"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(ZZdscore$p, input$ZZalpha), #test interpretation
               sep = ""))
    
  }) ##close z from z
  
  ####Single Sample T From Means####
  output$STMsummary <- renderText({ 
    
    ##check for N
    if (input$STMdf != "") {
      n = as.numeric(input$STMdf) + 1
    } else { n = as.numeric(input$STMn) }
    
    ##check for SE
    if (input$STMse != "") {
      sd = as.numeric(input$STMse) * sqrt(input$STMn)
    } else { sd = as.numeric(input$STMsd) }
    
    STMdscore = d.single.t(as.numeric(input$STMmean1),
                          as.numeric(input$STMmean2), as.numeric(input$STMsd),
                          as.numeric(input$STMn), 
                        as.numeric(input$STMalpha))
    
    HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
               "<b>Effect Size:</b> ", apa_d(STMdscore, input$STMalpha), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(STMdscore$dlow, STMdscore$dhigh), "<p/>", #effect size interpretation
               "<b>Sample Summary Statistics:</b> ", apa_Z(STMdscore, input$STMalpha), "<p/>", #means
               "<b>Test Statistic:</b> ", apa_stat(STMdscore, "t"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(STMdscore$p, input$STMalpha), #test interpretation
               sep = ""))
    
  }) #close STM
  
  ####Single Sample T From T####
  output$STTsummary <- renderText({ 
    
    ##check for N
    if (input$STTdf != "") {
      n = as.numeric(input$STTdf) + 1
    } else { n = as.numeric(input$STTn) }
    
    STTdscore = d.single.t.t(as.numeric(input$STTt),
                        n, as.numeric(input$STTalpha))
    
    HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
               "<b>Effect Size:</b> ", apa_d(STTdscore, input$STTalpha), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(STTdscore$dlow, STTdscore$dhigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(STTdscore, "t"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(STTdscore$p, input$STTalpha), #test interpretation
               sep = ""))
    
  }) #close STT
  
  ####Dependent t Averages from Mean####
  output$DTAMsummary <- renderText({ 
    
    ##check for N
    if (input$DTAMdf != "") {
      n = as.numeric(input$DTAMdf) + 1
    } else { n = as.numeric(input$DTAMn) }
  
    ##check for SE1
    if (input$DTAMse1 != "") {
      sd1 = as.numeric(input$DTAMse1) * sqrt(n)
    } else { sd1 = as.numeric(input$DTAMsd1) }
    
    ##check for SE2
    if (input$DTAMse2 != "") {
      sd2 = as.numeric(input$DTAMse2) * sqrt(n)
    } else { sd2 = as.numeric(input$DTAMsd2) }  
    
    DTAMdscore = d.dep.t.avg(as.numeric(input$DTAMm1), as.numeric(input$DTAMm2),
                          sd1, sd2,
                         n, as.numeric(input$DTAMalpha))
    
    HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
               "<b>Effect Size:</b> ", apa_d(DTAMdscore, input$DTAMalpha), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(DTAMdscore$dlow, DTAMdscore$dhigh), "<p/>", #effect size interpretation
               "<b>Group 1 Summary Statistics:</b> ", apa_M(DTAMdscore, 1, input$DTAMalpha), "<p/>", #means
               "<b>Group 2 Summary Statistics:</b> ", apa_M(DTAMdscore, 2, input$DTAMalpha), "<p/>", #means
               sep = ""))
    
  }) #close DTDM

  ####dependent t with difference score standard deviation####
  output$DTDMsummary <- renderText({ 
    
    ##check for N
    n = as.numeric(input$DTDMnstuff)
    
    ##check for sediff
    if (input$DTDMsediff != "" | !is.null(input$DTDMsediff)) {
      sddiff = as.numeric(input$DTDMsediff) * sqrt(n)
    } else { sddiff = as.numeric(input$DTDMsddiff) }
    
    DTDMdscore = d.dep.t.diff(mdiff = as.numeric(input$DTDMmeandiff),
                          sddiff = as.numeric(input$DTDMsddiff), 
                          n = n,
                          a = as.numeric(input$DTDMalpha))
    
    HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
               "<b>Effect Size:</b> ", apa_d(DTDMdscore, input$DTDMalpha), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(DTDMdscore$dlow, DTDMdscore$dhigh), "<p/>", #effect size interpretation
               "<b>Summary Statistics:</b> ", apa_diff(DTDMdscore, input$DTDMalpha), "<p/>", #means
               "<b>Test Statistic:</b> ", apa_stat(DTDMdscore, "t"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(DTDMdscore$p, input$DTDMalpha), #test interpretation
               sep = ""))
    
  }) #close d.dep.t.diffAPA
  
  ####dependent t from t####
output$DTTsummary <- renderText({ 
  
  ##check for N
  if (input$DTTdf != "") {
    n = as.numeric(input$DTTdf) + 1
  } else { n = as.numeric(input$DTTn) }
  
  DTTdscore = d.dep.t.diff.t(as.numeric(input$DTTtscore),
                             n, as.numeric(input$DTTalpha))
  
  HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
             "<b>Effect Size:</b> ", apa_d(DTTdscore, input$DTTalpha), "<p/>", #effect size
             "<b>Interpretation:</b> ", checkzero(DTTdscore$dlow, DTTdscore$dhigh), "<p/>", #effect size interpretation
             "<b>Test Statistic:</b> ", apa_stat(DTTdscore, "t"), "<p/>", #test stats
             "<b>Interpretation:</b> ", checkp(DTTdscore$p, input$DTTalpha), #test interpretation
             sep = ""))
  
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
  
  ##check for SE2
  if (input$DTRMse2 != "") {
    sd2 = as.numeric(input$DTRMse2) * sqrt(n)
  } else { sd2 = as.numeric(input$DTRMsd2) }
  
  DTRMdscore = d.dep.t.rm(as.numeric(input$DTRMmean1), 
                          as.numeric(input$DTRMmean2),
                          sd1, 
                          sd2, 
                          as.numeric(input$DTRMr), 
                          n, 
                          as.numeric(input$DTRMalpha))
  
  HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
             "<b>Effect Size:</b> ", apa_d(DTRMdscore, input$DTRMalpha), "<p/>", #effect size
             "<b>Interpretation:</b> ", checkzero(DTRMdscore$dlow, DTRMdscore$dhigh), "<p/>", #effect size interpretation
             "<b>Group 1 Summary Statistics:</b> ", apa_M(DTRMdscore, 1, input$DTRMalpha), "<p/>", #means
             "<b>Group 2 Summary Statistics:</b> ", apa_M(DTRMdscore, 2, input$DTRMalpha), "<p/>", #means
             sep = ""))
  
}) #close DTRM

  ####independent t from means####
output$ITMsummary <- renderText({ 

 ##check for SE1
  if (input$ITMse1 != "") {
    sd1 = as.numeric(input$ITMse1) * sqrt(input$ITMn)
  } else { sd1 = as.numeric(input$ITMsd1) }
  
  ##check for SE2
  if (input$ITMse2 != "") {
    sd2 = as.numeric(input$ITMse2) * sqrt(as.numeric(input$ITMn2))
  } else { sd2 = as.numeric(input$ITMsd2) }
  
  ITMdscore = d.ind.t(as.numeric(input$ITMmean1), 
                      as.numeric(input$ITMmean2),
                   sd1, 
                   sd2, 
                   as.numeric(input$ITMn), 
                   as.numeric(input$ITMn2), 
                   as.numeric(input$ITMalpha))
  
  HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
             "<b>Effect Size:</b> ", apa_d(ITMdscore, input$ITMalpha), "<p/>", #effect size
             "<b>Interpretation:</b> ", checkzero(ITMdscore$dlow, ITMdscore$dhigh), "<p/>", #effect size interpretation
             "<b>Group 1 Summary Statistics:</b> ", apa_M(ITMdscore, 1, input$ITMalpha), "<p/>", #means
             "<b>Group 2 Summary Statistics:</b> ", apa_M(ITMdscore, 2, input$ITMalpha), "<p/>", #means
             "<b>Test Statistic:</b> ", apa_stat(ITMdscore, "t"), "<p/>", #test stats
             "<b>Interpretation:</b> ", checkp(ITMdscore$p, input$ITMalpha), #test interpretation
             sep = ""))
  
}) #close ITM

 ####independent t from t
  output$ITTsummary <- renderText({ 
    
    ITTdscore = d.ind.t.t(as.numeric(input$ITTt1),
                       as.numeric(input$ITTn1), as.numeric(input$ITTn2), as.numeric(input$ITTalpha))
    
    HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
               "<b>Effect Size:</b> ", apa_d(ITTdscore, input$ITTalpha), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(ITTdscore$dlow, ITTdscore$dhigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(ITTdscore, "t"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(ITTdscore$p, input$ITTalpha), #test interpretation
               sep = ""))
    
  }) #close ITT
  
  ####independent t delta####
output$ITDsummary <- renderText({ 

  ##check for SE1
  if (input$ITDse1 != "") {
    sd1 = as.numeric(input$ITDse1) * sqrt(input$ITDn)
  } else { sd1 = as.numeric(input$ITDsd1) }
  
  ##check for SE2
  if (input$ITDse2 != "") {
    sd2 = as.numeric(input$ITDse2) * sqrt(as.numeric(input$ITDn2))
  } else { sd2 = as.numeric(input$ITDsd2) }
  
  ITDdscore = delta.ind.t(as.numeric(input$ITDmean1), as.numeric(input$ITDmean2),
                   sd1, sd2, 
                   as.numeric(input$ITDn), as.numeric(input$ITDn2), as.numeric(input$ITDalpha))
  
  HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
             "<b>Effect Size:</b> ", apa_d(ITDdscore, input$ITDalpha), "<p/>", #effect size
             "<b>Interpretation:</b> ", checkzero(ITDdscore$dlow, ITDdscore$dhigh), "<p/>", #effect size interpretation
             "<b>Control Group Summary Statistics:</b> ", apa_M(ITDdscore, 1, input$ITDalpha), "<p/>", #means
             "<b>Experimental Group Summary Statistics:</b> ", apa_M(ITDdscore, 2, input$ITDalpha), "<p/>", 
             "<b>Test Statistic:</b> ", apa_stat(ITDdscore, "t"), "<p/>", #test stats
             "<b>Interpretation:</b> ", checkp(ITDdscore$p, input$ITDalpha), #test interpretation
             sep = ""))
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
  
  ITGdscore = g.ind.t(as.numeric(input$ITGmean1), as.numeric(input$ITGmean2),
                   sd1, sd2, 
                   as.numeric(input$ITGn), as.numeric(input$ITGn2), 
                   as.numeric(input$ITGalpha))
  
  HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
             "<b>Effect Size:</b> ", apa_d(ITGdscore, input$ITGalpha), "<p/>", #effect size
             "<b>Interpretation:</b> ", checkzero(ITGdscore$dlow, ITGdscore$dhigh), "<p/>", #effect size interpretation
             "<b>Summary Statistics:</b> ", apa_M(ITGdscore, 1, input$ITGalpha), "<p/>", #means
             "<b>Summary Statistics:</b> ", apa_M(ITGdscore, 2, input$ITGalpha), "<p/>", 
             "<b>Test Statistic:</b> ", apa_stat(ITGdscore, "t"), "<p/>", #test stats
             "<b>Interpretation:</b> ", checkp(ITGdscore$p, input$ITGalpha), #test interpretation
             sep = ""))
  
}) #close ITG

  ####independent proportions####
output$IPsummary = renderText({
  
  IPdscore = d.prop(as.numeric(input$IPprop1), as.numeric(input$IPprop2),
                  as.numeric(input$IPn), as.numeric(input$IPn2),
                  as.numeric(input$IPalpha))
  
  HTML(paste("<b>Definition:</b> ", cohend, "<p/>", 
             "<b>Effect Size:</b> ", apa_d(IPdscore, input$IPalpha), "<p/>", #effect size
             "<b>Interpretation:</b> ", checkzero(IPdscore$dlow, IPdscore$dhigh), "<p/>", #effect size interpretation
             "<b>Test Statistic:</b> ", apa_stat(IPdscore, "Z"), "<p/>", #test stats
             "<b>Interpretation:</b> ", checkp(IPdscore$p, input$IPalpha), #test interpretation
             sep = ""))
  
}) #close IP

} ##close server

# Run the application 
shinyApp(ui = ui, server = server)

