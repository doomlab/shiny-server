library(pwr)

################### load in bias across####
bias_across <- read.csv("bias_across.csv")

##melt the data so you have all of them 
rounded = bias_across[ , c(1, 3, 5, 7, 8)]
rounded = melt(rounded,
               id =  c("eta2p", "N"))

notrounded = bias_across[ , c(2, 4, 6, 7, 8)]
notrounded = melt(notrounded,
               id =  c("eta2p", "N"))

colnames(rounded) = c("popeta", "N", "type", "Bias2r")
colnames(notrounded) = c("popeta", "N", "type", "Bias2not")
bias_across = cbind(rounded, "Bias2not" = notrounded[, 4])
bias_across$type = factor(bias_across$type,
                          levels = c("eta2r", "epsilon2r", "omega2r"),
                          labels = c("Eta", "Epsilon", "Omega"))

##add bias with pop to get overall original eta again
bias_across$Eta2r = bias_across$Bias2r + bias_across$popeta
bias_across$Eta2not = bias_across$Bias2not + bias_across$popeta

#add in observed power 2r
bias_across$Power2r = "NA"
nsim = nrow(bias_across)
for(i in 1:nsim){
  n = bias_across$N[i]
  f = sqrt(bias_across$Eta2r[i]/(1-bias_across$Eta2r[i]))
  pow = pwr.anova.test(k = 4, n = n, f = f, sig.level = 0.05)
  bias_across$Power2r[i] = pow$power
}

#add in n estimate for each eta 2r
bias_across$Nest2r = "NA"
for(i in 1:nsim){ 
  f = sqrt(bias_across$Eta2r[i]/(1-bias_across$Eta2r[i]))
  pow = pwr.anova.test(k=4, f = f, power = .8, sig.level = 0.05)
  bias_across$Nest2r[i] = pow$n
} 

# Nsample - Npop 2r
bias_across$popNest = "NA"
k=4 
for(i in 1:nsim){
  f = sqrt(bias_across$popeta[i] / (1-bias_across$popeta[i]))
  powtest = pwr.anova.test(k=k,f=f,power=.8,sig.level=0.05)
  bias_across$popNest[i] = powtest$n
}

bias_across$Ndiff2r = as.numeric(bias_across$Nest2r) - 
  as.numeric(bias_across$popNest)

#add in observed power 2not
bias_across$Power2not = "NA"
nsim = nrow(bias_across)
for(i in 1:nsim){
  n = bias_across$N[i]
  f = sqrt(bias_across$Eta2not[i]/(1-bias_across$Eta2not[i]))
  pow = pwr.anova.test(k = 4, n = n, f = f, sig.level = 0.05)
  bias_across$Power2not[i] = pow$power
}
#add in n estimate for each eta 2not
bias_across$Nest2not = "NA"
for(i in 1:nsim){
  f = sqrt(bias_across$Eta2not[i]/(1-bias_across$Eta2not[i]))
  pow = pwr.anova.test(k=4, f = f, power = .8, sig.level = 0.05)
  bias_across$Nest2not[i] = pow$n
} 

# Nsample - Npop 2not
bias_across$Ndiff2not = as.numeric(bias_across$Nest2not) -
  as.numeric(bias_across$popNest) 

################### load in bias across L####
bias_acrossL <- read.csv("bias_acrossL.csv")

##melt the data so you have all of them 
roundedL = bias_acrossL[ , c(1, 3, 5, 7, 8)]
roundedL = melt(roundedL,
               id =  c("eta2p", "N"))

notroundedL = bias_acrossL[ , c(2, 4, 6, 7, 8)]
notroundedL = melt(notroundedL,
                  id =  c("eta2p", "N"))

