####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Dependent t Averages - Means")),

         ##put input boxes here
         textInput("DTAMm1", "Mean 1:", width = 60), 
         textInput("DTAMm2", "Mean 2:", width = 60), 
         
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTAMsd1", "SD 1:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTAMse1", "SE 1:", width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTAMsd2", "SD 2:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTAMse2", "SE 1:", width = 60)), 
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTAMn", "N:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("DTAMdf", "df:", width = 60)), 
         
         br(),
         textInput("DTAMalpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("DTAMsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("deptavgM_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/eq9X4ynxq2A\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
