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
             textInput("STMmean1", NULL, width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Population Mean:"),
             textInput("STMmean2", NULL, width = 60)), 
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("STMsd", "SD:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("STMse", "SE:", width = 60)), 
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("STMn", "N:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("STMdf", "df:", width = 60)), 
         
         br(),
         textInput("STMalpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("STMsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("singletM_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/z2OnOk4_w3E\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row