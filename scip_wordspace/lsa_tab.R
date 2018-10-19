lsa_tab <- tabItem(tabName = "lsa_tab",
                       fluidRow(
                         titlePanel("LSA"),
                         selectInput("rownames_select", "Select Row Names:",
                                     rownames(import_lsa)
                                     ), #close selectInput
                         numericInput("neighbors", "Neighbors:", 10, min = 1, max = 100),
                         mainPanel(DTOutput("lsa_data.table"))
                       ) #close fluidRow
) #close tabItem
