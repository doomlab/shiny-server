####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("GES Partial For Mix Designs")),
         
         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Model):"), 
             textInput("gesmixdfmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Error):"), 
             textInput("gesmixdferr", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (Model):"), 
             textInput("gesmixSSmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (Subject):"), 
             textInput("gesmixSSsv", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (Error):"), 
             textInput("gesmixSSerr", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("F:"), 
             textInput("gesmixSSf", NULL, width = 60)),
         
         textInput("gesmixalpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("gemixsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("ges_mix_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/Y1piNdNdMbc\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
         
           ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
