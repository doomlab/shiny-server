lsa_tab_target <- tabItem(tabName = "lsa_tab_target",
                       fluidRow(
                         titlePanel("LSA"),
                         selectInput(inputId = "rownames_select_2", 
                                     label = "Select Row Names:",
                                     choices = rownames(import_lsa)
                                     ), #close selectInput
                         numericInput("neighbors2", "Neighbors:", 10, min = 1, max = 100),
                         sliderInput(inputId = "select_range", 
                                     label = "Select range:", 
                                     min = -1, 
                                     max = 1,
                                     value = c(-1,1)),
                         mainPanel(DTOutput("lsa_data.table2"))
                       ) #close fluidRow
) #close tabItem
