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
                          tabPanel("d to r",
                                   source("DtoR_page.R")$value),
                          tabPanel("r",
                                   source("R_page.R")$value),
                          tabPanel("Eta - F",
                                   source("etaf_page.R")$value),
                          tabPanel("Eta Full - SS",
                                   source("etaSS_page.R")$value),
                          tabPanel("Eta Partial - SS",
                                   source("etaSSpart_page.R")$value),
                          tabPanel("GES Partial RM - SS",
                                   source("gesSSrm_page.R")$value),
                          tabPanel("GES Partial Mix - SS",
                                   source("ges_mix_page.R")$value),
                          tabPanel("Omega - F",
                                   source("omegaf_page.R")$value),
                          tabPanel("Omega Full - SS",
                                   source("omegaSS_page.R")$value),
                          tabPanel("Omega Partial BN - SS",
                                   source("omegaSSbn_page.R")$value),
                          tabPanel("Omega Partial RM - SS",
                                   source("omegaSSrm_page.R")$value),
                          tabPanel("Epsilon",
                                   source("epsilon_page.R")$value),
                          tabPanel("Chi-square V",
                                   source("chiV_page.R")$value),
                          tabPanel("Chi-square Odds",
                                   source("chiO_page.R")$value)
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
               "<b>Sample Summary Statistics:</b> ", apa_M(STMdscore, 0, input$STMalpha), "<p/>", #means
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
    if (input$DTDMsediff != "") { 
      DTDMsddiff = as.numeric(input$DTDMsediff) * sqrt(n) } else { DTDMsddiff = as.numeric(input$DTDMsddiff) }
    
    DTDMdscore = d.dep.t.diff(mdiff = as.numeric(input$DTDMmeandiff),
                          sddiff = DTDMsddiff, 
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
    sd1 = as.numeric(input$ITMse1) * sqrt(as.numeric(input$ITMn))
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
    sd1 = as.numeric(input$ITDse1) * sqrt(as.numeric(input$ITDn))
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
    sd1 = as.numeric(input$ITGse1) * sqrt(as.numeric(input$ITGn))
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
  
  ####d to r####
  output$DtoRsummary = renderText({
    
    DtoRscore = d.to.r(as.numeric(input$DtoRd), 
                                     as.numeric(input$DtoRn1), 
                                     as.numeric(input$DtoRn2),
                                     as.numeric(input$DtoRalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>",
               "<b>Effect Size:</b> ", apa_var(DtoRscore, input$DtoRalpha, type = "r"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(DtoRscore$rlow, DtoRscore$rhigh), "<p/>", #effect size interpretation
               "<b>Effect Size:</b> ", apa_var(DtoRscore, input$DtoRalpha, type = "R2"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(DtoRscore$R2low, DtoRscore$R2high), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(DtoRscore, "tr"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(DtoRscore$p, input$DtoRalpha), #test interpretation
               sep = ""))
    
  }) #close d to r
  
  ####r####
  output$Rsummary = renderText({
    
    Rscore = r.correl(as.numeric(input$Rr),
                      as.numeric(input$Rn),
                      as.numeric(input$Ralpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>",
               "<b>Effect Size:</b> ", apa_var(Rscore, input$Ralpha, type = "r"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(Rscore$rlow, Rscore$rhigh), "<p/>", #effect size interpretation
               "<b>Effect Size:</b> ", apa_var(Rscore, input$Ralpha, type = "R2"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(Rscore$R2low, Rscore$R2high), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(Rscore, "tr"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(Rscore$p, input$Ralpha), #test interpretation
               sep = ""))
    
  }) #close d to rs
  
  ####eta full F####
  output$ETAFsummary = renderText({
    
    etafscore = eta.F(as.numeric(input$etaFdfmod), as.numeric(input$etaFdferr),
                             as.numeric(input$etaFf), as.numeric(input$etaFalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>", 
               "<b>Effect Size:</b> ", apa_var(etafscore, input$etaFalpha, type = "eta"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(etafscore$etalow, etafscore$etahigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(etafscore, "F"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(etafscore$p, input$etaFalpha), #test interpretation
               sep = ""))
    
  }) #close eta full F
  
    ####eta full SS####
  output$ETAsummary = renderText({
    
    etassscore = eta.full.SS(as.numeric(input$etaSSdfmod), 
                             as.numeric(input$etaSSdferr),
                      as.numeric(input$etaSSssmod), 
                      as.numeric(input$etaSSsstot),
                      as.numeric(input$etaSSf), 
                      as.numeric(input$etaSSalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>", 
               "<b>Effect Size:</b> ", apa_var(etassscore, input$etaSSalpha, type = "eta"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(etassscore$etalow, etassscore$etahigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(etassscore, "F"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(etassscore$p, input$etaSSalpha), #test interpretation
               sep = ""))
    
  }) #close eta.full SS
  
  ####eta partial####
  output$PEsummary = renderText({
    
    partetascore = eta.partial.SS(as.numeric(input$etaSSpartdfmod), as.numeric(input$etaSSpartdferr),
                             as.numeric(input$etaSSpartssmod), as.numeric(input$etaSSpartsserr),
                             as.numeric(input$etaSSpartf), as.numeric(input$etaSSpartalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>", 
               "<b>Effect Size:</b> ", apa_var(partetascore, input$etaSSpartalpha, type = "eta"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(partetascore$etalow, partetascore$etahigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(partetascore, "F"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(partetascore$p, input$etaSSpartalpha), #test interpretation
               sep = ""))
    
  }) #close eta.partial
  
  ####GES RM####
  output$GESsummary = renderText({
    
    gesrmscore = ges.partial.SS.rm(as.numeric(input$gesSSrmdfmod), as.numeric(input$gesSSrmdferr),
                                  as.numeric(input$gesSSrmssmod), as.numeric(input$gesSSrmsssub),
                                  as.numeric(input$gesSSrmsserr1),as.numeric(input$gesSSrmsserr2),
                                  as.numeric(input$gesSSrmsserr3),
                                  as.numeric(input$gesSSrmf), as.numeric(input$gesSSrmalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>", 
               "<b>Effect Size:</b> ", apa_var(gesrmscore, input$gesSSrmalpha), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(gesrmscore$geslow, gesrmscore$geshigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(gesrmscore, "F"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(gesrmscore$p, input$gesSSrmalpha), #test interpretation
               sep = ""))
    
  }) #close ges.ss.rm
  
  ####ges partial mix SS####
  output$gemixsummary = renderText({
    
    gesmixscore = ges.partial.SS.mix(as.numeric(input$gesmixdfmod), 
                                       as.numeric(input$gesmixdferr),
                                       as.numeric(input$gesmixSSmod), 
                                       as.numeric(input$gesmixSSsv),
                                       as.numeric(input$gesmixSSerr), 
                                       as.numeric(input$gesmixSSf), 
                                       as.numeric(input$gesmixalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>",
               "<b>Effect Size:</b> ", apa_var(gesmixscore, input$gesmixalpha, type = "ges"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(gesmixscore$geslow, gesmixscore$geshigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(gesmixscore, "F"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(gesmixscore$p, input$gesmixalpha), #test interpretation
               sep = ""))
    
  }) #close ges partial mix ss
  
  ####omega full F####
  output$OMEGAFsummary = renderText({
    
    omegaFullF = omega.F(as.numeric(input$omegaFdfmod), 
                                       as.numeric(input$omegaFdferr),
                                       as.numeric(input$omegaFf), 
                                       as.numeric(input$omegaFn),
                                       as.numeric(input$omegaFalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>",
               "<b>Effect Size:</b> ", apa_var(omegaFullF, input$omegaFalpha, type = "omega"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(omegaFullF$omegalow, omegaFullF$omegahigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(omegaFullF, "F"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(omegaFullF$p, input$omegaFalpha), #test interpretation
               sep = ""))
    
  }) #close omega Full F
  
  ####omega full SS####
  output$omegaSSsummary = renderText({
    
    omegaSSscore = omega.partial.SS.bn(as.numeric(input$omegaSSdfmod), 
                                       as.numeric(input$omegaSSdferr),
                                       as.numeric(input$omegaSSmsmod), 
                                       as.numeric(input$omegaSSmserr),
                                       as.numeric(input$omegaSSsstot), 
                                       as.numeric(input$omegaSSalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>",
               "<b>Effect Size:</b> ", apa_var(omegaSSscore, input$omegaSSalpha, type = "omega"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(omegaSSscore$omegalow, omegaSSscore$omegahigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(omegaSSscore, "F"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(omegaSSscore$p, input$omegaSSalpha), #test interpretation
               sep = ""))
    
  }) #close omega full SS
  
   ####partial omega bn####
  output$POMsummary = renderText({
    
    omegabnscore = omega.partial.SS.bn(as.numeric(input$omegaSSbndfmod), 
                                       as.numeric(input$omegaSSbndferr),
                                       as.numeric(input$omegaSSbnmsmod), 
                                       as.numeric(input$omegaSSbnmserr),
                                       as.numeric(input$omegaSSbnssmod), 
                                       as.numeric(input$omegaSSbnN),
                                       as.numeric(input$omegaSSbnalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>",
               "<b>Effect Size:</b> ", apa_var(omegabnscore, input$omegaSSbnalpha, type = "omega"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(omegabnscore$omegalow, omegabnscore$omegahigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(omegabnscore, "F"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(omegabnscore$p, input$omegaSSbnalpha), #test interpretation
    sep = ""))
    
  }) #close partial omega bn
  
  ####partial omega rm####
  output$PORMsummary = renderText({
    
    omegarmscore = omega.partial.SS.rm(as.numeric(input$omegaSSrmdfmod), 
                                       as.numeric(input$omegaSSrmdferr),
                                       as.numeric(input$omegaSSrmmsmod), 
                                       as.numeric(input$omegaSSrmmserr),
                                       as.numeric(input$omegaSSrmmssub), 
                                       as.numeric(input$omegaSSrmssmod),
                                       as.numeric(input$omegaSSrmsserr), 
                                       as.numeric(input$omegaSSrmsssub),
                                       as.numeric(input$omegaSSrmalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>", 
               "<b>Effect Size:</b> ", apa_var(omegarmscore, input$omegaSSrmalpha, type = "omega"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(omegarmscore$omegalow, omegarmscore$omegahigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(omegarmscore, "F"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(omegarmscore$p, input$omegaSSrmalpha), #test interpretation
               sep = ""))
    
  }) #close partial omega rm
  
  ####epsilon####
  output$EPsummary = renderText({
    
    EPscore = epsilon.full.SS(as.numeric(input$EPdfmod), 
                                       as.numeric(input$EPdferr),
                                       as.numeric(input$EPmsmod), 
                                       as.numeric(input$EPmserr),
                                       as.numeric(input$EPsst),
                                       as.numeric(input$EPalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>",
               "<b>Effect Size:</b> ", apa_var(EPscore, input$EPalpha, type = "epsilon"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(EPscore$epsilonlow, EPscore$epsilonhigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(EPscore, "F"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(EPscore$p, input$EPalpha), #test interpretation
               sep = ""))
    
  }) #close epsilon
  
  ####chi square v####
  output$chiVsummary = renderText({
    
    chiVscore = v.chi.sq(as.numeric(input$chiVx), 
                              as.numeric(input$chiVn),
                              as.numeric(input$chiVr), 
                              as.numeric(input$chiVc),
                              as.numeric(input$chiValpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>",
               "<b>Effect Size:</b> ", apa_var(chiVscore, input$chiValpha, type = "v"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(chiVscore$vlow, chiVscore$vhigh), "<p/>", #effect size interpretation
               "<b>Test Statistic:</b> ", apa_stat(chiVscore, "X2"), "<p/>", #test stats
               "<b>Interpretation:</b> ", checkp(chiVscore$p, input$chiValpha), #test interpretation
               sep = ""))
    
  }) #close chi square v
  
  ####chi square odds####
  output$chiOsummary = renderText({
    
    chiOscore = odds(as.numeric(input$chiOn11), 
                         as.numeric(input$chiOn12),
                         as.numeric(input$chiOn21), 
                         as.numeric(input$chiOn22),
                         as.numeric(input$chiOalpha))
    
    HTML(paste("<b>Definition:</b> ", eta, "<p/>",
               "<b>Effect Size:</b> ", apa_var(chiOscore, input$chiOalpha, type = "o"), "<p/>", #effect size
               "<b>Interpretation:</b> ", checkzero(chiOscore$olow, chiOscore$ohigh), "<p/>", #effect size interpretation
               sep = ""))
  }) #close chi square odds
  
} ##close server

# Run the application 
shinyApp(ui = ui, server = server)

