bib_tab <- tabItem(tabName = "bib_tab",
      fluidPage(
        titlePanel(paste0("Populate the Bibliography table")),
        helpText("Shiny app to read in the", code("dataspice"), "metadata templates and populate with user supplied metadata"),
        
        # Header panel
        wellPanel(
          fluidRow(
            column(8, helpText("We could put something here?")),
            column(4, align="right",
                   h3("Save table"),
                   actionButton("save_bib", "Save Changes"))
          ) #close fluid row
        ), #close wellpanel
        
        # side panel
        sidebarLayout(
          # side panel contains reference details. conditional on file.
          sidebarPanel(
            list(
              h4("Bibliographic metadata"),
              h6('title = text: Title of the dataset(s) described.'),
              h6("description = text: Description of the dataset(s) described"),
              h6('datePublished = text: The date published in ISO 8601 format (YYYY-MM-DD)'),
              h6("citation = text: citation for the dataset(s) described"),
              h6("keywords = text: keywords, separated by commas, associated with the dataset(s) described"),
              h6("license = text: license under which data are published"),
              h6("funder = text: Name of funders associated with the work through which data where generated"),
              
              br(),
              h4("Spatial Coverage metadata"),
              h6('geographicDescription = text: Description of the area of study'),
              br(),
              h4("Temporal Coverage metadata"),
              h6('startDate = text: The start date of the data temporal coverage in ISO 8601 format (YYYY-MM-DD)'),
              h6("endDate = text: The end date of the data temporal coverage in ISO 8601 format (YYYY-MM-DD)")
            ) #close list
          ), #close side bar panel
          
          mainPanel(
            # table editing helptext
            helpText("Right-click on the table to delete/insert rows.",
                     "Double-click on a cell to edit"),
            # table
            rHandsontableOutput("hot_bib"),
            br()
          ) #close main panel
        ) #close side bar layout
      ) #close fluid page
    ) #close bib tab