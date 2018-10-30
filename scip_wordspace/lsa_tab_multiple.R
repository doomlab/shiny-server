
lsa_tab_multiple <- tabItem(tabName = "lsa_tab_multiple",
                        fluidRow(
                          
                          mainPanel(
                           
                            titlePanel("LSA Multiple Word Select"),
                            selectizeInput("tags", "Select Tags:", 
                                           choices = c(rownames(import_lsa)), 
                                           multiple = TRUE), #close selectizeInput
                            p("Please choose a minimum of three tags for model to work."),
                            DTOutput("lsa_multicos"), 
                            p("Explain what is going on in the graph"),
                            br(),
                            
                            plotOutput("lsa_plotwordlist")
                            ) #close main panel
                          ) #close fluidRow
                        ) #close tabItem

