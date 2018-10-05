attributes_tab <- tabItem(tabName = "attributes_tab",
      fluidPage(
        titlePanel(paste0("Populate the Attributes table")),
        helpText("Shiny app to read in the", code("dataspice"), "metadata templates and populate with user supplied metadata"),
        
        # Header panel
        wellPanel(
          fluidRow(
            column(8, uiOutput("message_attributes", inline=TRUE)),
            column(4, align="right",
                   h3("Save table"),
                   actionButton("save_attributes", "Save Changes"))
          ) #close fluid row
        ), #close wellpanel
        
        # side panel
        sidebarLayout(
          # side panel contains reference details. conditional on file.
          sidebarPanel(
              list(
                h4("Variable attribute metadata"),
                h6('fileName = the name of the input data file(s). Do Not Change.'),
                h6("variableName = the name of the measured variable. Do Not Change."),
                h6('Description = a written description of what that measured variable is'),
                h6("unitText = the units the variable was measured in")
              ) #close list
          ), #close side bar panel
          
          mainPanel(
            # table editing helptext
            helpText("Right-click on the table to delete/insert rows.",
                     "Double-click on a cell to edit"),
            # table
            rHandsontableOutput("hot_attributes"),
            br()
          ) #close main panel
        ) #close side bar layout
      ) #close fluid page
    ) #close attributes tab