report_tab <- tabItem(tabName = "report_tab",
  fluidPage(
    wellPanel(
      titlePanel(paste0("View and Download the Data Report")),
          h5("This page allows you to view and download the HTML report of the metadata that you 
             entered about your data file. This report can be shared for all audiences to view 
             and use to interpret your data.")), #close help text and well panel 
    
    wellPanel(
      fluidRow(
        column(8, uiOutput("message_report", inline=TRUE),
               h4(textOutput("title")),
               htmlOutput("report")
        ), #close column
        column(4, align="right",
               actionButton("save_report", "Save Report HTML"))
      ) #close fluid row
    ) #close well panel
  ) #close fluid page
) #close attributes tab

