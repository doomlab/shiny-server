#Partial Eta
####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("GES Partial RM - SS")),
         
         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Model):"), 
             textInput("gesSSrmdfmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Error):"), 
             textInput("gesSSrmdferr", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (Model):"), 
             textInput("gesSSrmssmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (Subject):"), 
             textInput("gesSSrmsssub", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS IV1 (Error):"), 
             textInput("gesSSrmsserr1", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS IV2 (Error):"), 
             textInput("gesSSrmsserr2", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS IV1 X IV2 (Error):"), 
             textInput("gesSSrmsserr3", NULL, width = 60)),
         
         textInput("gesSSrmf", "F:", width = 60),
         
         textInput("gesSSrmalpha", "Alpha:", width = 60, placeholder = ".05"),
         
         
         
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", htmlOutput("GESsummary")),
           tabPanel("Code", withMathJax(), 
                    HTML(markdown::markdownToHTML(knit("gesSSrm_code.Rmd", quiet = T)))),
           tabPanel("Help", HTML("<iframe width=\"560\" height=\"315\" 
                                 src=\"https://www.youtube.com/embed/Y1piNdNdMbc\" 
                                 frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>"))
         
           ) ## close tabset panel
         
         ) ## close column

  ) ##close fluid row
  