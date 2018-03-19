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
             strong("df (model):"), 
             textInput("gesSSrmdfmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (error):"), 
             textInput("gesSSrmdferr", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (model):"), 
             textInput("gesSSrmssmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS (subject):"), 
             textInput("gesSSrmsssub", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS IV1 (error):"), 
             textInput("gesSSrmsserr1", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS IV2 (error):"), 
             textInput("gesSSrmsserr2", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("SS IV1 X IV2 (error):"), 
             textInput("gesSSrmsserr3", NULL, width = 60)),
         
         textInput("gesSSrmf", "F:", width = 60),
         
         textInput("gesSSrmalpha", "Alpha:", width = 60, placeholder = ".05"),
         
         
         
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", helpText("GESsummary")),
           tabPanel("Code", helpText("Include the code, and 
                                     annotation here about what is what.")),
           tabPanel("Help", HTML("<iframe width=\"500\" height=\"300\" 
                                 src=\"https://www.youtube.com/embed/T62maKYX9tU\" 
                                 frameborder=\"0\" allowfullscreen></iframe>"))
           ) ## close tabset panel
         
         ) ## close column

  ) ##close fluid row
  