---
title: rcorrel
author: DOOM Lab
date: '2018-05-09'
slug: dtor
url: /tests/rcorrel.html
showDate: false
---

<script src="//yihui.name/js/math-code.js"></script>
<script async
src="//cdn.bootcss.com/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

# Description   

This function displays transformation from r to r2 to calculate the non-central confidence 
interval for $r^2$ using the F distribution. 

The formula for *t* is: $$\frac{r}{\sqrt{ \frac{1-r^2} {(N - 2)}}}$$

# R Function

r.correl(r, n, a)

# Arguments 


+ r = correlation coefficient
+ n = sample size
+ a	= significance level

# Example  

In a study to test the effects of science fiction movies on people's belief in the supernatural, seven people completed a measure of belief in the supernatural before and after watching a popular science fiction movie. Higher scores indicated high levels of belief. The mean measure of belief on the pretest was 5.571, while the posttest average score was lower, 4.429. The data is included at [GitHub](https://github.com/doomlab/shiny-server/tree/master/MOTE/examples). Example output from JASP, SPSS, and SAS are shown below.

**JASP**
![Dependent t JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/dependent%20t%20JASP.png)

**SPSS**
![Dependent t SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/dependent%20t%20SPSS.png)

**SAS**
![Dependent t SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/dependent%20t%20SAS.PNG)

+ r = 5.571
+ n = 4.429
+ a	= .05

# Function in R: 

r.correl(r, n, a = 0.05)

# MOTE

## Screenshot

![Single-Sample t - Means Screenshot](../images/deptavgmeans.jpg)

## Effect Size:

*d* = 0.47, 95% CI [-0.09, 1.01]

## Interpretation: 

Your confidence interval does include zero, and therefore, you might conclude that this effect size is similar to zero.

## Summary Statistics: 

Group 1 Summary Statistics: *M* = 5.57, *SD* = 1.99, *SE* = 0.53, 95% CI [4.42, 6.72]

Group 2 Summary Statistics: *M* = 4.43, *SD* = 2.88, *SE* = 0.77, 95% CI [2.77, 6.09]
## Test Statistic: 

Not applicable.

## Interpretation: 

Not applicable.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/eq9X4ynxq2A" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
