##import files
biasci = read.csv("biasCI.csv")
rmseci = read.csv("rmseCI.csv")
sdci = read.csv("sdCI.csv")

####sort the datasets by N otherwise rank code doesn't work####
biasci = biasci[order(biasci$N),]
rmseci = rmseci[order(rmseci$N),]
sdci = sdci[order(sdci$N),]

####bias information####
##order N values
biasci$ordereta = unlist(with(biasci, tapply(eta2, N, rank)))
biasci$orderep = unlist(with(biasci, tapply(epsilon2, N, rank)))
biasci$orderom = unlist(with(biasci, tapply(omega2, N, rank)))

##figure out the 95% CI by using average scores
highbiaseta = subset(biasci, ordereta == 98 | ordereta == 97)
hibeta = with(highbiaseta, tapply(eta2, N, mean))
lowbiaseta = subset(biasci, ordereta == 3 | ordereta == 2)
lobeta = with(lowbiaseta, tapply(eta2, N, mean))

highbiasep = subset(biasci, orderep == 98 | orderep == 97)
hibep = with(highbiasep, tapply(epsilon2, N, mean))
lowbiasep = subset(biasci, orderep == 3 | orderep == 2)
lobep = with(lowbiasep, tapply(epsilon2, N, mean))

highbiasom = subset(biasci, orderom == 98 | orderom == 97)
hibom = with(highbiasom, tapply(omega2, N, mean))
lowbiasom = subset(biasci, orderom == 3 | orderom == 2)
lobom = with(lowbiasom, tapply(omega2, N, mean))

##average and previous bias
avgbiaseta = with(biasci, tapply(eta2, N, mean))
avgbiasep = with(biasci, tapply(epsilon2, N, mean))
avgbiasom = with(biasci, tapply(omega2, N, mean))

obiaseta = c(.054, .027, .018, .013, .011, .009, .008, .007, .006, .005)
obiasep = c(-.002, -.001, -.001, -.001, -.001, .000, .000, .000, .000, .000)
obiasom = c(-.007, -.004, -.002, -.002, -.001, -.001, -.001, -.001, -.001, -.001)

obgraphdata = as.data.frame(rbind(avgbiaseta, avgbiasep, avgbiasom, obiaseta, obiasep, obiasom))
obgraphdata$Type = c("eta", "epsilon", "omega", "eta", "epsilon", "omega")
obgraphdata$source = c("BS", "BS", "BS", "OK", "OK", "OK")
obgraphdatalong = melt(obgraphdata, id = c("Type", "source"))
obgraphdatalong$variable = as.numeric(obgraphdatalong$variable) * 10
obgraphdatalong$HICI = melt(unname(rbind(hibeta, hibep, hibom, hibeta, hibep, hibom)))$value
obgraphdatalong$LOCI = melt(unname(rbind(lobeta, lobep, lobom, lobeta, lobep, lobom)))$value

####SD information####
##order N values
sdci$ordereta = unlist(with(sdci, tapply(eta2, N, rank)))
sdci$orderep = unlist(with(sdci, tapply(epsilon2, N, rank)))
sdci$orderom = unlist(with(sdci, tapply(omega2, N, rank)))

##figure out the 95% CI by using average scores
highsdeta = subset(sdci, ordereta == 98 | ordereta == 97)
hiseta = with(highsdeta, tapply(eta2, N, mean))
lowsdeta = subset(sdci, ordereta == 3 | ordereta == 2)
loseta = with(lowsdeta, tapply(eta2, N, mean))

highsdep = subset(sdci, orderep == 98 | orderep == 97)
hisep = with(highsdep, tapply(epsilon2, N, mean))
lowsdep = subset(sdci, orderep == 3 | orderep == 2)
losep = with(lowsdep, tapply(epsilon2, N, mean))

highsdom = subset(sdci, orderom == 98 | orderom == 97)
hisom = with(highsdom, tapply(omega2, N, mean))
lowsdom = subset(sdci, orderom == 3 | orderom == 2)
losom = with(lowsdom, tapply(omega2, N, mean))

##average and previous sd
avgsdeta = with(sdci, tapply(eta2, N, mean))
avgsdep = with(sdci, tapply(epsilon2, N, mean))
avgsdom = with(sdci, tapply(omega2, N, mean))

osdeta = c(.111, .079, .064, .056, .050, .045, .042, .039, .037, .035)
osdep = c(.120, .082, .066, .057, .051, .046, .043, .040, .037, .036)
osdom = c(.119, .081, .066, .057, .050, .046, .043, .040, .037, .035)

