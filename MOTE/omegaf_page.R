#fluid row
fluidRow( #open fluid row
  
  #input
  column(4, 
         style = "background-color: #E8E8E8",
         
         #change title
         div(style="display: inline-black; vertical-align:top; text-align:center; width: 100%;",
             strong("Omega - F")),
         
         #input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Model):"), 
             textInput("omegaFdfmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Error):"), 
             textInput("omegaFdferr", NULL, width = 60)),
         
         textInput("omegaFf", "F:", width = 60),
         
         textInput("omegaFn", "N:", width = 60),
         
         textInput("omegaFalpha", "Alpha:", width = 60, placeholder = ".05"),
         
         submitButton("Calculate")
         ), #close column
  
  #output
  column(8,
         tabsetPanel(
           tabPanel("Summary", htmlOutput("OMEGAFsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("omegaf_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/40XnVCphLFA\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
         
           ) #close tabsetPanel
         ) #close Column
) #close fluid row
