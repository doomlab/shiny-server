likertT = read.csv("likert_trun.csv")

####bias graph####
ltbgraphdatalong = melt(likertT[ , 1:4],
                      id = "N",
                      measured = c("eta2B", "epsilon2B", "omega2B"))
ltbgraphdatalong$variable = factor(ltbgraphdatalong$variable, 
                                 levels = c("epsilon2B", "eta2B", "omega2B"))
ltbgraphdatalong$HICI = melt(unname(c(hibeta, hibep, hibom)))$value
ltbgraphdatalong$LOCI = melt(unname(c(lobeta, lobep, lobom)))$value

ltbgraphdata = t(round[ , 1:4])
colnames(ltbgraphdata) = ltbgraphdata[1, ]

####rmse graph####
ltbgraphdatalong2 = melt(likertT[ , c(1, 5:7)],
                       id = "N",
                       measured = c("epsilon2R", "eta2R", "omega2R"))
ltbgraphdatalong2$variable = factor(ltbgraphdatalong2$variable, 
                                  levels = c("epsilon2R", "eta2R", "omega2R"))
ltbgraphdatalong2$HICI = melt(unname(c(hireta, hirep, hirom)))$value
ltbgraphdatalong2$LOCI = melt(unname(c(loreta, lorep, lorom)))$value

ltbgraphdata2 = t(round[ , c(1, 5:7)])
colnames(ltbgraphdata2) = ltbgraphdata2[1, ]

####sd graph####
ltbgraphdatalong3 = melt(likertT[ , c(1, 8:10)],
                       id = "N",
                       measured = c("epsilon2S", "eta2S", "omega2S"))
ltbgraphdatalong3$variable = factor(ltbgraphdatalong3$variable, 
                                  levels = c("epsilon2S", "eta2S", "omega2S"))
ltbgraphdatalong3$HICI = melt(unname(c(hiseta, hisep, hisom)))$value
ltbgraphdatalong3$LOCI = melt(unname(c(loseta, losep, losom)))$value

ltbgraphdata3 = t(round[ , c(1, 8:10)])
colnames(ltbgraphdata3) = ltbgraphdata3[1, ]

####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Likert Data Truncated")),
         
         ##put input boxes here
         sliderInput("ltyaxisrange", "Y-Axis Range:",
                     min = -.40, max = .40,
                     value = c(-.05, .15)),
         
         textInput("ltdecimals", "Table Decimals:",
                   value = 4)
         
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Bias", plotOutput("likertt_bias"),
                    br(),
                    dataTableOutput("likertt_biasT")),
           tabPanel("SD", plotOutput("likertt_SD"),
                    br(),
                    dataTableOutput("likertt_SDT")),
           tabPanel("RMSE", plotOutput("likertt_RMSE"),
                    br(),
                    dataTableOutput("likertt_RMSET"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
