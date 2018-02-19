
##Load Libraries
library(shiny)
library(reshape)
library(ggplot2)

cleanup = theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                panel.background = element_blank(), 
                axis.line.x = element_line(color = "black"),
                axis.line.y = element_line(color = "black"),
                legend.key = element_rect(fill = "white"),
                text = element_text(size = 15))

tablemain = read.csv("../lab_table.csv")
table = subset(tablemain, select = c(ID, type1, type2, year))
longtable = melt(table, 
                 id = c("ID", "year"), 
                 measured = c("type1", "type2"))

colnames(longtable)[3]="Type"

#To change the years from being factors
longtable$year = as.numeric(as.character(longtable$year))

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Stimuli Frequency"),
  
  #Select Box
  sidebarPanel(
    
    selectInput(inputId = "select", 
                label ="Stimuli:", 
                choices = c("Anagrams" , "Categories" ,
                            "Cloze/Sentences" , "Color drawings", 
                            "Homo/Heterographs", "Letters" ,
                            "Line drawings", "Names", 
                            "Other", "Phonemes", 
                            "Pictures", "Proverbs",
                            "Sounds", "Syllables",
                            "Symbols/Icons", "Word Pairs", 
                            "Words")), #close select
    
    sliderInput("bins",
                "Number of bins:",
                min = 1,
                max = 30,
                value = 15), #close slider
    
    helpText("This graphic indicates the publication frequency of 
              of each type of stimuli across years. Please use the slider 
              bar to control the bin width (bar size).",
             p(), "You can right click on the graphic to save it.") #close help
  ), #close sidebarpanel


  # Show a plot of the generated distribution
  mainPanel(
    plotOutput("distPlot")
  ) #close main
) #close fluid

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    graphdata = subset(longtable, value == input$select)
    
    bins <- (length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    ggplot(graphdata, aes(year)) + 
      geom_histogram(binwidth = bins, 
                     color = "black", 
                     fill = "white") +
      xlab("Year") +
      ylab("Frequency") +
      cleanup 
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
