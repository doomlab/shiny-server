access_tab <- tabItem(tabName = "access_tab",
      fluidPage(
        wellPanel(
        titlePanel(paste0("Create the Access Table")),
        h5("The access table helps the reader know the name, type,
                 and location of the data file. Follow the key below in order
                 to know what to include in each column. Click Save Changes
                 when you are done inputting information before you move
                 on to the next tab.")), #close help text and well panel

        fluidRow(
          # table editing helptext
          h5("Right-click on the table to delete/insert rows.",
                   "Double-click on a cell to edit. Changes are saved while on this page."),
          # table
          rHandsontableOutput("hot_access"),
          br()
        ), #close fluid row

        wellPanel(
          fluidRow(
            column(8, uiOutput("message_access", inline=TRUE),
                   list(
                     h4("Access Metadata:"),
                     h5('fileName = the filename of the input data file(s).'),
                     h5("name = the human readable name for the file. This name allows readers to create
                        a reference to your data, as well as understand what is in the data."),
                     h5('contentUrl = a url to where the data is hosted, if applicable. Consider
                        sharing your data on open science websites.'),
                     h5("fileFormat = the file format, such as .csv, .sav, or .xlsx.")
                   ) #close list
            ),
            column(4, align="right",
                   actionButton("save_access", "Save Changes"))
          ) #close fluid row
        ) #close well panel
      ) #close fluid page
    ) #close access tab
