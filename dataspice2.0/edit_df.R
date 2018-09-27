edit_file <- function(what_edit, what_edit_type, what_df){

  require(rhandsontable)
  require(dplyr)

  ui <- 
    shinyUI(
  
      fluidPage(
        titlePanel(paste0("Populate the ", what_edit_type," table")),
        helpText("Shiny app to read in the", code("dataspice"), "metadata templates and populate with user supplied metadata"),

      # Header panel
      wellPanel(
        fluidRow(
          column(8, helpText("We could put something here?")),
          column(4, align="right",
                 h3("Save table"),
                 actionButton("save", "Save Changes"))
          ) #close fluid row
        ), #close wellpanel
      
      # side panel
      sidebarLayout(
        # side panel contains reference details. conditional on file.
        sidebarPanel(
          if (what_edit == "attributes_df"){
            list(
              h4("Variable attribute metadata"),
              h6('fileName = the name of the input data file(s). Do Not Change.'),
              h6("variableName = the name of the measured variable. Do Not Change."),
              h6('Description = a written description of what that measured variable is'),
              h6("unitText = the units the variable was measured in")
            )
          },
          if (what_edit == "biblio_df"){
            list(
              h4("Bibliographic metadata"),
              h6('title = text: Title of the dataset(s) described.'),
              h6("description = text: Description of the dataset(s) described"),
              h6('datePublished = text: The date published in ISO 8601 format (YYYY-MM-DD)'),
              h6("citation = text: citation for the dataset(s) described"),
              h6("keywords = text: keywords, separated by commas, associated with the dataset(s) described"),
              h6("license = text: license under which data are published"),
              h6("funder = text: Name of funders associated with the work through which data where generated"),

              br(),
              h4("Spatial Coverage metadata"),
              h6('geographicDescription = text: Description of the area of study'),
              h6("northBoundCoord = numeric or text: southern latitudinal boundary of the data coverage area. For example 37.42242 (WGS 84)"),
              h6("eastBoundCoord = numeric or text: eastern longitudinal boundary of the data coverage area. For example -122.08585 (WGS 84)"),
              h6("southBoundCoord = numeric or text: northern latitudinal boundary of the data coverage area."),
              h6("westBoundCoord = numeric or text: western longitudinal boundary of the data coverage area."),
              h6("wktString = text: string of Well-known Text (WKT) formatted representation of geometry. see:",
                 a(href="https://ropensci.org/tutorials/wellknown_tutorial/", "pkg", code("wellknown")), "for details."),
              helpText("To provide a single point to describe the spatial
                             aspect of the dataset, provide the same coordinates
                             for east-west and north-south boundary definition"),
              br(),
              h4("Temporal Coverage metadata"),
              h6('startDate = text: The start date of the data temporal coverage in ISO 8601 format (YYYY-MM-DD)'),
              h6("endDate = text: The end date of the data temporal coverage in ISO 8601 format (YYYY-MM-DD)")
            )},
          if (what_edit == "access_df"){
            list(
              h6('fileName = the filename of the input data file(s).'),
              h6("name = the human readable name for the file."),
              h6('contentUrl = a url to where the data is hosted, if applicable'),
              h6("fileFormat = the file format.")
            )},
          if (what_edit == "creators_df"){
            list(
              h6('ID = text: ORCID ID'),
              h6("givenName = text: the given name(s) of the creator."),
              h6('familyName = text: the family name(s) of the creator.'),
              h6("unitText = text: affiliation of the creator.'")
            )}
        ),
        mainPanel(
          # table editing helptext
          helpText("Right-click on the table to delete/insert rows.",
                   "Double-click on a cell to edit"),
          # table
          rHandsontableOutput("hot"),
          br()
        ) #close main panel
      ) #close side bar layout
    ) #close fluid page
  ) #close shinyUI

  server <- shinyServer(function(input, output) {

    values <- reactiveValues()

    # pad if no data
    if(nrow(what_df) == 0){
      what_df <- dplyr::add_row(what_df)
    }

    output$hot <- renderRHandsontable({
      rhandsontable(what_df,
                    useTypes = TRUE,
                    stretchH = "all") %>%
        hot_context_menu(allowColEdit = FALSE)
    })

    ## Save
    observeEvent(input$save, {
      finalDF <- hot_to_r(input$hot)
      # remove padding if none edited
      finalDF %>%
        dplyr::filter_all(dplyr::any_vars(!is.na(.))) %>%
        readr::write_csv(path = inFile$datapath)
    })

  })

  ## run app
  runApp(list(ui=ui, server=server))
  return(invisible())
}
