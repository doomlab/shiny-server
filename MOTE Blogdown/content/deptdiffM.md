---
title: d for Dependent t with SD Difference Scores Denominator - Means
author: DOOM Lab
date: '2018-05-09'
slug: deptdiffm
url: /tests/deptdiffm.html
showDate: false
---

<script src="//yihui.name/js/math-code.js"></script>
<script type = "text/x-mathjax-config">
MathJax.Hub.Config({
tex2jax: {
inlineMath: [['$', '$']],
}
})
</script>
<script async
src="//cdn.bootcss.com/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

# Description   

This function displays $d\_{z}$ for repeated measures data and the non-central confidence interval using the standard deviation of the differences as the denominator.

The formula for $d\_{z}$ is: $$d_{z} = \frac{M_1 - M_2}{SD_{differences}}$$
 
The formula for *t* is: $$t = {M\_{1} - M\_{2}\over SE\_{differences}}$$

# R Function

d.dep.t.diff(mdiff, sddiff, n, a = .05)

# Arguments 

+ mdiff	= mean difference score
+ sddiff = standard deviation of the difference scores
+ n	= sample size
+ a	= significance level

# Example  

In a study to test the effects of science fiction movies on people's belief in the supernatural, seven people completed a measure of belief in the supernatural before and after watching a popular science fiction movie. Participants' scores are shown with high scores indicating high levels of belief. The data are available on [GitHub](https://github.com/doomlab/shiny-server/tree/master/MOTE/examples). Example output from JASP, SPSS, and SAS are shown below.

**JASP**
![Dependent t JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/dependent%20t%20JASP.png)

**SPSS**
![Dependent t SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/dependent%20t%20SPSS.png)

**SAS**
![Dependent t SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/dependent%20t%20SAS.PNG)

# Function in R: 

d.dep.t.diff(mdiff = 1.143, sddiff = 2.116, n = 7, a = .05)

# MOTE

## Screenshot

![Dependent t Differences - Means Screenshot](../images/depttdiffmeans.jpg)

## Effect Size:

$d\_{z}$ = 0.54, 95% CI [-0.03, 1.09]

## Interpretation: 

Your confidence interval does include zero, and therefore, you might conclude that this effect size is similar to zero.

## Summary Statistics: 

*Mdiff* = 1.14, *SDdiff* = 2.12, *SE* = 0.57, 95% CI [-0.08, 2.36]

## Test Statistic: 

*t*(6) = 1.429, *p* = .203

## Interpretation: 

Your p-value is greater than the alpha value, and therefore, this test would be considered not statistically significant.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/eq9X4ynxq2A" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
