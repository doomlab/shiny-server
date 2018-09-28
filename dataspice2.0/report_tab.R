report_tab <- tabItem(tabName = "report_tab",
      fluidPage(
        titlePanel(paste0("Final Report")),
        helpText("Shiny app to read in the", code("dataspice"), "metadata templates and populate with user supplied metadata"),
        
        # Header panel
        wellPanel(
          fluidRow(
            column(8, helpText("We could put something here?")),
            column(4, align="right",
                   h3("Save Report"),
                   actionButton("save_report", "Save Changes"))
          ) #close fluid row
        ), #close wellpanel
        
          mainPanel(
            
            h4(textOutput("title")),
            htmlOutput("report")
            ) #close main panel
      ) #close fluid page
    ) #close report tab