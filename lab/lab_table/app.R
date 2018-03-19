library(shiny)
library(DT)
options(scipen = 999)

#load data
labtable = read.csv("../lab_table.csv")

#clean up journal information
labtable$Full.Reference = with(labtable, paste(author, year, ref_title,
                                            ref_journal, ref_volume, 
                                            ref_page, ref_doi, sep = ". "))
#clean up the tags
labtable$Tag.List = apply(labtable[ , 21:66] == 1, 1, function(x) { toString(names(which(x))) } )

#clean up the stimuli
labtable$Stimuli.List = paste(labtable$no1, " ", labtable$type1, ", ",
                              labtable$no2, " ", labtable$type2, sep = "")

labtable$Stimuli.List = gsub("NA", "", labtable$Stimuli.List, ignore.case = F)
labtable$Stimuli.List = gsub(",\\s\\s$", "", labtable$Stimuli.List, ignore.case = F)

#language
labtable$Lang.List = paste(labtable$language, " ", labtable$notes_lang, sep = "")

ui = fluidPage(
  titlePanel("LAB Table List"),
  sidebarLayout(
    
    sidebarPanel(
      selectizeInput("stimuli", "Select Stimuli:", 
                     choices = c("Anagrams", "Categories", "Characters", 
                                 "Cloze/Sentences", "Color drawings", "Homo/Heterophones",
                                 "Letters", "Line drawings", "Names", "Other", "Phonemes",
                                 "Pictures", "Proverbs", "Sounds", "Syllables", "Symbols/Icons", 
                                 "Word Pairs", "Words"), 
                     multiple = TRUE),
      
      selectizeInput("tags", "Select Tags:", 
                     choices = c("aoa","ambiguity","arousal","assoc",
                                 "category","cloze","complex","concrete",
                                 "confusion","dist","dominate","easelearn",
                                 "familiar","freq","gpc","identify",
                                 "identifyld","identifyn","imagevar",
                                 "imagine","intense","meaning","modality",
                                 "morph","nameagree","orthon","pos","phonon",
                                 "prime","pronounce","rt","recall",
                                 "recognition","rime","semantic","sensory",
                                 "sentcomp","typical","valence","visualcomp",
                                 "wordcomp","syllables","letters","phonemes",
                                 "imageagree","similar"), 
                     multiple = TRUE),
      
      selectizeInput("language", "Select Language:", 
                     choices = c("British English","Chinese","Dutch",
                                 "English","French","German","Greek",
                                 "Italian","Japanese","Multiple","Other",
                                 "Portuguese","Spanish"), 
                     multiple = TRUE)
      
    ), #sidebar panel
    
    mainPanel(
      DTOutput('tbl')
    ) #close main panel
  
  )##sidebar layout
  
  )##fluidpage

server = function(input, output) {
  output$tbl = renderDT({
    
    temptable = labtable[ , 76:79]
    
    if (!is.null(input$stimuli)) {
    for (i in 1:length(input$stimuli)) {
      temptable = temptable[grep(input$stimuli[i], temptable$Stimuli.List), ]
    }
    }
    
    if (!is.null(input$tags)) {
      for (i in 1:length(input$tags)) {
        temptable = temptable[grep(input$tags[i], temptable$Tag.List), ]
      }
    }
    
    if (!is.null(input$language)) {
      for (i in 1:length(input$language)) {
        temptable = temptable[grep(input$language[i], temptable$Lang.List), ]
      }
    }
    
    
    datatable(temptable, 
    extensions = 'Responsive',
    options = list(dom = 'tp'),
    rownames = FALSE) #close datatable
  
  })
  } #close server




shinyApp(ui, server)