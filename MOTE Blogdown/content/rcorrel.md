---
title: r to Coefficient of Determination (R2) from F
author: DOOM Lab
date: '2018-05-09'
slug: dtor
url: /tests/rcorrel.html
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

This function displays transformation from r to r2 to calculate the non-central confidence 
interval for $r^{2}$ using the F distribution. 

The formula for *t* is: $$\frac{r}{\sqrt{ \frac{1-r^2} {(N - 2)}}}$$

# R Function

r.correl(r, n, a)

# Arguments 

+ r = correlation coefficient
+ n = sample size
+ a	= significance level

# Example  

What is the correlation between miles per gallon and car weight?  Are lighter cars more fuel-efficient?  

This example is derived from the mtcars dataset, provided in R. An amended dataset is available on our [GitHub](https://github.com/doomlab/shiny-server/tree/master/MOTE/examples). Example output from JASP, SPSS, and SAS are shown below.

**JASP**
![Correlation JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/correlation%20JASP.png)

**SPSS**
![Correlation SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/correlation%20SPSS.png)

**SAS**
![Correlation SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/correlation%20SAS.png)

+ r = -0.868
+ n = 32
+ a	= .05

# Function in R: 

r.correl(r = -0.868, n = 32, a = 0.05)

# MOTE

## Screenshot

![Correlation Screenshot](../images/corr.jpg)

Definition: This effect size is traditionally interpreted as the percent of variance accounted for in the DV by the IV(s).

## Effect Size:

*r* = -.87, 95% CI [-.74, -.93]

## Interpretation: 

Your confidence interval does not include zero, and therefore, you might conclude that this effect size is different from zero.

## Effect Size:

$R^{2}$ = .75, 95% CI [.55, .87]

## Interpretation: 

Your confidence interval does not include zero, and therefore, you might conclude that this effect size is different from zero.

## Test Statistic: 

*t*(30) = -9.57, *p* < .001

## Interpretation: 

Your p-value is less than the alpha value, and therefore, this test would be considered statistically significant.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/_3mBy7gnK3Y" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
