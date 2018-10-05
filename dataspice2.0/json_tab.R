json_tab <- tabItem(tabName = "json_tab",
      fluidPage(
        titlePanel(paste0("Download the json format")),
        helpText("Shiny app to read in the", code("dataspice"), "metadata templates and populate with user supplied metadata"),
        
        # Header panel
        wellPanel(
          fluidRow(
            column(8, uiOutput("message_json", inline=TRUE)),
            column(4, align="right",
                   h3("Save table"),
                   actionButton("save_json", "Save Changes"))
          ) #close fluid row
        ), #close well panel
        mainPanel(
          textOutput("print_json")
        )#close main panel
      ) #close fluid page
    ) #close json tab