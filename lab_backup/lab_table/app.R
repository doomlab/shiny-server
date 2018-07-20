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
                     choices = c(
                       "Age of Acquisition" = "aoa",
                       "Ambiguity" = "ambiguity",
                       "Arousal" = "arousal",
                       "Association" = "assoc",
                       "Categories" = "category",
                       "Cloze Probabilities" = "cloze",
                       "Complexity" = "complex",
                       "Concreteness" = "concrete",
                       "Confusion Matrices" = "confusion",
                       "Distinctivenes" = "sdist",
                       "Dominance" = "dominate",
                       "Ease of Learning" = "easelearn",
                       "Familiarity" = "familiar",
                       "Frequency" = "freq",
                       "Grapheme-Phoneme Correspondence" = "gpc",
                       "Indentification" = "identify",
                       "Image Agreement" = "imageagree",
                       "Image Variability" = "imagevar",
                       "Imaginability" = "imagine",
                       "Intensity" = "intense",
                       "Letters" = "letters",
                       "Lexical Decision" = "identifyld",
                       "Meaning" = "meaning",
                       "Modality" = "modality",
                       "Morphemes" = "morph",
                       "Name Agreement" = "nameagree",
                       "Naming" = "identifyn",
                       "Orthographic Neighborhood" = "orthon",
                       "Part of Speech" = "pos",
                       "Phonemes" = "phonemes",
                       "Phonographic Neighborhood" = "phonon",
                       "Priming" = "prime",
                       "Pronunciation" = "pronounce",
                       "Response Latency" = "rt",
                       "Recall" = "recall",
                       "Recognition" = "recognition",
                       "Rime" = "rime",
                       "Semantic" = "semantic",
                       "Sensory" = "sensory",
                       "Sentence Completion" = "sentcomp",
                       "Similarity" = "similar",
                       "Syllables" = "syllables",
                       "Typicality" = "typical",
                       "Valence" = "valence",
                       "Visual Complexity" = "visualcomp",
                       "Word Completion" = "wordcomp"), 
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
    
    temptable = labtable[ , (ncol(labtable)-3):(ncol(labtable))]
    
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