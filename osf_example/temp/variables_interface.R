variables_tab <- tabItem(tabName = "variables_tab",
  fluidRow(
    box(
      title = tags$b("Edit Variable Metadata"),
      collapsible = TRUE,
      solidHeader = TRUE,
      width = 12,
      p("On this page, you will edit the information about the columns/variables in your 
        uploaded dataset. Double click in an individual cell to edit the information provided or 
        add your own information."),
      p("- Variable: The name of the column in the dataset. Do not edit."),
      p("- Unique Values: This column indicates the number of unique values automatically 
        calculated from your data."),
      p("- Missing Values: This column indicates the number of missing values automatically 
        calculated from your data."),
      p("- Levels: The levels variable is automatically created for items with less than 
        five unique values. These can be added or deleted for items that should/not include them."), 
      p("- Description: This column allows you to enter a text description of the variable. Use 
        this column to inform other researchers about the variable, how it is measured, etc. 
        You can define category labels (i.e. for Likert-type scales or abbreviations used in 
        character columns) under step 4 in the left hand menu."),
      p("- Type: This column is automatically created from the data input. Options include: 
        numeric (columns with numbers and decimals), integar (columns with whole numbers), 
        character (any text columns), and logical (columns with only TRUE/FALSE values)."),
      p("- Minimum Allowable: This column is automatically created from the data input. The 
        minimum score will be the lowest numeric value OR the first alphabetical value for a 
        character variable. You may wish to edit these columns based on theoretical minimum value 
        allowed."),
      p("- Maximum Allowable: This column is automatically created from the data input. The 
        maximum score will be the largest numeric value OR the last alphabetical value for a 
        character variable. You may wish to edit these columns based on theoretical maximum value 
        allowed."),
      p("- Missing Allowable: Indicate here with true/false if missing data is allowed 
        in this column."),
      p("- Missing Values: Include the code used for missing data. NA (not applicable) is 
        automatically included, however this value can be changed to another set marker, like 
        9999. The missing data column is calculated from the NA values (or blank inputs), and 
        therefore, if another marker is used, the missing column may be incorrect."),
      p("- Synonyms: A comma-separated list of common synonyms for the variable name. 
        These are user-defined and not constrained by a controlled vocabulary."),
      p("Please note that depending on browser size, the data table below may scroll side to side. 
        Also use the bottom entries pagination to continue on to the next columns (i.e., only 
        ten columns are shown at a time)."),
      
      DTOutput("vars_table")
      #actionButton("copy_var_to_desc_button", "Copy Variable Names to Description")
    )
  )
)