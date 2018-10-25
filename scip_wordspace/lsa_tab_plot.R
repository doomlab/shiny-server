
lsa_tab_plot <- tabItem(tabName = "lsa_tab_plot",
                        fluidRow(
                          mainPanel(
                            titlePanel("LSA Word Plot"),
                            selectizeInput("tags", "Select Tags:", 
                                           choices = c(rownames(import_lsa)), 
                                           multiple = TRUE) #close selectizeInput
                        ), #close main panel 
                        mainPanel(plot_wordlist(method = "MDS", 
                                                dims = 2,
                                                tvectors = import_lsa))

) #close fluidRow
) #close tabItem

