

####single sample t from means####
output$singletMAPA <- renderText({ 
  
  ##check for N
  if (input$df != "") {
    n = as.numeric(input$df) + 1
  } else { n = as.numeric(input$n) }
  
  ##check for SE
  if (input$se1 != "") {
    sd1 = as.numeric(input$se1) * sqrt(n)
  } else { sd1 = as.numeric(input$sd1) }
  
  dscore = d.single.t(as.numeric(input$mean1), as.numeric(input$mean2),
                      sd1, n, as.numeric(input$alpha))
  
  paste("d = ", apa(dscore$d, 3),
        ", ", (1-as.numeric(input$alpha))*100, "%[", apa(dscore$dlow, 3), 
        " - ", apa(dscore$dhigh, 3), "]", sep = "")
}) #close singletMAPA

####dependent t with average standard deviation####
output$davAPA <- renderText({ 
  
  ##check for N
  if (input$df != "") {
    n = as.numeric(input$df) + 1
  } else { n = as.numeric(input$n) }
  
  ##check for SE1
  if (input$se1 != "") {
    sd1 = as.numeric(input$se1) * sqrt(n)
  } else { sd1 = as.numeric(input$sd1) }
  
  ##check for SE2
  if (input$se2 != "") {
    sd2 = as.numeric(input$se2) * sqrt(n)
  } else { sd2 = as.numeric(input$sd2) }
  
  dscore = d.dep.t.avg(as.numeric(input$mean1), as.numeric(input$mean2),
                       sd1, sd2, n, as.numeric(input$alpha))
  
  paste("d = ", apa(dscore$d, 3),
        ", ", (1-as.numeric(input$alpha))*100, "%[", apa(dscore$dlow, 3), 
        " - ", apa(dscore$dhigh, 3), "]", sep = "")
  
}) #close davAPA

####dependent t with difference score standard deviation####
output$dzAPA <- renderText({ 
  
  ##check for N
  if (input$dfstuff != "") {
    n = as.numeric(input$dfstuff) + 1
  } else { n = as.numeric(input$nstuff) }
  
  ##check for sediff
  if (input$sediff != "" | !is.null(input$sediff)) {
    sddiff = as.numeric(input$sediff) * sqrt(n)
  } else { sddiff = as.numeric(input$sddiff) }
  
  #dscore = d.dep.t.diff(as.numeric(input$meandiff),
  #                     sddiff, n, as.numeric(input$alpha))
  
  paste(input$meandiff, "DF: " , input$dfstuff, "N: ", input$nstuff, "SD diff: ", input$sddiff, sep = "")
  #          "<br>d = ", apa(dscore$d, 3),
  #          ", ", (1-as.numeric(input$alpha))*100, "%[", apa(dscore$dlow, 3), 
  #          " - ", apa(dscore$dhigh, 3), "]", sep = "")
  
}) #close d.dep.t.diffAPA

####dependent t from t####
output$deptt.from.tAPA <- renderText({ 
  
  ##check for N
  if (input$df != "") {
    n = as.numeric(input$df) + 1
  } else { n = as.numeric(input$n) }
  
  dscore = d.dep.t.diff(as.numeric(input$tscore),
                        n, as.numeric(input$alpha))
  
  paste("d = ", apa(dscore$d, 3),
        ", ", (1-as.numeric(input$alpha))*100, "%[", apa(dscore$dlow, 3), 
        " - ", apa(dscore$dhigh, 3), "]", sep = "")
  
}) #close deptt.from.tAPA


####dept RM####
output$dresults <- renderText({ 
  
  ##check for N
  if (input$df != "") {
    n = as.numeric(input$df) + 1
  } else { n = as.numeric(input$n) }
  
  ##check for SE1
  if (input$se1 != "") {
    sd1 = as.numeric(input$se1) * sqrt(n)
  } else { sd1 = as.numeric(input$sd1) }
  
  dscore = d.dep.t.rm(as.numeric(input$mean1), as.numeric(input$mean2),
                      sd1, sd2, r, n, as.numeric(input$alpha))
  
  paste("d = ", apa(dscore$d, 3),
        ", ", (1-as.numeric(input$alpha))*100, "%[", apa(dscore$dlow, 3), 
        " - ", apa(dscore$dhigh, 3), "]", sep = "")
}) #close dresults


output$code <- renderText({ 
  
  paste("d.single.t.avg(as.numeric(input$mean1), 
        as.numeric(input$mean2),
        sd1, se1, n, as.numeric(input$alpha))")
  
})