colnames(roundedL) = c("popeta", "N", "type", "Bias2r")
colnames(notroundedL) = c("popeta", "N", "type", "Bias2not")
bias_acrossL = cbind(roundedL, "Bias2not" = notroundedL[, 4])
bias_acrossL$type = factor(bias_acrossL$type,
                          levels = c("eta2r", "epsilon2r", "omega2r"),
                          labels = c("Eta", "Epsilon", "Omega"))



bias_acrossL$Eta2r = bias_acrossL$Bias2r + bias_acrossL$popeta
bias_acrossL$Eta2not = bias_acrossL$Bias2not + bias_acrossL$popeta
#add in observed power 2r
bias_acrossL$Power2r = "NA"
nsim = nrow(bias_acrossL)
for(i in 1:nsim){
  n = bias_acrossL$N[i]
  f = sqrt(bias_acrossL$Eta2r[i]/(1-bias_acrossL$Eta2r[i]))
  pow = pwr.anova.test(k = 4, n = n, f = f, sig.level = 0.05)
  bias_acrossL$Power2r[i] = pow$power
}
#add in n estimate for each eta 2r
bias_acrossL$Nest2r = "NA"
for(i in 1:nsim){
  f = sqrt(bias_acrossL$Eta2r[i]/(1-bias_acrossL$Eta2r[i]))
  pow = pwr.anova.test(k=4, f = f, power = .8, sig.level = 0.05)
  bias_acrossL$Nest2r[i] = pow$n
} 

# Nsample - Npop 2r
bias_acrossL$popNest = "NA"
k=4 
for(i in 1:nsim){
  f = sqrt(bias_acrossL$popeta[i] / (1 - bias_acrossL$popeta[i]))
  powtest = pwr.anova.test(k=k,f=f,power=.8,sig.level=0.05)
  bias_acrossL$popNest[i] = powtest$n
}
bias_acrossL$Ndiff2r = as.numeric(bias_acrossL$Nest2r) - as.numeric(bias_acrossL$popNest)

#add in observed power 2not
bias_acrossL$Power2not = "NA"
nsim = nrow(bias_acrossL)
for(i in 1:nsim){
  n = bias_acrossL$N[i]
  f = sqrt(bias_acrossL$Eta2not[i]/(1-bias_acrossL$Eta2not[i]))
  pow = pwr.anova.test(k = 4, n = n, f = f, sig.level = 0.05)
  bias_acrossL$Power2not[i] = pow$power
}
#add in n estimate for each eta 2not
bias_acrossL$Nest2not = "NA"
for(i in 1:nsim){
  f = sqrt(bias_acrossL$Eta2not[i]/(1-bias_acrossL$Eta2not[i]))
  pow = pwr.anova.test(k=4, f = f, power = .8, sig.level = 0.05)
  bias_acrossL$Nest2not[i] = pow$n
} 

# Nsample - Npop 2not
bias_acrossL$Ndiff2not = as.numeric(bias_acrossL$Nest2not) - as.numeric(bias_acrossL$popNest)

tempdata = cbind(bias_across[ , c(1,2,3,11,14)], bias_acrossL[ , c(11,14)])
colnames(tempdata)[5:6] = c("Ndiff2rL", "Ndiff2notL")

longtempdata = melt(tempdata, 
                    id = c("popeta", "N", "type"))
colnames(longtempdata)[4:5] = c("Ntype", "Nest")

##multiply difference scores by 4 to get the difference per group
longtempdata$Nest = longtempdata$Nest * 4

####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Differences in Sample Size")),
         
         ##put input boxes here
         sliderInput("poweryaxisrange", "Y-Axis Range:",
                     min = -1000, max = 350,
                     value = c(-1000, 350)),
         
         selectInput("powerselect", "Select Effect Size:",
                     c("Eta" = "Eta",
                       "Omega" = "Omega",
                       "Epsilon" = "Epsilon"))
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         plotOutput("power"),
         br(),
         helpText("Complete dataset avaliable at: https://osf.io/urd8q/")
  ) ## close column
  
) ##close fluid row

