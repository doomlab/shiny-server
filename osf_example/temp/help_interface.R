help_tab <- tabItem(tabName = "help_tab",
  fluidRow(
    box(
      title = tags$b("Help"),
      collapsible = TRUE,
      solidHeader = TRUE,
      width = 12,
      tags$b(h3("Metadata Format")),
      p(
        "If metadata is included, this should be specified as a nested JSON file containing a name, a description, an author, and a variable object. The nested variable object must minimally encode a list of objects, one per variable. Each object has the following keys:"
      ),
      tags$ol(
        tags$li("variable: name of variable"),
        tags$li("description: description of variable"),
        tags$li("[type]: “string”, “int”, “float”, “bool”"),
        tags$li("[min]: minimum valid value (not necessarily observed value)"),
        
        tags$li("[max]: maximum valid value (not necessarily observed value)"),
        tags$li("[levels]: valid levels of a categorical (string) variable"),
        tags$li("[na] (bool): whether or not missing values are allowed"),
        tags$li(
          "[na_values]: values to be treated as missing or invalid observations. Defaults to [“NA”, “N/A”, “n/a”, “NaN”, “nan”]"
        ),
        tags$li(
          "[synonyms]: A comma-separated list of common synonyms for the variable name. These are user-defined and not constrained by a controlled vocabulary."
        )
      )
    )
  )
)