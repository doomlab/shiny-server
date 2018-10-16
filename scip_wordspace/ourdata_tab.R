ourdata_tab <- tabItem(tabName = "ourdata_tab",
  fluidRow(
    titlePanel("Word Visualization"),
    selectInput("pick_data", "Data Set:",
                c("English LSA Space: TASA" = "TASA",
                  "English HAL Space: BNC/ukWaC/Wikipedia" = "EN",
                  "English LSA Space: BNC/ukWaC/Wikipedia" = "ENLSA")
    ), #close selectInput
   mainPanel(DTOutput("ourdata_table"))
  ) #close fluidRow
) #close tabItem