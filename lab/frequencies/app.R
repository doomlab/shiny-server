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
longtype = subset(longtype, value != "")
longtype$value = droplevels(longtype$value)

##use the variable column for the table below because it has all the tag names

stimuli = subset(tablemain, select = c(1, 21:66))
longstimuli = melt(stimuli,
                id = c("ID"),
                measured = c("aoa","ambiguity","arousal","assoc","category",
                             "cloze","complex","concrete","confusion","dist",
                             "dominate","easelearn","familiar","freq","gpc",
                             "identify","identifyld","identifyn","imagevar",
                             "imagine","intense","meaning","modality","morph",
                             "nameagree","orthon","pos","phonon","prime","pronounce",
                             "rt","recall","recognition","rime","semantic",
                             "sensory","sentcomp","typical","valence","visualcomp",
                             "wordcomp","syllables","letters","phonemes","imageagree",
                             "similar"))

longstimuli = subset(longstimuli, value > 0) 

longstimuli$variable = factor(longstimuli$variable,
                              levels = levels(longstimuli$variable), 
                              labels = c("Age of Acquisition", "Ambiguity", "Arousal",
                                         "Association", "Category", "Cloze", "Complexity",
                                         "Concreteness", "Confusion Matrices", "Distinctness",
                                         "Dominance", "Ease of Learning", "Familiarity", 
                                         "Frequency", "Grapheme-Phoneme Correspondence", 
                                         "Indentification", "Lexical Desicion", "Naming", 
                                         "Image Variability", "Imagineability", "Intensity",
                                         "Meaning", "Modality", "Morphemes", "Name Agreement", 
                                         "Orthographic Neighborhood", "Part of Speech", 
                                         "Phonographic Neighborhood", "Priming", "Pronunciation", 
                                         "Response Latency", "Recall", "Recognition", "Rime", 
                                         "Semantic", "Sensory", "Sentence Completion", 
                                         "Typicality", "Valence", "Visual Complexity", "Word Completion",
                                         "Syllables", "Letters", "Phonemes", "Image Agreement", "Similarity"))


ui <- fluidPage( #open ui
  sidebarLayout( #open fluid page and sidebar layout
  sidebarPanel( #open sidebarPanel
    
    selectInput("choice", "Choose a variable:", 
                choices = c("Stimuli", "Tags", "Journal", "Language"),
                selected = "Stimuli")
  ), #close sidebar Panel
  mainPanel( #open mainPanel
    dataTableOutput('freqtable')
  ) #close mainPanel
) # close sidebar Layout
) #close fluidpage

server <- function(input, output) {
  
  output$freqtable <- renderDataTable({
    
    if (input$choice == "Stimuli") {freqvalues = longstimuli$variable}
    if (input$choice == "Tags") {freqvalues = longtype$value}
    if (input$choice == "Journal") {freqvalues = tablemain$ref_journal}
    if (input$choice == "Language") {freqvalues = tablemain$language}
      
    tablef = count(freqvalues)
    tablef$percent = round(tablef$freq/sum(tablef$freq) * 100, 2)
    colnames(tablef) = c("Variable", "Frequency", "Percent")
    tablef
  })
}

shinyApp(ui, server)
