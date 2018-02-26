####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Single Sample t - Means")),
         
         br(),
         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Sample Mean:"), 
             textInput("stmmean1", NULL, width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Population Mean:"),
             textInput("stmmean2", NULL, width = 60)), 
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("stmsd1", "SD:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("stmse1", "SE:", width = 60)), 
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("stmn", "N:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("stmdf", "df:", width = 60)), 
         
         br(),
         textInput("stmalpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", textOutput("STMsummary")),
           tabPanel("Code", helpText("code")),
           tabPanel("Help", HTML("<iframe width=\"500\" height=\"300\" 
                                 src=\"https://www.youtube.com/embed/T62maKYX9tU\" 
                                 frameborder=\"0\" allowfullscreen></iframe>"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row