library(shiny)
library(ggplot2)

labtable = read.csv("../lab_table.csv")

cleanup = theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                panel.background = element_blank(), 
                axis.line.x = element_line(color = "black"),
                axis.line.y = element_line(color = "black"),
                legend.key = element_rect(fill = "white"),
                text = element_text(size = 15))

labtable$year = as.numeric(as.character(labtable$year))

# Define UI for application that draws a histogram
ui <- fluidPage(#open
  
  # Application title
  titlePanel("Papers Per Year"),
   
  #Select Box
  sidebarPanel(
     
     sliderInput("year", 
                 label = "Year:",
                 min = 1910, max = 2014, value = c(1910, 2014),
                 sep = ""),
     helpText("This graphic indicates the publication frequency of 
              normed information across years. Please use the slider 
              bar to zoom into a specified year range.",
              p(), "You can right click on the graphic to save it.") #close help 
  ), #close sidebar panel
  
   # Show a plot of the generated distribution
   mainPanel(#open
     plotOutput("distPlot")
     )#close main Panel
  )#close fluid page
   


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    
    graphdata = subset(labtable, year >= input$year[1] & year <= input$year[2])
    
    # draw the histogram with the specified number of bins
    yearhist = ggplot(graphdata, aes(year))
    yearhist +
    geom_histogram(binwidth = 2, 
                   color = "black", 
                   fill = "grey") +
    xlab("Year") + 
    ylab("Frequency") +
    cleanup
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

