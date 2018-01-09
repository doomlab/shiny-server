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
library(DT)
cleanup = theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                panel.background = element_blank(), 
                axis.line.x = element_line(color = "black"),
                axis.line.y = element_line(color = "black"),
                legend.key = element_rect(fill = "white"),
                text = element_text(size = 13))

####user interface####
ui <- fluidPage(
  
  ####make the navbar pages####
  shinyUI(
    navbarPage("Effect Size Figures",
               navbarMenu("Individual Simulations",
                          tabPanel("Okada Replication",
                                   source("shiny_okada_rep.R")$value),
                          tabPanel("Precision - Rounded DV",
                                   source("shiny_precision.R")$value),
                          tabPanel("Likert Data - Non-Truncate",
                                   source("shiny_likert_nt.R")$value),
                          tabPanel("Likert Data - Truncate",
                                   source("shiny_likert_t.R")$value)
               ), ##close navbarMenu
               
               navbarMenu("Range of Effects",
                          tabPanel("Regular Data - Not Rounded", 
                                   source("shiny_reg_nr.R")$value),
                          tabPanel("Regular Data - Rounded",
                                   source("shiny_reg_rr.R")$value),
                          tabPanel("Likert Data - Not Rounded",
                                   source("shiny_reg_nl.R")$value),
                          tabPanel("Likert Data - Rounded",
                                   source("shiny_reg_rl.R")$value)
              ), ##close nav bar menu
               
               navbarMenu("Sample Size",
                          tabPanel("Differences",
                                   source("shiny_power.R")$value)
               ) ##close navbarMenu
              
    ) ##close navbarpage
    
  ) ##close shinyUI
  
) ## close fluid page


