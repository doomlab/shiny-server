lsa_tab <- tabItem(tabName = "lsa_tab",
                       fluidRow(
                         titlePanel("LSA"),
                         mainPanel(DTOutput("lsa_table"))
                       ) #close fluidRow
) #close tabItem
