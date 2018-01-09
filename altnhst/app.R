#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape)
cleanup = theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                panel.background = element_blank(), 
                axis.line.x = element_line(color = "black"),
                axis.line.y = element_line(color = "black"),
                legend.key = element_rect(fill = "white"),
                text = element_text(size = 13))

####user interface####
ui <- fluidPage (
  
  titlePanel("Valentine et al. Interactive Graphics"),
  
  sidebarLayout(
    
    ##sidebarpanel
    sidebarPanel(
      
      br(),
      
      ##put input boxes here
      selectInput("sizeselect", "Select Effect Size:",
                  c("Negligible" = "None",
                    "Small" = "Small",
                    "Medium" = "Medium",
                    "Large" = "Large")),
      
      selectInput("Nselect", "Select N Scaling:",
                  c("N" = "N",
                    "Log N" = "log")),
      
      htmlOutput("slider_selector")
      
    ), #close sidebar panel
    
    mainPanel(
      
      tabsetPanel(
        tabPanel("Significant", plotOutput("sigpic"),
                 br(),
                 helpText("Complete dataset avaliable at: https://osf.io/u9hf4/")),
        tabPanel("Non-Significant", plotOutput("nonpic"),
                 br(),
                 helpText("Complete dataset avaliable at: https://osf.io/u9hf4/")),
        tabPanel("Omnibus Agreement", plotOutput("omniagree"),
                 br(),
                 helpText("Complete dataset avaliable at: https://osf.io/u9hf4/")),
        tabPanel("Posthoc Agreement", plotOutput("postagree"),
                 br(),
                 helpText("Complete dataset avaliable at: https://osf.io/u9hf4/"))
      )
      
    ) #close main panel 
    
  ) #close sidebar layout

) #close fluid page

