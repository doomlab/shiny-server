library(shiny)
library(ggplot2)
doom = read.csv("../lab_table.csv")
doom$year2 = as.numeric(doom$year)

cleanup = theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                panel.background = element_blank(), 
                axis.line.x = element_line(color = "black"),
                axis.line.y = element_line(color = "black"),
                legend.key = element_rect(fill = "white"),
                text = element_text(size = 15))

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Tag Frequency"),
   
   # Sidebar with a slider input for number of bins 

      sidebarPanel(
         selectInput("choose",
                     "Select a Stimulus",
                     choices = list("Age of Acquisition" = "aoa",
                                    "Ambiguity/Word Meaning" = "ambiguity",
                                    "Arousal" = "arousal",
                                    "Association" = "assoc",
                                    "Category" = "category",
                                    "Cloze Probabilities" = "cloze",
                                    "Complexity" = "complex",
                                    "Concreteness" = "concrete",
                                    "Confusion Matrices" = "confusion",
                                    "Distinctiveness" = "dist",
                                    "Dominance" = "dominate",
                                    "Ease of Learning" = "easelearn",
                                    "Familiarity" = "familiar",
                                    "Frequency" = "freq",
                                    "Grapheme-Phoneme Correspondence" = "gpc",
                                    "Identification" = "identify",
                                    "Identification - Lexical" = "identifyld",
                                    "Identification - Naming" = "identifyn",
                                    "Image Variability" = "imagevar",
                                    "Imageability" = "imagine",
                                    "Intensity" = "intense",
                                    "Meaningfulness" = "meaning",
                                    "Modality" = "modality",
                                    "Morphology" = "morph",
                                    "Name Agreement" = "nameagree",
                                    "Orthographic Neighborhood" = "orthon",
                                    "Part of Speech" = "pos",
                                    "Phonological Neighborhood" = "phonon", 
                                    "Priming" = "prime",
                                    "Pronunciation" = "pronounce",
                                    "Response Times" = "rt",
                                    "Recall" = "recall",
                                    "Recognition" = "recognition",
                                    "Rime" = "rime",
                                    "Semantics" = "semantic",
                                    "Sensory/Motor" = "sensory",
                                    "Sentence Completion" = "sentcomp",
                                    "Typicality" = "typical",
                                    "Valence/Emotion" = "valence",
                                    "Visual Complexity" = "visualcomp",
                                    "Word Completion" = "wordcomp",
                                    "Syllables" = "syllables",
                                    "Letters" = "letters",
                                    "Phonemes" = "phonemes",
                                    "Image Agreement" = "imageagree",
                                    "Similar" = "similar")),
         sliderInput("binsno",
                     "Number of bins",
                     min = 1,
                     max = 30,
                     value = 15)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("yearhist")
      )
   )


# Define server logic required to draw a histogram
server <- function(input, output) {
  
   output$yearhist <- renderPlot({
     binsno <- (length.out = input$binsno + 1)
     
     graphdata = doom[ , c(input$choose, "year2")]
     colnames(graphdata) = c("picked", "year")
     graphdata = subset(graphdata, picked > 0)
     masterhist1 = ggplot(graphdata, aes(year))
     masterhist1 +
       geom_histogram(binwidth = binsno, 
                      color = "black", 
                      fill = "white") +
       xlab("Year") + 
       ylab("Frequency") +
       cleanup
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

