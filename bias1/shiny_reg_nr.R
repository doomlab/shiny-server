##load data sets##
abias = read.csv("bias_across.csv")
armse = read.csv("rmse_across.csv")
asd = read.csv("sd_across.csv")

####bias data####
NRbgraphdatalong = melt(abias, 
                      id = c("N", "eta2p"))
NRbgraphdatalong$Type = c(
  rep("Eta", nrow(abias)*2),
  rep("Epsilon", nrow(abias)*2),
  rep("Omega", nrow(abias)*2)
)
NRbgraphdatalong$source = c(
  rep("Rounded", nrow(abias)),
  rep("Not Rounded", nrow(abias))
)

####rmse####
NRbgraphdatalong2 = melt(armse, 
                      id = c("N", "eta2p"))
NRbgraphdatalong2$Type = c(
  rep("Eta", nrow(armse)*2),
  rep("Epsilon", nrow(armse)*2),
  rep("Omega", nrow(armse)*2)
)
NRbgraphdatalong2$source = c(
  rep("Rounded", nrow(armse)),
  rep("Not Rounded", nrow(armse))
)

####sd####
NRbgraphdatalong3 = melt(asd, 
                      id = c("N", "eta2p"))
NRbgraphdatalong3$Type = c(
  rep("Eta", nrow(asd)*2),
  rep("Epsilon", nrow(asd)*2),
  rep("Omega", nrow(asd)*2)
)
NRbgraphdatalong3$source = c(
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
         sliderInput("NRyaxisrange", "Y-Axis Range:",
                     min = -.40, max = .40,
                     value = c(-.05, .15)),
         
         selectInput("NRselect", "Select Effect Size:",
                     c("Eta" = "Eta",
                       "Omega" = "Omega",
                       "Epsilon" = "Epsilon"))
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Bias", plotOutput("NR_bias"),
                    br(),
                    helpText("Complete dataset avaliable at: https://osf.io/urd8q/")),
           tabPanel("SD", plotOutput("NR_SD"),
                    br(),
                    helpText("Complete dataset avaliable at: https://osf.io/urd8q/")),
           tabPanel("RMSE", plotOutput("NR_RMSE"),
                    br(),
                    helpText("Complete dataset avaliable at: https://osf.io/urd8q/"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
