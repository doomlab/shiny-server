significant = "Your <i>p</i>-value is less than the alpha value, and therefore, this test would be considered statistically significant."
not_sig = "Your <i>p</i>-value is greater than the alpha value, and therefore, this test would be considered not statistically significant."
no_zero = "Your confidence interval does not include zero, and therefore, you might conclude that this effect size is different from zero."
yes_zero = "Your confidence interval does include zero, and therefore, you might conclude that this effect size is similar to zero."
na_zero = "Your confidence interval includes NA, which indicates that the limit cannot be found. When this occurs on the lower limit, that implies that the effect size is similar to zero."
cohend = "This effect size is traditionally interpreted as the standardized difference between two mean scores."
eta = "This effect size is traditionally interpreted as the percent of variance accounted for in the DV by the IV(s)."
odds_describe = "This effect size is traditionally interpreted as like likelihood of group 1 to group 2. Therefore, an odds of 1 indicates they are equally likely. Odds less than 1 indicate that group 2 is more likely, and odds greater than 1 indicate that group 1 is more likely."
odds_no = "Your confidence interval does not include one, and therefore, you might conclude that this effect size is different from one."
odds_yes = "Your confidence interval does include one, and therefore, you might conclude that this effect size is similar to one."

checkp = function(p, alpha) {
  p = as.numeric(p)
  alpha = as.numeric(alpha)
  if (p <= alpha) { output = significant } else { output = not_sig }
  return(output)}
checkzero = function(low, high){
  if (is.na(low) | is.na(high)) { output = na_zero
  } else if (low <= 0 & high >= 0) { output = yes_zero
  } else if (low >= 0 & high <= 0) { output = yes_zero
  } else { output = no_zero }
  return(output)}
checkone = function(low, high){
  if (is.na(low) | is.na(high)) { output = na_zero
  } else if (low <= 1 & high >= 1) { output = odds_yes
  } else if (low >= 1 & high <= 1) { output = odds_yes
  } else { output = odds_no }
  return(output)}
apa_d = function(saved.d, alpha, digits = 2) {
  output = paste("<i>d</i> = ", apa(saved.d$d, digits),
        ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$dlow, digits),
        ", ", apa(saved.d$dhigh, digits), "]", sep = "")
  return(output)}

apa_var = function(saved.d, alpha, digits = 2, type = "eta") {

  if (type == "eta") {
    output = paste("<i>eta^2</i> = ", apa(saved.d$eta, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$etalow, digits, leading = F),
                   ", ", apa(saved.d$etahigh, digits, leading = F), "]", sep = "")
  }

  if (type == "etap") {
    output = paste("<i>eta_p^2</i> = ", apa(saved.d$eta, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$etalow, digits, leading = F),
                   ", ", apa(saved.d$etahigh, digits, leading = F), "]", sep = "")
  }

  if (type == "ges") {
    output = paste("<i>eta_G^2</i> = ", apa(saved.d$ges, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$geslow, digits, leading = F),
                   ", ", apa(saved.d$geshigh, digits, leading = F), "]", sep = "")
  }

  if (type == "omega") {
    output = paste("<i>omega^2</i> = ", apa(saved.d$omega, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$omegalow, digits, leading = F),
                   ", ", apa(saved.d$omegahigh, digits, leading = F), "]", sep = "")
  }

  if (type == "omegap") {
    output = paste("<i>omega_p^2</i> = ", apa(saved.d$omega, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$omegalow, digits, leading = F),
                   ", ", apa(saved.d$omegahigh, digits, leading = F), "]", sep = "")
  }

  if (type == "omegag") {
    output = paste("<i>omega_g^2</i> = ", apa(saved.d$omega, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$omegalow, digits, leading = F),
                   ", ", apa(saved.d$omegahigh, digits, leading = F), "]", sep = "")
  }

  if (type == "epsilon") {
    output = paste("<i>epsilon^2</i> = ", apa(saved.d$epsilon, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$epsilonlow, digits, leading = F),
                   ", ", apa(saved.d$epsilonhigh, digits, leading = F), "]", sep = "")
  }

  if (type == "r") {
    output = paste("<i>r</i> = ", apa(saved.d$r, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$rlow, digits, leading = F),
                   ", ", apa(saved.d$rhigh, digits, leading = F), "]", sep = "")
  }

  if (type == "R2") {
    output = paste("<i>R^2</i> = ", apa(saved.d$R2, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$R2low, digits, leading = F),
                   ", ", apa(saved.d$R2high, digits, leading = F), "]", sep = "")
  }

  if (type == "v") {
    output = paste("<i>V</i> = ", apa(saved.d$v, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$vlow, digits, leading = F),
                   ", ", apa(saved.d$vhigh, digits, leading = F), "]", sep = "")
  }

  if (type == "o") {
    output = paste("<i>Odds</i> = ", apa(saved.d$odds, digits, leading = F),
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$olow, digits, leading = F),
                   ", ", apa(saved.d$ohigh, digits, leading = F), "]", sep = "")
  }

     return(output)}


