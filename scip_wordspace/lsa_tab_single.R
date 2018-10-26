lsa_tab_single <- tabItem(tabName = "lsa_tab_single",
                       fluidRow(
                         
                         mainPanel(
                         
                           titlePanel("LSA Single Word Select"),
                         
                         selectInput(inputId = "rownames_select", 
                                     label = "Select Row Names:",
                                     choices = rownames(import_lsa)
                                     ), #close selectInput
                         
                         numericInput("neighbors", "Number of Neighbors to Display:", 10, min = 1, max = 100),
                         
                         sliderInput(inputId = "select_range", 
                                     label = "Set Cosine Range:", 
                                     min = -1, 
                                     max = 1,
                                     value = c(-1,1),
                                     step = .01)
                         
                         ), #close main panel 
                         
                         mainPanel(
                           h4("Plot of Nearest Neighbors"),
                           plotOutput("lsa_plotneighbors"),
                           br(),
                           h4("Neighbors Within Selected Cosine Range"),
                           DTOutput("lsa_choosetarget")
                           ) #close main panel
                         ) #close fluidRow
                   ) #close tabItem
