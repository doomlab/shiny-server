topics_tab <- tabItem(tabName = "topics_tab",
                       fluidRow(
                         
                         box(title = "Model Selection:",
                             width = 12,
                             solidHeader = T,
                             status = "primary",
                             collapsible = T,
                             h4("Topics models information. "),
                             selectInput("pick_model", "Model:",
                                       c("LDA Fit" = "LDA_fit",
                                         "LDA Fixed" = "LDA_fixed",
                                         "LDA Gibbs" = "LDA_gibbs",
                                         "CTM Fit" = "CTM_fit")
                           ), #close selectInput
                         
                        numericInput("notopics", "Number of Topics to Analyze:", 10, min = 1, max = 100),
                        
                        numericInput("SEED", "Pick a Random Seed:", 10, min = 1, max = 10000),
                       
                        numericInput("noterms", "Number of Terms to Display:", 10, min = 1, max = 10000)
                        
                         ), #close box
                       
                        box(title = "Model Information:",
                            width = 6,
                            solidHeader = T,
                            status = "primary",
                            collapsible = T,
                            h4("Alpha:"),
                            textOutput("alpha_topics"),
                            h4("Entropy:"),
                            textOutput("entropy_topics")
                          
                        ), #close box
                        
                        box(title = "Topic Matrix:",
                            width = 6,
                            solidHeader = T,
                            status = "primary",
                            collapsible = T,
                            h4("Topics information here.")
                        ), #close box
                        
                        box(title = "Topic Summary:",
                            width = 6,
                            solidHeader = T,
                            status = "primary",
                            collapsible = T,
                            h4("or add the 
                               overall frequency of most popular topic. ")
                        ), #close box
                        
                        box(title = "Terms by Topic:",
                            width = 6,
                            solidHeader = T,
                            status = "primary",
                            collapsible = T,
                            h4("Topic term table here. indicate most frequent topic here. or add the 
                               overall frequency of most popular topic. ")
                        ), #close box
                        
                        box(title = "Beta Weight Graph:",
                            width = 12,
                            solidHeader = T,
                            status = "primary",
                            collapsible = T,
                            h4("Topics models information. ")
                        ) #close box
                        ) #close fluidRow
                      ) #close tab
