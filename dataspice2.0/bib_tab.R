bib_tab <- tabItem(tabName = "bib_tab",

   fluidPage(
    wellPanel(
      titlePanel(paste0("Create the Bibliography Table")),
        h5("The bibliography table gives the reader information about how to cite and use your data,
                as well as information about the data collection. Click Save Changes
                 when you are done inputting information before you move
                 on to the next tab.")), #close help text and well panel

    fluidRow(
      # table editing helptext
      h5("Right-click on the table to delete/insert rows.",
               "Double-click on a cell to edit. Changes are saved while on this page."),
      # table
      rHandsontableOutput("hot_bib"),
      br()
    ), #close fluid row

    wellPanel(
      fluidRow(
        column(8, helpText("Hit the Save Changes button to save this file.", inline=TRUE),
               list(
                 h4("Bibliographic Metadata:"),
                 h5('title = Title of the dataset(s) described.'),
                 h5("description = Description of the dataset(s) described."),
                 h5('datePublished = The date published in ISO 8601 format (YYYY-MM-DD).'),
                 h5("citation = Citation for the dataset(s) described."),
                 h5("keywords = Keywords, separated by commas, associated with the dataset(s) described."),
                 h5("license = License under which data are published."),
                 h5("funder = Name of funders associated with the work through which data where generated."),

                 br(),
                 h4("Spatial Coverage Metadata:"),
                 h5('geographicDescription = Description of the area of study. For example, you can list the
                    cities, states, country of the participants involved in the research.'),
                 br(),
                 h4("Temporal Coverage Metadata:"),
                 h5('startDate = The start date of the data collection in ISO 8601 format (YYYY-MM-DD).'),
                 h5("endDate = The end date of the data collection in ISO 8601 format (YYYY-MM-DD).")
               ) #close list
        ),
        column(4, align="right",
               downloadButton("save_bib", "Save Changes"))
      ) #close fluid row
    ) #close well panel
   ) #close fluid page
) #close access tab
