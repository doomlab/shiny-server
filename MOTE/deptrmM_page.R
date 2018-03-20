####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Dependent t RM - Means")),

         ##put input boxes here
         textInput("DTRMmean1", "Mean 1:", width = 60), 
         textInput("DTRMmean2", "Mean 2:", width = 60), 
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTRMsd1", "SD 1:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTRMse1", "SE 1:", width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTRMsd2", "SD 2:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTRMse2", "SE 2:", width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTRMr", "r:", width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTRMn", "N:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTRMdf", "df:", width = 60)), 
         
         br(),
         textInput("DTRMalpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("DTRMsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("deptrmM_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/eq9X4ynxq2A\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
