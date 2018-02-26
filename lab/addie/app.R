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

colnames(type)[1]="Type 1"
colnames(type)[2]="Type 2"


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

Journal = tablemain$ref_journal

Language = tablemain$language

ui <- fluidPage( #open ui
  
fluidPage(sidebarLayout( #open fluid page and sidebar layout
  sidebarPanel( #open sidebarPanel
    
    selectInput("Stimuli", choices = longstimuli$variable),
    
    selectInput("Tag", choices = longtype$value),
    
    selectInput("Journal", choices = Journal),
    
    selectInput("Language", choices = Language)
    
  ), #close sidebar Panel
  mainPanel( #open mainPanel
    verbatimTextOutput('values')
  ) #close mainPanel
), # close sidebar Layout

basicPage( #open basicpage
  plotOutput(longstimuli,longtype)
)#close basicpage
) #close fluidpage
) #close ui


server <- function(input, output) {
  
  output$longstimuli <- renderPlot({
    plot(longstimuli$variable, longtype$value)
  })
}

