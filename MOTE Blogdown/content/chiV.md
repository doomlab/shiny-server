---
title: Chi-square V
author: DOOM Lab
date: '2018-05-09'
slug: chiv
url: /tests/chiv.html
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

This function displays *V* and non-central confidence interval for the specified chi-square statistic.

The formula for *V* is: $$\sqrt{ \frac{\chi^2} {N \times df\_{smaller}} } $$

$df\_{smaller}$ is defined by the minimum of (rows - 1) or (columns - 1). 

# R Function

v.chi.sq(x2, n, r, c, a = 0.05) 

# Arguments 

+ x2 = chi-square statistic
+ n	= sample size
+ r	= number of rows in the contingency table
+ c	= number of columns in the contingency table
+ a	= significance level 

# Example  

**JASP**
![BN ANOVA 1 JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/bn%20anova%20JASP.png)

**SPSS**
![BN ANOVA 1 SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/bn%20anova%20SPSS.png)

**SAS**
![BN ANOVA 1 SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/bn%20anova%20SAS.PNG)


+ x2 = 2.05
+ n	= 60
+ r	= 3
+ c	= 3
+ a	= .05 

# Function in R: 

v.chi.sq(x2 = 2.05, n = 60, r = 3, c = 3, a = 0.05) 

# MOTE

## Screenshot

![Z-Test Means Screenshot](../images/z-test-means-screen.png)

## Effect Size:
This effect size is traditionally interpreted as the percent of variance accounted for in the DV by the IV(s).

*V* = .13, 95% CI [.18, .30]

## Interpretation: 

Your confidence interval does not include zero, and therefore, you might conclude that this effect size is different from zero.

## Summary Statistics: 

Not applicable

## Test Statistic: 

X^2(4) = 2.05, p = .727

## Interpretation: 

Your *p*-value is greater than the alpha value, and therefore, this test would be considered not statistically significant.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/fxNflokgSTs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
