output$zMSUM <- renderUI({
  
  definition = “Definition: <br> A single sample T-test is used when you want to find the mean (average) of that sample.”,
  -	Static explanation of when you would use that test and effect size
  
  
  Effect Size: 
    -	Effect size for single sample T-test is the difference between the sample mean and the null value, divided by the standard deviation.
  
  -	Describe the confidence interval 
  o	If CI includes zero then say this would not be a thing
  o	If CI doesn’t include zero so you might conclude this is different from zero
  
  if (dscore$dlow < 0 & dscore$dhigh > 0) {
    
    cioutput = ##confidence interval includes zero
  } if (dscore$dlow > 0 & dscore$high < 0) {
    
    cioutput = ##confidence interval includes zero
      
  } else {
    
    cioutput = ##confidence interval does not include zero
      
  }
  
  
  Test Statistic: 
    -	Pull the numbers from output 
  -	If p < alpha – print out this would be considered significant
  -	Else this would not be significant 
  
  paste(definite, cioutput, teststatistic, sep = “ ”)
}) ## end render UI
