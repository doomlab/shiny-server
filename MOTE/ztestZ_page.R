####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Z Test - Z")),
         
         br(),
         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Z:"), 
             textInput("ZZz", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("N:"), 
             textInput("ZZn", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             strong("Population SD:"),
             textInput("ZZsd1", NULL, width = 60)), 
         
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             strong("Population SE:"),
             textInput("ZZse1", NULL, width = 60)),
         
         br(),
         textInput("ZZalpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("ZZsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("ztestZ_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/CyfOS7Ew-Hw\" 
                                  frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
