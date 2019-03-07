
lsa_tab_multiple <- tabItem(tabName = "lsa_tab_multiple",
                        fluidRow(
                          
                          box(title = "Output Choices:",
                              width = 12,
                              solidHeader = T,
                              status = "primary",
                              collapsible = T,
                              h4("On this page, you can select multiple words to view their relatedness to each other, 
                              while the single word page selects words based on their relatedness. 
                                 Please choose a minimum of three words to view output. If you still see an 
                                 error message, you should select additional options, as that indicates that at 
                                 least one of the selected words is not related to the other concepts."),
                              htmlOutput("multiple_selectUI")
                          ), #close box
                          
                          box(title = "Plot of Neighbors:",
                              width = 6,
                              solidHeader = T,
                              status = "primary",
                              collapsible = T,
                              h4("This plot displays relationship of the selected words in two-dimensional space. 
                              The closeness of the concepts (i.e., how far apart they are) 
                              indicates how related they are to each other in this corpus."),
                              plotOutput("lsa_plotwordlist")
                          ) , #close box
                          
                          box(title = "Cosine Values:",
                              width = 6,
                              solidHeader = T,
                              status = "primary",
                              collapsible = T,
                              h4("This table includes the cosine values for all the selected words compared 
                                 against each other. Use the buttons at the bottom of the table to download 
                                 or save the data."),
                              DTOutput("lsa_multicos")
                              ) # close box
                          ) #close fluidRow
                        ) #close tabItem


# corpus section ----------------------------------------------------------

lsa_tab_multiple_corpus <- tabItem(tabName = "lsa_tab_multiple_corpus",
                            fluidRow(
                              
                              box(title = "Output Choices:",
                                  width = 12,
                                  solidHeader = T,
                                  status = "primary",
                                  collapsible = T,
                                  h4("On this page, you can select multiple words to view their relatedness to each other, 
                                  while the single word page selects words based on their relatedness. 
                                  This page shows you the English Wikipedia and British National Corpus data, and only the 
                                  first 200 most common words are shown to keep the app running smoothly. 
                                 Please choose a minimum of three words to view output. If you still see an 
                                 error message, you should select additional options, as that indicates that at 
                                 least one of the selected words is not related to the other concepts."),
                                  selectizeInput("multiple_select_corpus", "Select Words:", 
                                                 choices = rownames(wonderland)[1:100],
                                                 multiple = TRUE) #close selectizeInput
                              ), #close box
                              
                              box(title = "Plot of Neighbors:",
                                  width = 6,
                                  solidHeader = T,
                                  status = "primary",
                                  collapsible = T,
                                  h4("This plot displays relationship of the selected words in two-dimensional space. 
                              The closeness of the concepts (i.e., how far apart they are) 
                              indicates how related they are to each other in this corpus."),
                                  plotOutput("lsa_plotwordlist_corpus")
                              ) , #close box
                              
                              box(title = "Cosine Values:",
                                  width = 6,
                                  solidHeader = T,
                                  status = "primary",
                                  collapsible = T,
                                  h4("This table includes the cosine values for all the selected words compared 
                                 against each other. Use the buttons at the bottom of the table to download 
                                 or save the data."),
                                  DTOutput("lsa_multicos_corpus")
                              ) # close box
                            ) #close fluidRow
                            ) #close tabItem


