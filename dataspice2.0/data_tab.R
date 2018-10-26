data_tab <- tabItem(tabName = "data_tab",
  fluidPage(
    wellPanel(
      h4("Upload Data"),
      width = 12,
      h5("This Shiny app was created to help researchers create a data dictionary that supplies the
        reader with information about a dataset that the researcher wishes to share. You will want to
        first upload your data, and then follow the steps on the left side panel in order. At the end
        of following the steps, you will have .csv files of the different schema.org requirements for
        datasets: attributes, access, bibliography, and creators. In addition, the app generates a .json
        file of this information to create a machine readable document for the dataset. Last, you can
        generate an HTML report of the information you entered to share with others for maximum reach
        to all audiences."),
      fileInput("inFile", ".TXT/CSV/XLS(X) Data File",
                multiple = FALSE, width = NULL,
                accept = c(
                  'text/csv',
                  'text/comma-separated-values,text/plain',
                  '.csv',
                  '.xls',
                  '.xlsx'
                ),
                buttonLabel = "Browse...",
                placeholder = "No file selected"
      ),
      checkboxInput("header", "My data file has a header.", TRUE),
      h5("Here's a preview of your uploaded data:"),
      DTOutput("rawdata_table")
    )
  )
)
