## OSF Example

## app.R ##
library(shiny)
library(shinydashboard)
library(osfr)
library(tidyverse)

## interface files
source("project_interface.R")
source("diff_interface.R")

## UI ----
ui <- dashboardPage(skin = 'black',
                    dashboardHeader(title = tags$b("OSF_Example")),
                    dashboardSidebar(
                      sidebarMenu(
                        menuItem(tags$b("1. Project Info"), tabName = "project_tab"),
                        menuItem(tags$b("2. Upload Data"), tabName = "different_tab")
                      )
                    ),
                    dashboardBody(
                      tabItems(
                        project_tab,
                        different_tab) # end tabItems
                    ) # end dashboardBody
) # end dashboardPage

## server ----
server <- function(input, output, session) { 
  ## Load data ----
  project_dat <- reactive({
    project_file <<- input$inFile
    if (is.null(project_file)) return(NULL)
    })
  
  ## Go if they click button ----
  project_upload <- eventReactive(input$project_go, {
    #grab the file
    project_dat()
    
    #run the OSF code here
    osf_auth(input$osf_key)
    
    project <- osf_create_project(title = input$project_title)
    
    project %>% 
      osf_create_component("Replication")
    
    project %>% 
      osf_create_component("Reproduction")
    
    ##rest of code here to actually make the project
    
  })
  
  output$uploaded_project = renderText({
    
    project_upload()
    
    #should print this out if it works
    "Created on OSF"
    })

} # end server()

shinyApp(ui, server)