####server functions####
server <- function(input, output) {
   
  ####change the slider####
  output$slider_selector = renderUI({ 
    
    if (input$Nselect == "N") { minN = 10; maxN = 1000; stepN = 10}
    if (input$Nselect == "log") { minN = round(log(10),1) 
                                  maxN = round(log(1000),1)
                                  stepN = .1}
    
    sliderInput("xaxisrange", "X-Axis Range:",
                min = minN, max = maxN,
                value = c(minN,maxN),
                sep = "",
                round = -1,
                step = stepN)
  })
  
   ####SIGNIFICANT EFFECTS####
   output$sigpic <- renderPlot({

     #load graph data
     Graph_05 = read.csv("Graph_data.05.csv")
     Graph_005 = read.csv("Graph_data.005.csv")
     
     Graph_data = cbind(Graph_05, Graph_005[ , 4:5])
     colnames(Graph_data) = c("Effect","Significance", "N", "Parametric.05", "Non.Parametric.05", "Bayes", "OOM", "Parametric.005", "Non.Parametric.005")
     
     ##delete duplicate NS values, they don't change
     Graph_data[ Graph_data$Significance == "Non", "Parametric.005" ] = NA
     Graph_data[ Graph_data$Significance == "Non", "Non.Parametric.005" ] = NA
     
     ##drop NP because results are same as P, all results can been found online if you are interested
     Graph_data = Graph_data[ , -c(5,9)]
     
     ##melt the data
     long_graph = melt(Graph_data,
                       id = c("Effect","Significance","N"))
     colnames(long_graph) = c("Effect","Significance", "N","Analysis","value")
     
     long_graph = na.omit(long_graph)
     long_graph$Analysis = factor(long_graph$Analysis,
                                  levels = c("Parametric.05", 
                                             "Parametric.005",
                                             "Bayes","OOM"),
                                  labels = c("NHST .05",
                                             "NHST .005",
                                             "Bayes Factors","OOM"))
     
     graphdata = subset(long_graph, Significance=="Sig" & Effect == input$sizeselect)
     
     ##log N
     if (input$Nselect == "log") { graphdata$N = log(graphdata$N) 
                                    xlabel = "Log N" } else { xlabel = "N"}
     
     ##make the graph based on the selections
     ggplot(graphdata) + 
       geom_line(aes(x=N, 
                     y=value, 
                     group = Analysis,
                     linetype = Analysis, 
                     colour = Analysis),
                 size=0.75) + 
       labs(title= paste(input$sizeselect, "Effects")) +
       coord_cartesian(ylim = c(0,101), xlim = c(input$xaxisrange[1], input$xaxisrange[2])) + 
       ylab("Percent Significant") +
       xlab(xlabel) + 
       cleanup +
       geom_point(data=graphdata,
                  aes(x = N,
                      y = value,
                      shape = Analysis,
                      color = Analysis), 
                  size = 4) +
       scale_linetype_manual(values=c("solid", "dashed", "solid", "solid")) +
       scale_color_manual(values = c("green","red", "blue","purple")) + 
       scale_shape_manual(values = c(3, 4, 5, 6))
   })
   
   ####NONSIGNIFICANT EFFECTS####
   output$nonpic <- renderPlot({
     
     nsGraph_05 = read.csv("Graph_data.05.csv")
     nsGraph_005 = read.csv("Graph_data.005.csv")
     
     nsGraph_data = cbind(nsGraph_05, nsGraph_005[ , 4:5])
     colnames(nsGraph_data) = c("Effect","Significance", "N", "Parametric.05", "Non.Parametric.05", "Bayes", "OOM", "Parametric.005", "Non.Parametric.005")
     
     ##delete duplicate NS values, they don't change
     nsGraph_data[ nsGraph_data$Significance == "Non", "Parametric.005" ] = NA
     nsGraph_data[ nsGraph_data$Significance == "Non", "Non.Parametric.005" ] = NA
     
     ##drop NP because results are same as P, all results can been found online if you are interested
     nsGraph_data = nsGraph_data[ , -c(5,9)]
     
     ##melt the data
     nslong_graph = melt(nsGraph_data,
                       id = c("Effect","Significance","N"))
     colnames(nslong_graph) = c("Effect","Significance", "N","Analysis","value")
     
     nslong_graph = na.omit(nslong_graph)
     nslong_graph$Analysis = factor(nslong_graph$Analysis,
                                  levels = c("Parametric.05", 
                                             "Parametric.005",
                                             "Bayes","OOM"),
                                  labels = c("NHST .05",
                                             "NHST .005",
                                             "Bayes Factors","OOM"))
     
     nsgraphdata = subset(nslong_graph, Significance=="Non" & Effect == input$sizeselect)
     
     ##log N
     if (input$Nselect == "log") { nsgraphdata$N = log(nsgraphdata$N)  
                                   xlabel = "Log N" } else { xlabel = "N"}
     
     ##make the graph based on the selections
     ggplot(nsgraphdata) + 
       geom_line(aes(x=N, 
                     y=value, 
                     group = Analysis,
                     linetype = Analysis, 
                     colour = Analysis),
                 size=0.75) + 
       labs(title= paste(input$sizeselect, "Effects")) +
       coord_cartesian(ylim = c(0,101), xlim = c(input$xaxisrange[1], input$xaxisrange[2])) + 
       ylab("Percent Non-Significant") +
       xlab(xlabel) + 
       cleanup +
       geom_point(data=nsgraphdata,
                  aes(x = N,
                      y = value,
                      shape = Analysis,
                      color = Analysis), 
                  size = 4) +
       scale_linetype_manual(values=c("solid", "dashed", "solid", "solid")) +
       scale_color_manual(values = c("green","red", "blue","purple")) + 
       scale_shape_manual(values = c(3, 4, 5, 6))
   })
   
   ####OMNIBUS AGREEMENT####
   output$omniagree <- renderPlot({
     
     agree = read.csv("Graph_data_agree.05.csv")
     agree2 = read.csv("Graph_data_agree.005.csv")
     agree_together = cbind(agree, agree2[ , -c(1:2)])
     colnames(agree_together) = c("effect", "N", "omnibus.05",
                                  "onetotwo.05", "twotothree.05",
                                  "omnibus.005", "onetotwo.005", 
                                  "twotothree.005")
     
     agreelong = melt(agree_together,
                      id = c("effect", "N"))
     colnames(agreelong)[3:4] = c("comparison", "percent")
     
     ##log n to get a better graph
     if (input$Nselect == "log") { agreelong$N = log(agreelong$N)
                                   xlabel = "Log N" } else { xlabel = "N"}
     
     ##omnibus only
     agreelong = subset(agreelong, comparison == "omnibus.05" | 
                          comparison == "omnibus.005")
     
     agree_graph = subset(agreelong, effect == input$sizeselect)
     
     ggplot(agree_graph) + 
       geom_line(aes(x=N, 
                     y=percent, 
                     group = comparison,
                     linetype = comparison, 
                     colour = comparison),
                 size=0.75) + 
       labs(title= paste(input$sizeselect, "Effects")) +
       coord_cartesian(ylim = c(0,101), xlim = c(input$xaxisrange[1], input$xaxisrange[2])) + 
       ylab("Percent Agreement") + 
       xlab(xlabel) + 
       cleanup +
       geom_point(data=agree_graph,
                  aes(x = N,
                      y = percent,
                      shape = comparison, 
                      color = comparison), 
                  size = 4) +
       scale_linetype_manual(name = "Comparison", 
                             labels = c(".05", ".005"),
                             values=c("solid","solid")) +
       scale_color_manual(name = "Comparison", 
                          labels = c(".05", ".005"),
                          values = c("red","blue")) + 
       scale_shape_manual(name = "Comparison", 
                          labels = c(".05", ".005"),
                          values = c(3, 4))
     
     
   })
   
   ####POST HOC AGREEMENT####
   output$postagree <- renderPlot({
     
     pagree = read.csv("Graph_data_agree.05.csv")
     pagree2 = read.csv("Graph_data_agree.005.csv")
     pagree_together = cbind(pagree, pagree2[ , -c(1:2)])
     colnames(pagree_together) = c("effect", "N", "omnibus.05",
                                  "onetotwo.05", "twotothree.05",
                                  "omnibus.005", "onetotwo.005", 
                                  "twotothree.005")
     
     pagreelong = melt(pagree_together,
                      id = c("effect", "N"))
     colnames(pagreelong)[3:4] = c("comparison", "percent")
     
     ##log n to get a better graph
     if (input$Nselect == "log") { pagreelong$N = log(pagreelong$N)
     xlabel = "Log N" } else { xlabel = "N"}
     
     pagreelong = subset(pagreelong, comparison != "omnibus.05" & 
                          comparison != "omnibus.005")
     
     pagreelong$comparison = factor(pagreelong$comparison,
                                   levels = c("onetotwo.05", "twotothree.05",
                                              "onetotwo.005", "twotothree.005"),
                                   labels = c("1-2 .05", "2-3 .05",
                                              "1-2 .005", "2-3 .005"))
     
     pagree_graph = subset(pagreelong, effect == input$sizeselect)
     
     ggplot(pagree_graph) + 
       geom_line(aes(x=N, 
                     y=percent, 
                     group = comparison,
                     linetype = comparison, 
                     colour = comparison),
                 size=0.75) + 
       labs(title= paste(input$sizeselect, "Effects")) +
       coord_cartesian(ylim = c(0,101), xlim = c(input$xaxisrange[1], input$xaxisrange[2])) + 
       ylab("Percent Agreement") + 
       xlab(xlabel) +
       cleanup +
       geom_point(data=pagree_graph,
                  aes(x = N,
                      y = percent,
                      shape = comparison, 
                      color = comparison), 
                  size = 4) +
       scale_linetype_manual(name = "Comparison", 
                             values=c("solid", "solid","dashed", "dashed")) +
       scale_color_manual(name = "Comparison",
                          values = c("green","red","blue", "purple")) + 
       scale_shape_manual(name = "Comparison",
                          values = c(3, 4, 3, 4))
   })
   
   
} #close server functions

# Run the application 
shinyApp(ui = ui, server = server)

