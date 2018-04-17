#fluid row
fluidRow( #open fluid row
  
  #input
  column(4, 
         style = "background-color: #E8E8E8",
         
         #change title
         div(style="display: inline-black; vertical-align:top; text-align:center; width: 100%;",
             strong("Generalized Omega - RM")),
         
         #input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (Model):"), 
             textInput("omegaGOMssmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Model):"), 
             textInput("GOSRMdfmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("MS (Subject):"), 
             textInput("GOSRMmssub", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (Total):"), 
             textInput("GOSRMsstot", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (IV 1):"), 
             textInput("GOSRMss1", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("J (Number of Levels in IV 2):"), 
             textInput("GOSRMj2", NULL, width = 60)),
         
         submitButton("Calculate")
  ), #close column
  
  #output
  column(8,
         tabsetPanel(
           tabPanel("Summary", helpText("GOSRMsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("GOSRM_code.md", quiet = T)))),
          tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/40XnVCphLFA\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
           
         ) #close tabsetPanel
  ) #close Column
) #close fluid row
