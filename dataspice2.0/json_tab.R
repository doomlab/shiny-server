json_tab <- tabItem(tabName = "json_tab",

    fluidPage(
      wellPanel(
        titlePanel(paste0("Download the .json Format")),
          h5("This page allows you to download the .json file of all the metadata 
             you have just created by filling in the previous pages. JSON files are 
             machine (computer) readable files that indicate information about the data 
             you are providing. The format used here is from schema.org.")), #close help text and well panel  

      
      wellPanel(
        fluidRow(
          column(8, helpText("Hit the Save Changes button to save this file.", inline=TRUE),
                 textOutput("print_json")
          ), #close column
          column(4, align="right",
                 downloadButton("save_json", "Save JSON File"))
        ) #close fluid row
      ) #close well panel
    ) #close fluid page
) #close attributes tab
