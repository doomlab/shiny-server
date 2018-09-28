access_tab <- tabItem(tabName = "access_tab",
      fluidPage(
        titlePanel(paste0("Populate the Access table")),
        helpText("Shiny app to read in the", code("dataspice"), "metadata templates and populate with user supplied metadata"),
        
        # Header panel
        wellPanel(
          fluidRow(
            column(8, helpText("We could put something here?")),
            column(4, align="right",
                   h3("Save table"),
                   actionButton("save_access", "Save Changes"))
          ) #close fluid row
        ), #close wellpanel
        
        # side panel
        sidebarLayout(
          # side panel contains reference details. conditional on file.
          sidebarPanel(
            list(
              h6('fileName = the filename of the input data file(s).'),
              h6("name = the human readable name for the file."),
              h6('contentUrl = a url to where the data is hosted, if applicable'),
              h6("fileFormat = the file format.")
            ) #close list
          ), #close side bar panel
          
          mainPanel(
            # table editing helptext
            helpText("Right-click on the table to delete/insert rows.",
                     "Double-click on a cell to edit"),
            # table
            rHandsontableOutput("hot_access"),
            br()
          ) #close main panel
        ) #close side bar layout
      ) #close fluid page
    ) #close access tab