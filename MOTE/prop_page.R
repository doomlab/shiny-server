####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Independent Proportions")),

         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Proportion 1:"), 
             textInput("IPprop1", NULL, width = 60)),
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Proportion 2:"),
             textInput("IPprop2", NULL, width = 60)), 
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("IPn", "N 1:", width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("IPn2", "N 2:", width = 60)), 
         
         br(),
         textInput("IPalpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("IPsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("prop_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/orrpP8Wd5tA\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
