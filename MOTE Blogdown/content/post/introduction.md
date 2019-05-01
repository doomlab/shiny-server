---
title: Introduction
author: Doom Lab
date: '2018-05-03'
slug: introduction
showDate: false
url: /introduction/
categories: []
tags: []
---

This page provides supplemental information for the use of [MOTE Effect Size Calculator](https://doomlab.shinyapps.io/mote/). Often, an overreliance on *p*-values conceals the fact that a study is underpowered. A test may be statistically significant, yet practically inconsequential. Although the APA Task Force on Statistical Inference has long advocated for the inclusion of effect sizes, the vast majority of peer-reviewed, published academic studies stop short of reporting effect sizes and confidence intervals. 


To simplify the use and interpretation of effect sizes and confidence intervals, our team designed MOTE with Shiny, a package in R. The application relies on mathematical operations provided by the MOTE package, developed by Buchanan, Gillenwaters, Scofield, and Valentine. To begin, the user simply selects the research design and corresponding effect size with intuitive drop-down menus. The output includes a helpful description, a video tutorial, and statistics in APA style, including the effect size and the confidence interval. This application is designed for future implementation in statistics classrooms at the undergraduate and graduate level. 

<!--more-->

# Effect Sizes  

Effect sizes broadly fall into two categories:   
  
**Mean Differences:** normally represented by *Z* or *d*, usually the standardized difference between two means.    

**Variance Overlap:** normally representated by eta/omega, r-squared, or V, usually the amount of variance in the DV accounted for by the IV(s).     
  
Overall, we can think about effect sizes as a measure of the *magnitude* of an phenomenon. Unlike *p*-values, effect size is not as confounded by sample size. Effect sizes supplement *p*-values by providing this critical information. For example, we might want to know how much did grades improve after an intervention? Or to what degree were symptoms reduced after a treatment? The interpretation of the *size* of the effect (small, medium, large) should be based on your own field of study. 
  
Another benefit of providing effect sizes in research articles is the ability to estimate sample size for future studies. We can use the effect size(s) of previous research to plan the sample size for a new study. 
  
# Confidence Intervals 

Research shows that effect sizes are not perfect and can be slightly biased, with a tendency to be too high. Therefore, MOTE also allows you to calculate the confidence interval of the effect size. With confidence intervals, we can examine the range of the estimated effect size (i.e., is it small around the effect size, which might indicate we have a pretty good idea of what the effect might be? Or it is large, and the effect size might be pretty variable?) and use the range to get a better estimate of sample size for future studies. Also, the confidence intervals can give you an idea if an effect is different from zero - that is, if the confidence interval does includes zero, the effect size might not include an effect.  
