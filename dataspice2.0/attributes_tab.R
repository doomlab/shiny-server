attributes_tab <- tabItem(tabName = "attributes_tab",

    fluidPage(
      wellPanel(
        titlePanel(paste0("Create the Attributes Table")),
            h5("The attributes table describes each of the avaliable variables provided in
                      data. In this table, you will create a description of each column of data,
                      which is usually a different variable from the study. You can also add information
                      about the scale of the data and value labels for the points in the data.
                      Click Save Changes when you are done inputting information before you move
                     on to the next tab.")), #close help text and well panel

      fluidRow(
        # table editing helptext
        h5("Right-click on the table to delete/insert rows.",
                 "Double-click on a cell to edit. Changes are saved while on this page."),
        # table
        rHandsontableOutput("hot_attributes"),
        br()
      ), #close fluid row

      wellPanel(
        fluidRow(
          column(8, uiOutput("message_attributes", inline=TRUE),
                 list(
                   h4("Attributes Metadata:"),
                   h5('fileName = the name of the input data file(s). Do Not Change.'),
                   h5("variableName = the name of the measured variable. Do Not Change."),
                   h5('description = a written description of what that measured variable is.'),
                   h5("unitText = the units the variable was measured in, as well as any variable labels
                      for data to help the reader understand the measurement of the data. For example,
                      you might include the label values for a Likert-type scale that participants
                      used to rate the data. ")
                 ) #close list
          ), #close column
          column(4, align="right",
                 actionButton("save_attributes", "Save Changes"))
        ) #close fluid row
      ) #close well panel
    ) #close fluid page
  ) #close attributes tab
