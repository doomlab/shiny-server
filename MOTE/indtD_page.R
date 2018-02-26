####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Independent t Delta - Means")),

         ##put input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Control Mean 1:"), 
             textInput("ITDmean1", NULL, width = 60)),
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("Experimental Mean 2:"),
             textInput("ITDmean2", NULL, width = 60)), 
         br(),
         
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITDsd1", "SD 1:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITDse1", "SE 1:", width = 60)), 
         
         br(),
         
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITDsd2", "SD 2:", width = 60)), 
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITDse2", "SE 2:", width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITDn", "N 1:", width = 60)),
         
         br(),
         div(style="display: inline-block;vertical-align:top; width: 100px;",
             textInput("ITDn2", "N 2:", width = 60)), 
         
         br(),
         textInput("ITDalpha", "Alpha:", width = 60, placeholder = ".05"),
         submitButton("Calculate")
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Summary", textOutput("ITDsummary")),
           tabPanel("Code", helpText("Include the code, and 
                                               annotation here about what is what.")),
           tabPanel("Help", HTML("<iframe width=\"500\" height=\"300\" 
                                 src=\"https://www.youtube.com/embed/T62maKYX9tU\" 
                                 frameborder=\"0\" allowfullscreen></iframe>"))
         ) ## close tabset panel
         
  ) ## close column
  
) ##close fluid row
