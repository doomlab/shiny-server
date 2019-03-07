data_tab <- tabItem(tabName = "data_tab",
  fluidRow(
    
    box(title = "Upload Data",
        width = 12,
        solidHeader = T,
        status = "primary",
        collapsible = T,
        h4("Upload your data to analyze here. You can use .csv or Excel files. The file 
           should be formated where each document is in one cell in and these documents are 
           one column of data. By default, only the first column will be analyzed."),
      ##supress red error
      tags$style(type="text/css",
                 ".shiny-output-error { visibility: hidden; }",
                 ".shiny-output-error:before { visibility: hidden; }"),
      
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
      DTOutput("inputdata_table")
      ) #close box one
    ) #close fluid row
  ) #close tab item
