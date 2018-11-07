topics_tab <- tabItem(tabName = "topics_tab",
                       fluidRow(
                         
                         mainPanel(

                       titlePanel("Topic Structure"),
                           
                           selectInput("pick_model", "Model:",
                                       c("LDA Fit" = "LDA_fit",
                                         "LDA Fixed" = "LDA_fixed",
                                         "LDA Gibbs" = "LDA_gibbs",
                                         "CTM Fit" = "CTM_fit")
                           ), #close selectInput
                         
                        numericInput("topics", "Number of Topics to Display:", 10, min = 1, max = 100),
                        
                        numericInput("SEED", "Seed:", 10, min = 1, max = 10,000)
                        
                         ), #close main panel 
                          
                          DTOutput("modeltopics_table")

                         ) #close fluidRow
                      
)
