data_tab <- tabItem(tabName = "data_tab",
  fluidRow(
    box(title = "Upload Data",
        width = 6,
        solidHeader = T,
        status = "primary",
        collapsible = T,
        h4("Upload your data here."),
        
      ##supress red error
      #tags$style(type="text/css",
          #       ".shiny-output-error { visibility: hidden; }",
            #     ".shiny-output-error:before { visibility: hidden; }"),
      
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
    ), #close box one
    
    box(title = "Use Our Data",
        width = 6,
        solidHeader = T,
        status = "primary",
        collapsible = T,
        h4("Use our data."),
        selectInput("pick_data", "Data Set:",
                    c(#"None" = "none_selected",
                      "English LSA Space: TASA" = "TASA",
                      "English LSA Space: BNC/ukWaC/Wikipedia" = "ENLSA")
        ),
        mainPanel(DTOutput("ourdata_table"))
        ) #close box two
  
    ) #close fluid row
  
) #close tab item
