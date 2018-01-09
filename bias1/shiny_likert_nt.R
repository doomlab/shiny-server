likert = read.csv("likert.csv")

####bias graph####
lntbgraphdatalong = melt(likert[ , 1:4],
                      id = "N",
                      measured = c("eta2B", "epsilon2B", "omega2B"))
lntbgraphdatalong$variable = factor(lntbgraphdatalong$variable, 
                                 levels = c("epsilon2B", "eta2B", "omega2B"))
lntbgraphdatalong$HICI = melt(unname(c(hibeta, hibep, hibom)))$value
lntbgraphdatalong$LOCI = melt(unname(c(lobeta, lobep, lobom)))$value

lntbgraphdata = t(round[ , 1:4])
colnames(lntbgraphdata) = lntbgraphdata[1, ]

####rmse graph####
lntbgraphdatalong2 = melt(likert[ , c(1, 5:7)],
                       id = "N",
                       measured = c("epsilon2R", "eta2R", "omega2R"))
lntbgraphdatalong2$variable = factor(lntbgraphdatalong2$variable, 
                                  levels = c("epsilon2R", "eta2R", "omega2R"))
lntbgraphdatalong2$HICI = melt(unname(c(hireta, hirep, hirom)))$value
lntbgraphdatalong2$LOCI = melt(unname(c(loreta, lorep, lorom)))$value

lntbgraphdata2 = t(round[ , c(1, 5:7)])
colnames(lntbgraphdata2) = lntbgraphdata2[1, ]

####sd graph####
lntbgraphdatalong3 = melt(likert[ , c(1, 8:10)],
                       id = "N",
                       measured = c("epsilon2S", "eta2S", "omega2S"))
lntbgraphdatalong3$variable = factor(lntbgraphdatalong3$variable, 
                                  levels = c("epsilon2S", "eta2S", "omega2S"))
lntbgraphdatalong3$HICI = melt(unname(c(hiseta, hisep, hisom)))$value
lntbgraphdatalong3$LOCI = melt(unname(c(loseta, losep, losom)))$value

lntbgraphdata3 = t(round[ , c(1, 8:10)])
colnames(lntbgraphdata3) = lntbgraphdata3[1, ]

####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Likert Data Not Truncated")),
         
         ##put input boxes here
         sliderInput("lntyaxisrange", "Y-Axis Range:",
                     min = -.40, max = .40,
                     value = c(-.05, .15)),
         
         textInput("lntdecimals", "Table Decimals:",
                   value = 4)
         
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Bias", plotOutput("likertnt_bias"),
                    br(),
                    dataTableOutput("likertnt_biasT")),
           tabPanel("SD", plotOutput("likertnt_SD"),
                    br(),
                    dataTableOutput("likertnt_SDT")),
           tabPanel("RMSE", plotOutput("likertnt_RMSE"),
                    br(),
                    dataTableOutput("likertnt_RMSET"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