obgraphdata3 = as.data.frame(rbind(avgsdeta, avgsdep, avgsdom, osdeta, osdep, osdom))
obgraphdata3$Type = c("eta", "epsilon", "omega", "eta", "epsilon", "omega")
obgraphdata3$source = c("BS", "BS", "BS", "OK", "OK", "OK")
obgraphdatalong3 = melt(obgraphdata3, id = c("Type", "source"))
obgraphdatalong3$variable = as.numeric(obgraphdatalong3$variable) * 10
obgraphdatalong3$HICI = melt(unname(rbind(hiseta, hisep, hisom, hiseta, hisep, hisom)))$value
obgraphdatalong3$LOCI = melt(unname(rbind(loseta, losep, losom, loseta, losep, losom)))$value


####RMSE information####
##order N values
rmseci$ordereta = unlist(with(rmseci, tapply(eta2, N, rank)))
rmseci$orderep = unlist(with(rmseci, tapply(epsilon2, N, rank)))
rmseci$orderom = unlist(with(rmseci, tapply(omega2, N, rank)))

##figure out the 95% CI by using average scores
highrmseeta = subset(rmseci, ordereta == 98 | ordereta == 97)
hireta = with(highrmseeta, tapply(eta2, N, mean))
lowrmseeta = subset(rmseci, ordereta == 3 | ordereta == 2)
loreta = with(lowrmseeta, tapply(eta2, N, mean))

highrmseep = subset(rmseci, orderep == 98 | orderep == 97)
hirep = with(highrmseep, tapply(epsilon2, N, mean))
lowrmseep = subset(rmseci, orderep == 3 | orderep == 2)
lorep = with(lowrmseep, tapply(epsilon2, N, mean))

highrmseom = subset(rmseci, orderom == 98 | orderom == 97)
hirom = with(highrmseom, tapply(omega2, N, mean))
lowrmseom = subset(rmseci, orderom == 3 | orderom == 2)
lorom = with(lowrmseom, tapply(omega2, N, mean))

##average and previous rmse
avgrmseeta = with(rmseci, tapply(eta2, N, mean))
avgrmseep = with(rmseci, tapply(epsilon2, N, mean))
avgrmseom = with(rmseci, tapply(omega2, N, mean))

ormseeta = c(.123, .083, .067, .057, .051, .046, .043, .040, .038, .036)
ormseep = c(.120, .082, .066, .057, .051, .046, .043, .040, .037, .036)
ormseom = c(.120, .081, .066, .057, .050, .046, .043, .040, .038, .035)

obgraphdata2 = as.data.frame(rbind(avgrmseeta, avgrmseep, avgrmseom, ormseeta, ormseep, ormseom))
obgraphdata2$Type = c("eta", "epsilon", "omega", "eta", "epsilon", "omega")
obgraphdata2$source = c("BS", "BS", "BS", "OK", "OK", "OK")
obgraphdatalong2 = melt(obgraphdata2, id = c("Type", "source"))
obgraphdatalong2$variable = as.numeric(obgraphdatalong2$variable) * 10
obgraphdatalong2$HICI = melt(unname(rbind(hireta, hirep, hirom, hireta, hirep, hirom)))$value
obgraphdatalong2$LOCI = melt(unname(rbind(loreta, lorep, lorom, loreta, lorep, lorom)))$value

####create fluid row####
fluidRow(
  
  #### put input area here ####
  column(4,
         style = "background-color: #E8E8E8",
         
         ##change the title here
         div(style="display: inline-block; vertical-align:top; text-align:center; width: 100%;",
             strong("Okada Replications")),
         
         ##put input boxes here
         sliderInput("oyaxisrange", "Y-Axis Range:",
                     min = -.40, max = .40,
                     value = c(-.05, .15)),
         
         textInput("odecimals", "Table Decimals:",
                   value = 4)
         
         
  ), ## close column 1
  
  #### put output here ####
  column(8, 
         tabsetPanel(
           tabPanel("Bias", plotOutput("okada_rep_bias"),
                    br(),
                    dataTableOutput("okada_rep_biasT")),
           tabPanel("SD", plotOutput("okada_rep_SD"),
                    br(),
                    dataTableOutput("okada_rep_SDT")),
           tabPanel("RMSE", plotOutput("okada_rep_RMSE"),
                    br(),
                    dataTableOutput("okada_rep_RMSET"))
           ) ## close tabset panel
         
         ) ## close column
  
) ##close fluid row
