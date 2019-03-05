different_tab <- tabItem(tabName = "different_tab",
  fluidRow(
    box(
      title = tags$b("Create Project"),
      collapsible = TRUE,
      solidHeader = TRUE,
      width = 12,
      p("Here you could have a second page that does an upload."),
      fileInput("inFile", "TXT/CSV/XLS(X)/SAV/SAS Data File", 
                multiple = FALSE, width = NULL,
                accept = c(
                  'text/csv',
                  'text/comma-separated-values,text/plain',
                  '.csv',
                  '.xls',
                  '.xlsx',
                  '.sav',
                  '.sas'
                ), 
                buttonLabel = "Browse...", 
                placeholder = "No file selected"
      ),
      checkboxInput("header", "Data file has a header", TRUE)
    )
  )
)