####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Independent t - Means")),

         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Mean 1:"), 
             textInput("ITMmean1", NULL, width = 60)),
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Mean 2:"),
             textInput("ITMmean2", NULL, width = 60)), 
         br(),
         
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITMsd1", "SD 1:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITMse1", "SE 2:", width = 60)), 
         
         br(),
         
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITMsd2", "SD 2:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITMse2", "SE 2:", width = 60)), 
         
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITMn", "N 1:", width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITMn2", "N 2:", width = 60)), 
         
         br(),
         textInput("ITMalpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("ITMsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("indtM_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/kH3UOoFh9Ng\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
