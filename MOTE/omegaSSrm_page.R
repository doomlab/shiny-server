####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Omega Partial RM - SS")),
         
         ##put input boxes here
         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Model):"), 
             textInput("omegaSSrmdfmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Error):"), 
             textInput("omegaSSrmdferr", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("MS (Model):"), 
             textInput("omegaSSrmmsmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("MS (Error):"), 
             textInput("omegaSSrmmserr", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("MS (Subject):"), 
             textInput("omegaSSrmmssub", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (Model):"), 
             textInput("omegaSSrmssmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (Error):"), 
             textInput("omegaSSrmsserr", NULL, width = 60)),

         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (Subject):"), 
             textInput("omegaSSrmsssub", NULL, width = 60)),
         
         textInput("omegaSSrmalpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("PORMsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("omegaSSrm_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/Y1piNdNdMbc\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
           
           ) ## close tabset panel
         
         ) ## close column
  
) ##close fluid row
