labels_tab <- tabItem(tabName = "labels_tab",
  fluidRow(
    box(
      title = tags$b("Category Labels"),
      collapsible = TRUE,
      solidHeader = TRUE,
      width = 12,
      # TODO:add support for multiple edit
      p("On this page, you can define a description for each individual value of a variable. 
        For example, if you use a Likert-type scale, you may wish to define the labels for the points 
        used on that scale. Additionally, you can define any abbreviations used for category labels. 
        The description column will default to the unique values, and you can double click to 
        edit those values. Do not edit the values column, so the output matches the original data."),
      selectInput("level_col_select",
                  label = "Columns",
                  choices = c(),
                  multiple = FALSE), 
      DTOutput("level_col_table")
    )
  )
)