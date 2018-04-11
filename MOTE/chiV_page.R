####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Chi-Square - V")),
         
         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Chi-Square:"), 
             textInput("chiVx", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Sample Size:"), 
             textInput("chiVn", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Number of Rows in Contingency Table:"), 
             textInput("chiVr", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Number of Columns in Contingency Table:"), 
             textInput("chiVc", NULL, width = 60)),
         
         textInput("chiValpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("chiVsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("chiV_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/fxNfIokgSTs\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row