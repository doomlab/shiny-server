data_tab <- tabItem(tabName = "data_tab",
  fluidRow(
    box(
      title = "Upload Data",
      width = 12,
      p("We can write instructions here."),
      fileInput("inFile", "CSV/XLS(X) Data File", 
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
      checkboxInput("header", "Data file has a header", TRUE),
      DTOutput("rawdata_table")
    )
  )
)