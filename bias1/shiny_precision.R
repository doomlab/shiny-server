##import data
round = read.csv("rounding.csv")

####bias graph####
rbgraphdatalong = melt(round[ , 1:4],
                      id = "N",
                      measured = c("eta2B", "epsilon2B", "omega2B"))
rbgraphdatalong$variable = factor(rbgraphdatalong$variable, 
                                 levels = c("epsilon2B", "eta2B", "omega2B"))
rbgraphdatalong$HICI = melt(unname(c(hibeta, hibep, hibom)))$value
rbgraphdatalong$LOCI = melt(unname(c(lobeta, lobep, lobom)))$value

rbgraphdata = t(round[ , 1:4])
colnames(rbgraphdata) = rbgraphdata[1, ]

####rmse graph####
rbgraphdatalong2 = melt(round[ , c(1, 5:7)],
                       id = "N",
                       measured = c("epsilon2R", "eta2R", "omega2R"))
rbgraphdatalong2$variable = factor(rbgraphdatalong2$variable, 
                                  levels = c("epsilon2R", "eta2R", "omega2R"))
rbgraphdatalong2$HICI = melt(unname(c(hireta, hirep, hirom)))$value
rbgraphdatalong2$LOCI = melt(unname(c(loreta, lorep, lorom)))$value

rbgraphdata2 = t(round[ , c(1, 5:7)])
colnames(rbgraphdata2) = rbgraphdata2[1, ]

####sd graph####
rbgraphdatalong3 = melt(round[ , c(1, 8:10)],
                       id = "N",
                       measured = c("epsilon2S", "eta2S", "omega2S"))
rbgraphdatalong3$variable = factor(rbgraphdatalong3$variable, 
                                  levels = c("epsilon2S", "eta2S", "omega2S"))
rbgraphdatalong3$HICI = melt(unname(c(hiseta, hisep, hisom)))$value
rbgraphdatalong3$LOCI = melt(unname(c(loseta, losep, losom)))$value

rbgraphdata3 = t(round[ , c(1, 8:10)])
colnames(rbgraphdata3) = rbgraphdata3[1, ]

####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Precision of DV")),
         
         ##put input boxes here
         sliderInput("ryaxisrange", "Y-Axis Range:",
                     min = -.40, max = .40,
                     value = c(-.05, .15)),
         
         textInput("rdecimals", "Table Decimals:",
                   value = 4)
         
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Bias", plotOutput("rounding_bias"),
                    br(),
                    dataTableOutput("rounding_biasT")),
           tabPanel("SD", plotOutput("rounding_SD"),
                    br(),
                    dataTableOutput("rounding_SDT")),
           tabPanel("RMSE", plotOutput("rounding_RMSE"),
                    br(),
                    dataTableOutput("rounding_RMSET"))
           ) ## close tabset panel
         
         ) ## close column
  
) ##close fluid row
