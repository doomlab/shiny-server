
lsa_tab_multiple <- tabItem(tabName = "lsa_tab_multiple",
                        fluidRow(
                          
                          mainPanel(
                            titlePanel("LSA Multiple Word Select"),
                            selectizeInput("tags", "Select Tags:", 
                                           choices = c(rownames(import_lsa)), 
                                           multiple = TRUE), #close selectizeInput
                            DTOutput("lsa_multicos"), 
                            br(),
                            
                            plotOutput("lsa_plotwordlist")
                            ) #close main panel
                          ) #close fluidRow
                        ) #close tabItem

