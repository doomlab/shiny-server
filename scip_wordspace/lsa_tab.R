lsa_tab <- tabItem(tabName = "lsa_tab",
                       fluidRow(
                         titlePanel("LSA"),
                         selectInput(inputId = "rownames_select", 
                                     label = "Select Row Names:",
                                     choices = rownames(import_lsa)
                                     ), #close selectInput
                         numericInput("neighbors", "Neighbors:", 10, min = 1, max = 100),
                         mainPanel(DTOutput("lsa_data.table"))
                       ) #close fluidRow
) #close tabItem
