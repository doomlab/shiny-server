
lsa_tab_multiple <- tabItem(tabName = "lsa_tab_multiple",
                        fluidRow(
                          
                          
                          p("Please choose a minimum of three tags for model to work."),
                          mainPanel(
                           
                            titlePanel("LSA Multiple Word Select"),
                            selectizeInput("tags", "Select Tags:", 
                                           choices = c(rownames(import_lsa)), 
                                           multiple = TRUE), #close selectizeInput
                            p("This graph is demonstrating how close the different tags choosen are related relative to work neighborhoods."),
                            DTOutput("lsa_multicos"), 
                            br(),
                            
                            plotOutput("lsa_plotwordlist")
                            
                            ) #close main panel
                          ) #close fluidRow
                        ) #close tabItem

