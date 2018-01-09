##load data sets##
abias = read.csv("bias_acrossL.csv")
armse = read.csv("rmse_acrossL.csv")
asd = read.csv("sd_acrossL.csv")

####bias data####
RLbgraphdatalong = melt(abias, 
                      id = c("N", "eta2p"))
RLbgraphdatalong$Type = c(
  rep("Eta", nrow(abias)*2),
  rep("Epsilon", nrow(abias)*2),
  rep("Omega", nrow(abias)*2)
)
RLbgraphdatalong$source = c(
  rep("Rounded", nrow(abias)),
  rep("Not Rounded", nrow(abias))
)

####rmse####
RLbgraphdatalong2 = melt(armse, 
                      id = c("N", "eta2p"))
RLbgraphdatalong2$Type = c(
  rep("Eta", nrow(armse)*2),
  rep("Epsilon", nrow(armse)*2),
  rep("Omega", nrow(armse)*2)
)
RLbgraphdatalong2$source = c(
  rep("Rounded", nrow(armse)),
  rep("Not Rounded", nrow(armse))
)

####sd####
RLbgraphdatalong3 = melt(asd, 
                      id = c("N", "eta2p"))
RLbgraphdatalong3$Type = c(
  rep("Eta", nrow(asd)*2),
  rep("Epsilon", nrow(asd)*2),
  rep("Omega", nrow(asd)*2)
)
RLbgraphdatalong3$source = c(
  rep("Rounded", nrow(asd)),
  rep("Not Rounded", nrow(asd))
)

####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Regular Data Not Rounded")),
         
         ##put input boxes here
         sliderInput("RLyaxisrange", "Y-Axis Range:",
                     min = -.40, max = .40,
                     value = c(-.05, .15)),
         
         selectInput("RLselect", "Select Effect Size:",
                     c("Eta" = "Eta",
                       "Omega" = "Omega",
                       "Epsilon" = "Epsilon"))
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Bias", plotOutput("RL_bias"),
                    br(),
                    helpText("Complete dataset avaliable at: https://osf.io/urd8q/")),
           tabPanel("SD", plotOutput("RL_SD"),
                    br(),
                    helpText("Complete dataset avaliable at: https://osf.io/urd8q/")),
           tabPanel("RMSE", plotOutput("RL_RMSE"),
                    br(),
                    helpText("Complete dataset avaliable at: https://osf.io/urd8q/"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
