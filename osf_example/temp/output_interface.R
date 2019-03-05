output_tab <- tabItem(tabName = "output_tab",
  fluidRow(
    box(
      title = tags$b("Output"),
      collapsible = TRUE,
      solidHeader = TRUE,
      width = 12,
      p("On this page, you can download several versions of the information you created in steps 
        3 and 4."),
      p("The Variable Metadata is a CSV file that contains the metadata 
        information you entered on step 3."),
      p("The Category Labels file is a CSV file that contains the metadata information 
        for category labels you entered in step 4."),
      p("The RData format (.Rdata) is a format designed for use with R, that combines the 
        information you entered in each step into one file with the data and attributes put 
        together."),
      p("The JSON format (.Rdata) is a machine readable format that combines the variable and 
        category label metadata into one structured file."),
      downloadButton("output_csv", "Download Variable Metadata"),
      downloadButton("output_attributes", "Download Category Labels"),
      downloadButton("output_rdata", "Download Rdata file"),
      downloadButton("output_JSON", "Download JSON file")
    )
  )
)

