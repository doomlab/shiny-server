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
            column(8, helpText("Hit the Save Changes button to save this file.", inline=TRUE),
                   list(
                     h4("Access Metadata:"),
                     h5('fileName = The filename of the input data file(s).'),
                     h5("name = The human readable name for the file. This name allows readers to create
                        a reference to your data, as well as understand what is in the data."),
                     h5('contentUrl = A url to where the data is hosted, if applicable. Consider
                        sharing your data on open science websites.'),
                     h5("fileFormat = The file format, such as .csv, .sav, or .xlsx.")
                   ) #close list
            ),
            column(4, align="right",
                   downloadButton("save_access", "Save Changes"))
          ) #close fluid row
        ) #close well panel
      ) #close fluid page
    ) #close access tab
