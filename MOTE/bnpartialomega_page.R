####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Partial Omega - Between")),
         
         ##put input boxes here
         textInput("POBdf", "df (Model):", width = 60),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("POBmod", "MS (Model):", width = 60)), 
         
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("POB_MEerr", "ME (Error):", width = 60)), 
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("POB_SSerr", "SS (Error):", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("POB_SSsub", "SS (Subject):", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("POB_MSsub", "MS (Subject):", width = 60)), 
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", helpText("POBsummary")),
           tabPanel("Code", helpText("Include the code, and 
                                     annotation here about what is what.")),
           tabPanel("Help", HTML("<iframe width=\"500\" height=\"300\" 
                                 src=\"https://www.youtube.com/embed/T62maKYX9tU\" 
                                 frameborder=\"0\" allowfullscreen></iframe>"))
           ) ## close tabset panel
         
         ) ## close column
  
) ##close fluid row
