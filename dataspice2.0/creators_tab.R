creators_tab <- tabItem(tabName = "creators_tab",
      fluidPage(
        titlePanel(paste0("Populate the Creators table")),
        helpText("Shiny app to read in the", code("dataspice"), "metadata templates and populate with user supplied metadata"),
        
        # Header panel
        wellPanel(
          fluidRow(
            column(8, helpText("We could put something here?")),
            column(4, align="right",
                   h3("Save table"),
                   actionButton("save_creators", "Save Changes"))
          ) #close fluid row
        ), #close wellpanel
        
        # side panel
        sidebarLayout(
          # side panel contains reference details. conditional on file.
          sidebarPanel(
            list(
              h6('ID = text: ORCID ID'),
              h6("givenName = text: the given name(s) of the creator."),
              h6('familyName = text: the family name(s) of the creator.'),
              h6("unitText = text: affiliation of the creator.'")
            ) #close list
          ), #close side bar panel
          
          mainPanel(
            # table editing helptext
            helpText("Right-click on the table to delete/insert rows.",
                     "Double-click on a cell to edit"),
            # table
            rHandsontableOutput("hot_creators"),
            br()
          ) #close main panel
        ) #close side bar layout
      ) #close fluid page
    ) #close creators tab