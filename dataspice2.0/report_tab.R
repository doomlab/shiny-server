report_tab <- tabItem(tabName = "report_tab",
      fluidPage(
        titlePanel(paste0("Final Report")),
        helpText("Shiny app to read in the", code("dataspice"), "metadata templates and populate with user supplied metadata"),
        
          fluidRow(
            
            h4(textOutput("title")),
            htmlOutput("report")
            ) #close fluid row
      ) #close fluid page
    ) #close report tab