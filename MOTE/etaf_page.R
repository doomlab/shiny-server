#fluid row
fluidRox( #open fluid row
  
  #input
  column(4, 
         style = "background-color: #E8E8E8",
         
         #change title
         div(style="display: inline-black; vertical-align:top; text-align:center; width: 100%;",
            strong("Eta from F")),
         
         #input boxes here
            textInput("ETAmod", "df (Model):", width = 60),
             
            br(),
            div(style="display: inline-block;vertical-align:top; width: 100px",
                 textInput("ETAerr", "df (Error):", width = 60)),
         
            br(),
            div(style="display: inline-block; vertical-align:top; width: 100px",
                textInput("ETAfva", "F (value):", width = 60)),
         submitButton("Calculate")
         ) #close column
  
  #output
  column(8,
          tabsetPanel(
            tabPanel("Summary", helpText("ETAsummary")),
            tabPabel("Code", helpText("Include code and annotation here
                                      about what is what.")),
            tabPanel("Help", HTML("<iframe width=\"500\" height=\"300\" 
                                 src=\"https://www.youtube.com/embed/T62maKYX9tU\" 
                                  frameborder=\"0\" allowfullscreen></iframe>"))
          ) #close tabsetPanel
        ) #close Column
  ) #close fluid row