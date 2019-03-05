project_tab <- tabItem(tabName = "project_tab",
  fluidRow(
    box(
      title = tags$b("Project Information"),
      collapsible = TRUE,
      solidHeader = TRUE,
      width = 12,
      p(
        "Here you would put instructions about what people would be entering.
         I imagine here would be the OSF key, project title etc."
      ),
      textInput("project_name", "Project Name"),
      textInput("project_author", "Project Authors"),
      textAreaInput("project_description", "Project Description"),
      textInput("osf_key", "OSF Key"),
      fileInput("inFile", "Your Original Paper", 
                multiple = FALSE, width = NULL,
                accept = c(
                  '.pdf',
                  '.doc',
                  '.docx'
                ), 
                buttonLabel = "Browse...", 
                placeholder = "No file selected"
      ),
      actionButton("project_go", "Go!"),
      textOutput("uploaded_project")
    )
  )
)