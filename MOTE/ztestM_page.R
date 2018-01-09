####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Z Test - Means")),
         
         br(),
         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Sample Mean:"), 
             textInput("mean1", NULL, width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Population Mean:"),
             textInput("mean2", NULL, width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 110px;",
             strong("Population SD:"),
             textInput("sd1", NULL, width = 60)), 
         
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             strong("Population SE:"),
             textInput("se1", NULL, width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 110px;",
             textInput("n", "N:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("df", "df:", width = 60)), 
         
         br(),
         textInput("alpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", helpText("stuff")),
           tabPanel("Code", helpText("DO THE THING.")),
           tabPanel("Help", HTML("<iframe width=\"500\" height=\"300\" 
                                 src=\"https://www.youtube.com/embed/T62maKYX9tU\" 
                                 frameborder=\"0\" allowfullscreen></iframe>"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
