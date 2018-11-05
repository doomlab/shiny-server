topics_tab <- tabItem(tabName = "topics_tab",
                       fluidRow(

                         mainPanel(
                         
                           titlePanel("Topic Structure"),
                         
                        numericInput("topics", "Topics to Display", 10, min = 1, max = 100),
                        
                        numericInput("SEED", "Seed", 10, min = 1, max = 10,000)
                         
                         ) #close main panel 

                         ) #close fluidRow
                   ) #close tabItem
