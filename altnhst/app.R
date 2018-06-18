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
library(plotly)
cleanup = theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                panel.background = element_blank(), 
                axis.line.x = element_line(color = "black"),
                axis.line.y = element_line(color = "black"),
                legend.key = element_rect(fill = "white"),
                text = element_text(size = 13))

####load the data for significant and non sig effects####
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

####load the data for the agreement graphs####
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

####load the data for comparison graphs####
overalleffects = read.csv("overall_sims_shiny.csv")
##agreement charts
overalleffects$decBF = overalleffects$overallBF >= 20
overalleffects$decp.05 = overalleffects$omniP <= .05
overalleffects$decp.005 = overalleffects$omniP <= .005
overalleffects$decoom = overalleffects$oompcc >=.50 & overalleffects$oomchance <=.05

overalleffects$stdev = factor(overalleffects$stdev,
                              labels = c("Large", "Medium", "Small", "None"))
#make all infinite values the next largest
large = length(unique(overalleffects$overallBF))
overalleffects$overallBF[is.infinite(overalleffects$overallBF)] = sort(unique(overalleffects$overallBF))[large-1]
overalleffects$overallBF = log(overalleffects$overallBF)
overalleffects$star = as.factor(as.numeric(overalleffects$oomchance <=.05))

####user interface####
ui <- fluidPage (
  
  titlePanel("Valentine et al. Interactive Graphics"),
  
  sidebarLayout(
    
    ##sidebarpanel
    sidebarPanel(
      
      br(),
      
      ##put input boxes here
      tags$em("All Graphs:"),
      selectInput("sizeselect", "Select Effect Size:",
                  c("Negligible" = "None",
                    "Small" = "Small",
                    "Medium" = "Medium",
                    "Large" = "Large")),
      
      tags$em("Percent Graphs:"),
      selectInput("Nselect", "Select N Scaling:",
                  c("N" = "N",
                    "Log N" = "log")),
      
      htmlOutput("slider_selector"),
      
      tags$em("Comparison Graphs:"),
      
      selectInput("graphselect", "Select Graph:",
                  c("PCC - p" = "pccp",
                    "PCC - BF" = "pccbf",
                    "BF - p" = "bfp")),
      
      sliderInput("bfrange", "Log BF Range:",
                  min = -5, max = 600,
                  value = c(-5,600),
                  sep = "",
                  step = 10),
      
      sliderInput("prange", "p Range:",
                  min = 0, max = 1,
                  value = c(0,1),
                  step = .01),
      
      sliderInput("pccrange", "PCC Range:",
                  min = 0, max = 1,
                  value = c(0,1),
                  step = .01)
      
      
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
        tabPanel("NHST-BF Agreement", plotOutput("nhstbfagree"),
                 br(),
                 helpText("Complete dataset avaliable at: https://osf.io/u9hf4/")),
        tabPanel("NHST-OOM Agreement", plotOutput("nhstoomagree"),
                 br(),
                 helpText("Complete dataset avaliable at: https://osf.io/u9hf4/")),
        tabPanel("OOM-BF Agreement", plotOutput("oombfagree"),
                 br(),
                 helpText("Complete dataset avaliable at: https://osf.io/u9hf4/")),
         tabPanel("Posthoc Agreement", plotOutput("postagree"),
                 br(),
                 helpText("Complete dataset avaliable at: https://osf.io/u9hf4/")),
        tabPanel("Criterion Comparison", plotOutput("compare"), 
                 br(),
                 helpText("Complete dataset avaliable at: https://osf.io/u9hf4/",br(), 
                          "BF values have been log transformed to show the entire range of the data.")),
        tabPanel("3D Comparison", plotlyOutput("compare3d"), 
                 br(),
                 helpText("Complete dataset avaliable at: https://osf.io/u9hf4/",br(), 
                          "BF values have been log transformed to show the entire range of the data."))
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
     
     nsgraphdata = subset(long_graph, Significance=="Non" & Effect == input$sizeselect)
     
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
   
   ####NHST BF AGREEMENT####
   output$nhstbfagree <- renderPlot({
     
     graph_data = overalleffects[ , c("N", "stdev", "decBF", "decp.05", "decp.005")]
     graph_data$agree.05 = graph_data$decBF == graph_data$decp.05
     graph_data$agree.005 = graph_data$decBF == graph_data$decp.005
     long_data = melt(graph_data[ , -c(3:5)],
                      id = c("N", "stdev"),
                      measured = c("agree.05", "agree.005"))
     
     long_data = subset(long_data, value == TRUE)
     
     graph_percent = as.data.frame(table(long_data$N, long_data$stdev, long_data$variable)/1000*100)
     colnames(graph_percent) = c("N", "stdev", "comparison", "Percent")
     graph_percent$N = as.numeric(as.character(graph_percent$N))
     
     ##log n to get a better graph
     if (input$Nselect == "log") { graph_percent$N = log(graph_percent$N)
     xlabel = "Log N" } else { xlabel = "N"}
     
     agree_graph = subset(graph_percent, stdev == input$sizeselect)
     
     ggplot(agree_graph) + 
       geom_line(aes(x=N, 
                     y=Percent, 
                     group = comparison,
                     linetype = comparison, 
                     colour = comparison),
                 size=0.75) + 
       labs(title= paste(input$sizeselect, "Effects")) +
       coord_cartesian(ylim = c(0,101), xlim = c(input$xaxisrange[1], input$xaxisrange[2])) + 
       ylab("Percent NHST - BF Agreement") + 
       xlab(xlabel) + 
       cleanup +
       geom_point(data=agree_graph,
                  aes(x = N,
                      y = Percent,
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
   
   ####NHST OOM AGREEMENT####
   output$nhstoomagree <- renderPlot({
     
     graph_data2 = overalleffects[ , c("N", "stdev", "decoom", "decp.05", "decp.005")]
     graph_data2$agree.05 = graph_data2$decoom == graph_data2$decp.05
     graph_data2$agree.005 = graph_data2$decoom == graph_data2$decp.005
     long_data2 = melt(graph_data2[ , -c(3:5)],
                      id = c("N", "stdev"),
                      measured = c("agree.05", "agree.005"))
     
     long_data2 = subset(long_data2, value == TRUE)
     
     graph_percent2 = as.data.frame(table(long_data2$N, long_data2$stdev, long_data2$variable)/1000*100)
     colnames(graph_percent2) = c("N", "stdev", "comparison", "Percent")
     graph_percent2$N = as.numeric(as.character(graph_percent2$N))
     
     ##log n to get a better graph
     if (input$Nselect == "log") { graph_percent2$N = log(graph_percent2$N)
     xlabel = "Log N" } else { xlabel = "N"}
     
     agree_graph2 = subset(graph_percent2, stdev == input$sizeselect)
     
     ggplot(agree_graph2) + 
       geom_line(aes(x=N, 
                     y=Percent, 
                     group = comparison,
                     linetype = comparison, 
                     colour = comparison),
                 size=0.75) + 
       labs(title= paste(input$sizeselect, "Effects")) +
       coord_cartesian(ylim = c(0,101), xlim = c(input$xaxisrange[1], input$xaxisrange[2])) + 
       ylab("Percent NHST - OOM Agreement") + 
       xlab(xlabel) + 
       cleanup +
       geom_point(data=agree_graph2,
                  aes(x = N,
                      y = Percent,
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
  
   ####BF OOM AGREEMENT####
   output$oombfagree <- renderPlot({
     
     graph_data3 = overalleffects[ , c("N", "stdev", "decoom", "decBF")]
     graph_data3$agree = graph_data3$decoom == graph_data3$decBF
     
     long_data3 = subset(graph_data3, agree == TRUE)
     
     graph_percent3 = as.data.frame(table(long_data3$N, long_data3$stdev)/1000*100)
     colnames(graph_percent3) = c("N", "stdev", "Percent")
     graph_percent3$N = as.numeric(as.character(graph_percent3$N))
     
     ##log n to get a better graph
     if (input$Nselect == "log") { graph_percent3$N = log(graph_percent3$N)
     xlabel = "Log N" } else { xlabel = "N"}
     
     agree_graph3 = subset(graph_percent3, stdev == input$sizeselect)
     
     ggplot(agree_graph3) + 
       geom_line(aes(x=N, 
                     y=Percent),
                 size=0.75) + 
       labs(title= paste(input$sizeselect, "Effects")) +
       coord_cartesian(ylim = c(0,101), xlim = c(input$xaxisrange[1], input$xaxisrange[2])) + 
       ylab("Percent BF - OOM Agreement") + 
       xlab(xlabel) + 
       cleanup +
       geom_point(data=agree_graph3,
                  aes(x = N,
                      y = Percent), 
                  size = 4) 
   })
   
   ####POST HOC AGREEMENT####
   output$postagree <- renderPlot({
     
     ##log n to get a better graph
     if (input$Nselect == "log") { agreelong$N = log(agreelong$N)
     xlabel = "Log N" } else { xlabel = "N"}
     
     pagreelong = subset(agreelong, comparison != "omnibus.05" & 
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
   
   ####COMPARISON GRAPHS####
   output$compare <- renderPlot({
     
     if (input$graphselect == "pccp"){
       
       overallgraph = subset(overalleffects, 
                             #overallBF >= input$bfrange[1] & overallBF <= input$bfrange[2] &
                               omniP >= input$prange[1] & omniP <= input$prange[2] &
                               oompcc >= input$pccrange[1] & oompcc <= input$pccrange[2] &
                               stdev == input$sizeselect)
       
       if (input$Nselect == "log") { overallgraph$N = round(log(overallgraph$N),2)
       colorlabel1 = "Log N" } else { colorlabel1 = "N"}
       
       overallgraph$N = as.factor(overallgraph$N)
       
       ggplot(overallgraph, aes(oompcc, omniP, color = N)) + 
         cleanup +
         geom_point(data = overallgraph, aes(shape = star)) +
         xlab("OOM PCC Value") + 
         ylab("Omnibus ANOVA p-Value") +
         scale_color_discrete(name = colorlabel1) + 
         scale_shape_manual(name = "c-Value",
                              labels = c(">.05", "<=.05"),
                              values = c(16,4))
       
     } else if (input$graphselect == "pccbf"){
       
       overallgraph2 = subset(overalleffects, 
                             overallBF >= input$bfrange[1] & overallBF <= input$bfrange[2] &
                             #omniP >= input$prange[1] & omniP <= input$prange[2] &
                               oompcc >= input$pccrange[1] & oompcc <= input$pccrange[2] &
                               stdev == input$sizeselect)
       
       if (input$Nselect == "log") { overallgraph2$N = round(log(overallgraph2$N),2)
       colorlabel2 = "Log N" } else { colorlabel2 = "N"}
       
       overallgraph2$N = as.factor(overallgraph2$N)
       
       ggplot(overallgraph2, aes(oompcc, overallBF, color = N)) + 
         cleanup +
         geom_point(data = overallgraph2, aes(shape = star)) +
         xlab("OOM PCC Value") + 
         ylab("Bayes Factor") +
         scale_color_discrete(name = colorlabel2) + 
         scale_shape_manual(name = "c-Value",
                            labels = c(">.05", "<=.05"),
                            values = c(16,4))
       
     } else if (input$graphselect == "bfp"){
       overallgraph3 = subset(overalleffects, 
                              overallBF >= input$bfrange[1] & overallBF <= input$bfrange[2] &
                                omniP >= input$prange[1] & omniP <= input$prange[2] &
                                #oompcc >= input$pccrange[1] & oompcc <= input$pccrange[2] &
                                stdev == input$sizeselect)
       
       if (input$Nselect == "log") { overallgraph3$N = round(log(overallgraph3$N),2)
       colorlabel3 = "Log N" } else { colorlabel3 = "N"}
       
       overallgraph3$N = as.factor(overallgraph3$N)
       
       ggplot(overallgraph3, aes(omniP, overallBF, color = N)) + 
         cleanup +
         geom_point(data = overallgraph2, aes(shape = star)) +
         xlab("Omnibus ANOVA p-Value") + 
         ylab("Bayes Factor") +
         scale_color_discrete(name = colorlabel3) + 
         scale_shape_manual(name = "c-Value",
                            labels = c(">.05", "<=.05"),
                            values = c(16,4))
     }
     
   })
   
   ####3D COMPARISON GRAPHS####
   output$compare3d <- renderPlotly({
     
     overallgraph3d = subset(overalleffects, 
                             overallBF >= input$bfrange[1] & overallBF <= input$bfrange[2] &
                               omniP >= input$prange[1] & omniP <= input$prange[2] &
                               oompcc >= input$pccrange[1] & oompcc <= input$pccrange[2] &
                               stdev == input$sizeselect)
     
     if (input$Nselect == "log") { overallgraph3d$N = round(log(overallgraph3d$N),2)
     colorlabel = "Log N" } else { colorlabel = "N"}
     
     #overallgraph3d$N = as.factor(overallgraph3d$N)
     overallgraph3d$star = factor(overallgraph3d$star,
                                     levels = c(0,1),
                                     labels = c("c > .05", "c <= .05"))
     
     overall = plot_ly(overallgraph3d, 
                       x = ~overallBF,
                       y = ~oompcc,
                       z = ~omniP,
                       color = ~N,
                       symbol = ~star,
                       symbols=c("circle","cross"),
                       mode="markers") %>%
       add_markers() %>%
       layout(scene = list(xaxis = list(title = 'Bayes Factors'),
                           yaxis = list(title = 'OOM PCC'),
                           zaxis = list(title = 'p-Value')),
              annotations = list(
                x = 1.13,
                y = 1.05,
                text = colorlabel,
                xref = 'paper',
                yref = 'paper',
                showarrow = FALSE
              ))
     
     overall
     
   })
   
   
} #close server functions

# Run the application 
shinyApp(ui = ui, server = server)