####server functions####
server <- function(input, output) {
   
   ####okada rep bias####
   output$okada_rep_bias <- renderPlot({

     ##make the plot##
       ggplot(obgraphdatalong, aes(variable, value, 
                                  color = Type, 
                                  group = interaction(Type, source))) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = Type,
                       fill = Type), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$oyaxisrange[1], input$oyaxisrange[2])) +
       ylab("Bias") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                            labels = c("Epsilon", "Eta", "Omega"),
                            values = c("blue", "green", "red")) +
       cleanup

   })
   
   output$okada_rep_biasT <- renderDataTable({
     datatable(obgraphdata, options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$odecimals))
     })
   
   ####okada rep SD####
   output$okada_rep_SD <- renderPlot({
     
     ##make the plot##
     ggplot(obgraphdatalong3, aes(variable, value, 
                                color = Type, 
                                group = interaction(Type, source))) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = Type,
                       fill = Type), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$oyaxisrange[1], input$oyaxisrange[2])) +
       ylab("SD") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
   })
   
   output$okada_rep_SDT <- renderDataTable({
     datatable(obgraphdata3, options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$odecimals))
   })
  
   ####okada rep RMSE####
   output$okada_rep_RMSE <- renderPlot(({
     
     ##make the plot##
     ggplot(obgraphdatalong2, aes(variable, value, 
                                color = Type, 
                                group = interaction(Type, source))) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = Type,
                       fill = Type), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$oyaxisrange[1], input$oyaxisrange[2])) +
       ylab("RMSE") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
     
   }))
   
   output$okada_rep_RMSET <- renderDataTable({
     datatable(obgraphdata2, options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$odecimals))
   })
   
   ####rounding bias####
   output$rounding_bias <- renderPlot({
     
     ggplot(rbgraphdatalong, aes(N, value, 
                                color = variable,
                                group = variable)) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = variable,
                       fill = variable), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$ryaxisrange[1], input$ryaxisrange[2])) +
       ylab("Bias") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
   })
   
   output$rounding_biasT <- renderDataTable({
     datatable(rbgraphdata[-1, ], options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$rdecimals))
   })
   
   ####rounding rmse####
   output$rounding_RMSE <- renderPlot({
     ggplot(rbgraphdatalong2, aes(N, value, 
                                 color = variable,
                                 group = variable)) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = variable,
                       fill = variable), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$ryaxisrange[1], input$ryaxisrange[2])) +
       ylab("RMSE") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
   })
   
   output$rounding_RMSET <- renderDataTable({
     datatable(rbgraphdata2[-1, ], options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$rdecimals))
   })
   
   ####rounding SD####
   output$rounding_SD <- renderPlot({
     
     ggplot(rbgraphdatalong3, aes(N, value, 
                                 color = variable,
                                 group = variable)) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                     ymax = HICI, 
                     group = variable,
                     fill = variable), 
                 color = FALSE,
                 alpha = .4) +
       coord_cartesian(ylim = c(input$ryaxisrange[1], input$ryaxisrange[2])) +
       ylab("Bias") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
   })

   output$rounding_SDT <- renderDataTable({
     datatable(rbgraphdata3[-1, ], options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$rdecimals))
   })   
   
   ####likert no truncate bias####
   output$likertnt_bias <- renderPlot({
     
     ggplot(lntbgraphdatalong, aes(N, value, 
                                 color = variable,
                                 group = variable)) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = variable,
                       fill = variable), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$lntyaxisrange[1], input$lntyaxisrange[2])) +
       ylab("Bias") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
   })
   
   output$likertnt_biasT <- renderDataTable({
     datatable(lntbgraphdata[-1, ], options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$lntdecimals))
   })
   
   ####likert no truncate rmse####
   output$likertnt_RMSE <- renderPlot({
     ggplot(lntbgraphdatalong2, aes(N, value, 
                                  color = variable,
                                  group = variable)) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = variable,
                       fill = variable), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$lntyaxisrange[1], input$lntyaxisrange[2])) +
       ylab("RMSE") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
   })
   
   output$likertnt_RMSET <- renderDataTable({
     datatable(lntbgraphdata2[-1, ], options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$lntdecimals))
   })
   
   ####likert no truncate SD####
   output$likertnt_SD <- renderPlot({
     
     ggplot(lntbgraphdatalong3, aes(N, value, 
                                  color = variable,
                                  group = variable)) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = variable,
                       fill = variable), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$lntyaxisrange[1], input$lntyaxisrange[2])) +
       ylab("Bias") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
   })
   
   output$likertnt_SDT <- renderDataTable({
     datatable(lntbgraphdata3[-1, ], options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$lntdecimals))
   })   
   
   ####likert truncate bias####
   output$likertt_bias <- renderPlot({
     
     ggplot(ltbgraphdatalong, aes(N, value, 
                                   color = variable,
                                   group = variable)) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = variable,
                       fill = variable), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$ltyaxisrange[1], input$ltyaxisrange[2])) +
       ylab("Bias") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
   })
   
   output$likertt_biasT <- renderDataTable({
     datatable(ltbgraphdata[-1, ], options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$ltdecimals))
   })
   
   ####likert truncate rmse####
   output$likertt_RMSE <- renderPlot({
     ggplot(ltbgraphdatalong2, aes(N, value, 
                                    color = variable,
                                    group = variable)) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = variable,
                       fill = variable), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$ltyaxisrange[1], input$ltyaxisrange[2])) +
       ylab("RMSE") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
   })
   
   output$likertt_RMSET <- renderDataTable({
     datatable(ltbgraphdata2[-1, ], options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$ltdecimals))
   })
   
   ####likert truncate SD####
   output$likertt_SD <- renderPlot({
     
     ggplot(ltbgraphdatalong3, aes(N, value, 
                                    color = variable,
                                    group = variable)) +
       geom_line(size=.7) +
       geom_ribbon(aes(ymin = LOCI, 
                       ymax = HICI, 
                       group = variable,
                       fill = variable), 
                   color = FALSE,
                   alpha = .4) +
       coord_cartesian(ylim = c(input$ltyaxisrange[1], input$ltyaxisrange[2])) +
       ylab("Bias") +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       scale_color_manual(name = "Effect Size", 
                          labels = c("Epsilon", "Eta", "Omega"),
                          values = c("blue", "green", "red")) +
       scale_fill_manual(name = "Effect Size", 
                         labels = c("Epsilon", "Eta", "Omega"),
                         values = c("blue", "green", "red")) +
       cleanup
   })
   
   output$likertt_SDT <- renderDataTable({
     datatable(ltbgraphdata3[-1, ], options = list(dom = 't')) %>% 
       formatRound(1:10, as.numeric(input$ltdecimals))
   })   
   
   ####regular data not rounded####
   output$NR_bias <- renderPlot({
     
     NRbgraphbias = subset(NRbgraphdatalong, source == "Not Rounded" & Type == input$NRselect)
     
     ggplot(NRbgraphbias, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$NRyaxisrange[1], input$NRyaxisrange[2])) +
       ylab(paste("Bias", input$NRselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   output$NR_RMSE <- renderPlot({
     
     NRbgraphRMSE = subset(NRbgraphdatalong2, source == "Not Rounded" & Type == input$NRselect)
     
     ggplot(NRbgraphRMSE, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$NRyaxisrange[1], input$NRyaxisrange[2])) +
       ylab(paste("RMSE", input$NRselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   output$NR_SD <- renderPlot({
     
     NRbgraphSD = subset(NRbgraphdatalong3, source == "Not Rounded" & Type == input$NRselect)
     
     ggplot(NRbgraphSD, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$NRyaxisrange[1], input$NRyaxisrange[2])) +
       ylab(paste("SD", input$NRselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   ####regular data rounded####
   output$RR_bias <- renderPlot({
     
     RRbgraphbias = subset(RRbgraphdatalong, source == "Rounded" & Type == input$RRselect)
     
     ggplot(RRbgraphbias, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$RRyaxisrange[1], input$RRyaxisrange[2])) +
       ylab(paste("Bias", input$RRselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   output$RR_RMSE <- renderPlot({
     
     RRbgraphRMSE = subset(RRbgraphdatalong2, source == "Rounded" & Type == input$RRselect)
     
     ggplot(RRbgraphRMSE, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$RRyaxisrange[1], input$RRyaxisrange[2])) +
       ylab(paste("RMSE", input$RRselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   output$RR_SD <- renderPlot({
     
     RRbgraphSD = subset(RRbgraphdatalong3, source == "Rounded" & Type == input$RRselect)
     
     ggplot(RRbgraphSD, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$RRyaxisrange[1], input$RRyaxisrange[2])) +
       ylab(paste("SD", input$RRselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   ####likert data not rounded####
   output$NL_bias <- renderPlot({
     
     NLbgraphbias = subset(NLbgraphdatalong, source == "Not Rounded" & Type == input$NLselect)
     
     ggplot(NLbgraphbias, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$NLyaxisrange[1], input$NLyaxisrange[2])) +
       ylab(paste("Bias", input$NLselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   output$NL_RMSE <- renderPlot({
     
     NLbgraphRMSE = subset(NLbgraphdatalong2, source == "Not Rounded" & Type == input$NLselect)
     
     ggplot(NLbgraphRMSE, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$NLyaxisrange[1], input$NLyaxisrange[2])) +
       ylab(paste("RMSE", input$NLselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   output$NL_SD <- renderPlot({
     
     NLbgraphSD = subset(NLbgraphdatalong3, source == "Not Rounded" & Type == input$NLselect)
     
     ggplot(NLbgraphSD, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$NLyaxisrange[1], input$NLyaxisrange[2])) +
       ylab(paste("SD", input$NLselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   ####regular data rounded####
   output$RL_bias <- renderPlot({
     
     RLbgraphbias = subset(RLbgraphdatalong, source == "Rounded" & Type == input$RLselect)
     
     ggplot(RLbgraphbias, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$RLyaxisrange[1], input$RLyaxisrange[2])) +
       ylab(paste("Bias", input$RLselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   output$RL_RMSE <- renderPlot({
     
     RLbgraphRMSE = subset(RLbgraphdatalong2, source == "Rounded" & Type == input$RLselect)
     
     ggplot(RLbgraphRMSE, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$RLyaxisrange[1], input$RLyaxisrange[2])) +
       ylab(paste("RMSE", input$RLselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   output$RL_SD <- renderPlot({
     
     RLbgraphSD = subset(RLbgraphdatalong3, source == "Rounded" & Type == input$RLselect)
     
     ggplot(RLbgraphSD, aes(N, value, size = eta2p)) +
       geom_point(alpha = 1/5) +
       coord_cartesian(ylim = c(input$RLyaxisrange[1], input$RLyaxisrange[2])) +
       ylab(paste("SD", input$RLselect)) +
       xlab("Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       scale_size(name = "Pop Eta")
   })
   
   ####power####
   output$power <- renderPlot({
     
     powergraph = subset(longtempdata, type == input$powerselect)
     powergraph$Ntype = factor(powergraph$Ntype,
                               levels = c("Ndiff2r", "Ndiff2not",
                                          "Ndiff2rL", "Ndiff2notL"),
                               labels = c("Rounded", "Not Rounded", 
                                          "Likert Rounded", "Likert Not Rounded"))
     ggplot(powergraph, aes(N, Nest, size = popeta, color = Ntype)) +
       geom_point(alpha = .5) + 
       ylab(paste("N Difference", input$powerselect)) +
       xlab("Original Sample Size") + 
       geom_abline(slope = 0, intercept = 0) +
       cleanup +
       coord_cartesian(ylim = c(input$poweryaxisrange[1], input$poweryaxisrange[2])) + 
       scale_color_manual(name = "Data Type",
                          values = c("blue", "green", "red", "purple")) +
       scale_size(name = "Pop Eta")
     
   })
   
} #close server functions

# Run the application 
shinyApp(ui = ui, server = server)

