lsa_document_tab <- tabItem(tabName = "lsa_document_tab",
                       fluidRow(
                         
                         mainPanel(
                         
                           titlePanel("LSA Document Functions"),
                           
                           selectInput(inputId = "document_select",
                                       label = "Select Document:",
                                       #choices = 1:nrow(importdf))
                                       choices = 1:3)
                         
                         ), #close main panel 
                         
                         mainPanel(
                           DTOutput("local_coherence"),
                           br(),
                           textOutput("global_coherence"),
                           br(),
                           textOutput("generic_summary")
                           ) #close main panel
                         ) #close fluidRow
                   ) #close tabItem
