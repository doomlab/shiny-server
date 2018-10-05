ourdata_tab <- tabItem(tabName = "ourdata_tab",
  fluidRow(
    titlePanel("Word Visualization"),
    selectInput("dataset", "Data Set:",
                c("English LSA Space: TASA" = "TASA",
                  "English HAL Space: BNC/ukWaC/Wikipedia" = "EN",
                  "English LSA Space: BNC/ukWaC/Wikipedia" = "ENLSA")
    )
  )
)