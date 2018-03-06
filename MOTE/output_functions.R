significant = "Your p-value is less than the alpha value, and therefore, this test would be considered statistically signifcant."
not_sig = "Your p-value is greater than the alpha value, and therefore, this test would be considered not statistically significant."
no_zero = "Your confidence interval does not include zero, and therefore, you might conclude that this effect size is different from zero."
yes_zero = "Your confidence interval does include zero, and therefore, you might conclude that this effect size is similar to zero."
cohend = "This effect size is traditionally interpreted as the standardized difference between two mean scores."
eta = "This effect size is traditionally interpreted as the percent of variance accounted for in the DV by the IV(s)."

checkp = function(p, alpha) { 
  if (p <= alpha) { output = significant } else { output = not_sig }
  return(output)}
checkzero = function(low, high){ 
  if (low <= 0 & high >= 0) { output = yes_zero 
  } else if (low >= 0 & high <= 0) { output = yes_zero 
  } else { output = no_zero }
  return(output)}
apa_d = function(saved.d, alpha, digits = 2) { 
  output = paste("d = ", apa(saved.d$d, digits),
        ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$dlow, digits), 
        ", ", apa(saved.d$dhigh, digits), "]", sep = "") 
  return(output)}


apa_Z = function(saved.d, alpha, digits = 2) { 
    output = paste("M = ", apa(saved.d$m, digits), #report mean
                   ", SD = ", apa(saved.d$sd, digits), #report sd
                   ", SE = ", apa(saved.d$se, digits), #report se
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$Mlow, 2), #report low
                   ", ", apa(saved.d$Mhigh, digits), "]", sep = "") #report high
    return(output)}

apa_M = function(saved.d, meanno = 1, alpha, digits = 2) { 
  if (meanno == 1) {
    output = paste("M = ", apa(saved.d$M1, digits), #report mean
          ", SD = ", apa(saved.d$sd1, digits), #report sd
          ", SE = ", apa(saved.d$se1, digits), #report se
          ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$M1low, 2), #report low
          ", ", apa(saved.d$M1high, digits), "]", sep = "") #report high
    return(output)}
  if (meanno == 2) {
    output = paste("M = ", apa(saved.d$M2, digits), #report mean
          ", SD = ", apa(saved.d$sd2, digits), #report sd
          ", SE = ", apa(saved.d$se2, digits), #report se
          ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$M2low, 2), #report low
          ", ", apa(saved.d$M2high, digits), "]", sep = "") #report high
    return(output)}

apa_diff = function(saved.d, alpha, digits = 2) { 
    output = paste("Mdiff = ", apa(saved.d$mdiff, digits), #report mean
                   ", SDdiff = ", apa(saved.d$sddiff, digits), #report sd
                   ", SE = ", apa(saved.d$se, digits), #report se
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$Mlow, 2), #report low
                   ", ", apa(saved.d$Mhigh, digits), "]", sep = "") #report high
    return(output)}
  
apa_stat = function(saved.d, stat, digits = 2) {
  
  if (saved.d$p < .001) { pvalue = "p < .001"} else { pvalue = paste("p = ", apa(saved.d$p, 3, F), sep = "") }
  
  if (stat == "Z") {
    output = paste(stat, " = ", apa(saved.d$z, digits), ", ", pvalue, sep = "")
  }
  if (stat == "t") {
    output = paste(stat, "(", saved.d$df, ")", 
                   " = ", apa(saved.d$t, digits), ", ", pvalue, sep = "")
  }
  if (stat == "F") {
    output = paste(stat, "(", saved.d$dfm, ", ", saved.d$dfe, ")", 
                   " = ", apa(saved.d$F, digits), ", ", pvalue, sep = "")
  }
  if (stat == "X2") {
    output = paste(stat, "(", saved.d$df, ")", 
                   " = ", apa(saved.d$x2, digits), ", ", pvalue, sep = "")
  }
  return(output)
}

}