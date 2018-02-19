library(shiny)
library(reshape)
library(plyr)
options(scipen = 999)

tablemain = read.csv("../lab_table.csv")

##use the value column for the table below because it contains all the stimuli names
type = subset(tablemain, select = c(ID, type1, type2))
longtype = melt(type, 
                 id = c("ID"), 
                 measured = c("type1", "type2"))

##use the variable column for the table below because it has all the tag names
stimuli = subset(tablemain, select = c(1, 21:66))
longstimuli = melt(stimuli,
                id = c("ID"),
                measured = c("aoa",
                             "ambiguity",
                             "arousal",
                             "assoc",
                             "category",
                             "cloze",
                             "complex",
                             "concrete",
                             "confusion",
                             "dist",
                             "dominate",
                             "easelearn",
                             "familiar",
                             "freq",
                             "gpc",
                             "identify",
                             "identifyld",
                             "identifyn",
                             "imagevar",
                             "imagine",
                             "intense",
                             "meaning",
                             "modality",
                             "morph",
                             "nameagree",
                             "orthon",
                             "pos",
                             "phonon", 
                             "prime",
                             "pronounce",
                             "rt",
                             "recall",
                             "recognition",
                             "rime",
                             "semantic",
                             "sensory",
                             "sentcomp",
                             "typical",
                             "valence",
                             "visualcomp",
                             "wordcomp",
                             "syllables",
                             "letters",
                             "phonemes",
                             "imageagree",
                             "similar"))
longstimuli = subset(longstimuli, value > 0) 

ui <- fluidPage(
  
fluidPage(sidebarLayout(
  sidebarPanel(
    # use regions as option groups
    selectizeInput('x1', 'X1', choices = list(
      Eastern = c(`New York` = 'NY', `New Jersey` = 'NJ'),
      Western = c(`California` = 'CA', `Washington` = 'WA')
    ), multiple = TRUE),
    
    # use updateSelectizeInput() to generate options later
    selectizeInput('x2', 'X2', choices = NULL),
    
    # an ordinary selectize input without option groups
    selectizeInput('x3', 'X3', choices = setNames(state.abb, state.name)),
    
    # a select input
    selectInput('x4', 'X4', choices = list(
      Eastern = c(`New York` = 'NY', `New Jersey` = 'NJ'),
      Western = c(`California` = 'CA', `Washington` = 'WA')
    ), selectize = FALSE)
  ),
  mainPanel(
    verbatimTextOutput('values')
  )
), title = 'Options groups for select(ize) input')) 


server <- function(input, output, session) {
  
  updateSelectizeInput(session, 'x2', choices = list(
    Eastern = c(`Rhode Island` = 'RI', `New Jersey` = 'NJ'),
    Western = c(`Oregon` = 'OR', `Washington` = 'WA'),
    Middle = list(Iowa = 'IA')
  ), selected = 'IA')
  
  output$values <- renderPrint({
    list(x1 = input$x1, x2 = input$x2, x3 = input$x3, x4 = input$x4)
  })
}
