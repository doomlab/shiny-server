library(shiny)
library(DT)
library(MOTE)
library(plyr)
options(scipen = 999)


tablemain = read.csv("lab_table.csv")
library(reshape)
table = subset(tablemain, select = c(ID, type1, type2, year))
longtable = melt(table, 
                 id = c("ID", "year"), 
                 measured = c("type1", "type2"))

colnames(longtable)[3]="Type"

# Define UI for dataset viewer app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Tags Per Year"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Text for providing a caption ----
      # Note: Changes made to the caption in the textInput control
      # are updated in the output area immediately as you type
      textInput(inputId = "caption",
                label = "Tag:",
                value = "Data Summary"),
      
      selectInput(inputId = "select", 
                  label ="Stimuli:", 
                  choices = c("Anagrams" , "Categories" ,
                              "Cloze/Sentences" , "Color Drawings", 
                              "Homo/Heterograps", "Letters" ,
                              "Line Drawings", "Names", 
                              "Other", "Phonemes", 
                              "Pictures", "Proverbs",
                              "Sounds", "Syllables",
                              "Symbols/Icons", "Word Pairs", 
                              "Words")),
      
      textInput(inputId = "caption",
                label = "Journal:",
                value = "Data Summary")
    ) #close sidebarLayout
  ) #close sidebarPanle
) #close fluid page
    

# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
  output$tbl = renderDT(
    longtable, 
    extensions = 'Responsive',
    options = list(
      dom = 'tp'
    ),
    rownames = FALSE
    
  )
}

# Create Shiny app ----
shinyApp(ui, server)