apa_M = function(saved.d, meanno = 1, alpha, digits = 2) {
  if (meanno == 0) {
    output = paste("<i>M</i> = ", apa(saved.d$m, digits), #report mean
                   ", <i>SD</i> = ", apa(saved.d$sd, digits), #report sd
                   ", <i>SE</i> = ", apa(saved.d$se, digits), #report se
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$Mlow, 2), #report low
                   ", ", apa(saved.d$Mhigh, digits), "]", sep = "") #report high
  }

  if (meanno == 1) {
    output = paste("<i>M</i> = ", apa(saved.d$M1, digits), #report mean
          ", <i>SD</i> = ", apa(saved.d$sd1, digits), #report sd
          ", <i>SE</i> = ", apa(saved.d$se1, digits), #report se
          ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$M1low, 2), #report low
          ", ", apa(saved.d$M1high, digits), "]", sep = "") #report high
    return(output)}
  if (meanno == 2) {
    output = paste("<i>M</i> = ", apa(saved.d$M2, digits), #report mean
          ", <i>SD</i> = ", apa(saved.d$sd2, digits), #report sd
          ", <i>SE</i> = ", apa(saved.d$se2, digits), #report se
          ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$M2low, 2), #report low
          ", ", apa(saved.d$M2high, digits), "]", sep = "") #report high
    return(output)}
}

apa_diff = function(saved.d, alpha, digits = 2) {
    output = paste("<i>Mdiff</i> = ", apa(saved.d$mdiff, digits), #report mean
                   ", <i>SDdiff</i> = ", apa(saved.d$sddiff, digits), #report sd
                   ", <i>SE</i> = ", apa(saved.d$se, digits), #report se
                   ", ", (1-as.numeric(alpha))*100, "% CI [", apa(saved.d$Mlow, 2), #report low
                   ", ", apa(saved.d$Mhigh, digits), "]", sep = "") #report high
    return(output)}

apa_stat = function(saved.d, stat, digits = 2) {
  if (saved.d$p < .001) { pvalue = "<i>p</i> < .001"} else { pvalue = paste("<i>p</i> = ", apa(saved.d$p, 3, F), sep = "") }
  if (stat == "Z") { output = paste("<i>Z</i>", " = ", apa(saved.d$z, digits), ", ", pvalue, sep = "")}
  if (stat == "t") { output = paste("<i>t</i>", "(", saved.d$df, ")", " = ", apa(saved.d$t, digits), ", ", pvalue, sep = "")}
  if (stat == "tr") { output = paste("<i>t</i>", "(", saved.d$dfe, ")", " = ", apa(saved.d$t, digits), ", ", pvalue, sep = "")}
  if (stat == "F") { output = paste("<i>F</i>", "(", saved.d$dfm, ", ", saved.d$dfe, ")", " = ", apa(saved.d$F, digits), ", ", pvalue, sep = "")}
  if (stat == "X2") { output = paste("X^2", "(", saved.d$df, ")", " = ", apa(saved.d$x2, digits), ", ", pvalue, sep = "")}
  return(output)}

help_console <- function(topic, format=c("text", "html", "latex", "Rd"),
                         lines=NULL, before=NULL, after=NULL) {
  format=match.arg(format)
  if (!is.character(topic)) topic <- deparse(substitute(topic))
  helpfile = utils:::.getHelpFile(help(topic))

  hs <- capture.output(switch(format,
                              text=tools:::Rd2txt(helpfile),
                              html=tools:::Rd2HTML(helpfile),
                              latex=tools:::Rd2latex(helpfile),
                              Rd=tools:::prepare_Rd(helpfile)
  )
  )
  if(!is.null(lines)) hs <- hs[lines]
  hs <- c(before, hs, after)
  cat(hs, sep="\n")
  invisible(hs)
}
