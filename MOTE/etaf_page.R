#fluid row
fluidRow( #open fluid row
  
  #input
  column(4, 
         style = "background-color: #E8E8E8",
         
         #change title
         div(style="display: inline-black; vertical-align:top; text-align:center; width: 100%;",
            strong("Eta Full - F")),
         
         #input boxes here
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Model):"), 
             textInput("etaFdfmod", NULL, width = 60)),
         
         div(style="display: inline-block;vertical-align:top; width: 200px;",
             strong("df (Error):"), 
             textInput("etaFdferr", NULL, width = 60)),
         
         textInput("etaFf", "F:", width = 60),
         
         textInput("etaFalpha", "Alpha:", width = 60, placeholder = ".05"),
         
         submitButton("Calculate")
         ), #close column
  
  #output
  column(8,
          tabsetPanel(
            tabPanel("Summary", htmlOutput("ETAFsummary")),
            tabPanel("Code", helpText("Include code and annotation here
                                      about what is what.")),
            tabPanel("Help", HTML("<iframe width=\"500\" height=\"300\" 
                                 src=\"https://www.youtube.com/embed/T62maKYX9tU\" 
                                  frameborder=\"0\" allowfullscreen></iframe>"))
          ) #close tabsetPanel
        ) #close Column
  ) #close fluid row