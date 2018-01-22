##Summary Page##
#Dependent T#
output$zMSUM <- renderUI({
  
  #Static Definition  
  helptext("Definition: <br> A Dependent T-test is a statistical test used to determine whether two population means are different"),
  
  #Effect Size
    helpText("Effect Size: <br> The effect size tells us the size of the difference between our groups"),
    
    #Confidence Interval
    
    if (dscore$dlow < 0 & dscore$dhigh > 0) {
      
      cioutput = "This Confidence Interval includes zero, which means that your results are not likely different from zero"
    } if (dscore$dlow > 0 & dscore$high < 0) {
      
      cioutput = "This Confidence Interval includes zero, which means that your results are not likely different from zero"
      
    } else {
      
      cioutput = "This Confidence Interval does not include zero, which means that your results are likely different from zero"
      
    }
    
    #Significance
    
    if (dscore$p < .05) {
      
      poutput = "The P Value is less then .05, meaning that your results are staistically significant"
    } else (dscore$p > .05) {
      
      poutput = "The P Value is greater then .05, meaning that your results are not staistically significant"
      
      
      paste(cioutput, poutput, sep = “ ”)
    }) ## end render UI
