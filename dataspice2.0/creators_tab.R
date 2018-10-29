creators_tab <- tabItem(tabName = "creators_tab",
 
    fluidPage(
      wellPanel(
        titlePanel(paste0("Create the Creators Table")),
            h5("The creators table includes a list of researchers who participated in data 
                  collection and creation for citation purposes.
                  Click Save Changes when you are done inputting information before you move
                  on to the next tab.")), #close help text and well panel
      
      fluidRow(
        # table editing helptext
        h5("Right-click on the table to delete/insert rows.",
           "Double-click on a cell to edit. Changes are saved while on this page."),
        # table
        rHandsontableOutput("hot_creators"),
        br()
      ), #close fluid row
      
      wellPanel(
        fluidRow(
          column(8, helpText("Hit the Save Changes button to save this file.", inline=TRUE),
                 list(
                   h4("Creators Metadata:"),
                   h5('id = Your ORCID ID, which you can create at https://orcid.org/.'),
                   h5("givenName = The first name of the creator(s)."),
                   h5('familyName = The last name of the creator(s).'),
                   h5("affiliation = The affiliation of the creator, current or at the 
                      time of data collection."),
                   h5("email = The email address of the creator(s).")
                 ) #close list
          ), #close column
          column(4, align="right",
                 downloadButton("save_creators", "Save Changes"))
        ) #close fluid row
      ) #close well panel
    ) #close fluid page
) #close creators tab
      
