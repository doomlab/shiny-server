lsa_tab <- tabItem(tabName = "lsa_tab",
                       fluidRow(
                         mainPanel(
                         titlePanel("LSA Single Word Select"),
                         selectInput(inputId = "rownames_select", 
                                     label = "Select Row Names:",
                                     choices = rownames(import_lsa)
                                     ), #close selectInput
                         numericInput("neighbors", "Neighbors:", 10, min = 1, max = 100),
                         sliderInput(inputId = "select_range", 
                                     label = "Select range:", 
                                     min = -1, 
                                     max = 1,
                                     value = c(-1,1),
                                     step = .01)
                         ), #close main panel 
                         mainPanel(plotOutput("lsa_plotneighbors"),
                                   br(),
                                   DTOutput("lsa_choosetarget"),
                                   ), #close main panel
                         br(),
                         titlePanel("LSA Multiple Word Select"),
                         mainPanel(selectizeInput("tags", "Select Tags:", 
                                                  choices = c(
                                                    rownames(import_lsa), 
                                                    multiple = TRUE),
                                                  DTOutput("lsa_multicos"))
                                   ) #close main panel
                         ) #close fluidRow
                   ) #close tabItem
