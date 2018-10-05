---
title: Chi-square - Odds
author: DOOM Lab
date: '2018-05-09'
slug: chio
url: /tests/chio.html
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

This function displays odds ratios and their normal confidence intervals. This statistic is calculated as (level 1.1/level 1.2) / (level 2.1/level 2.2), which can be considered the odds of level 1.1 given level1 overall versus level2.1 given level2 overall. 

The formula for *odds* is: $$\frac{(N\_{11}/N\_{12})}{(N\_{21}/N\_{22})}$$

# R Function

odds(n11, n12, n21, n22, a = 0.05) 

# Arguments 

n11	= sample size for level 1.1
n12	= sample size for level 1.2
n21	= sample size for level 2.1
n22	= sample size for level 2.2
a	= significance level

# Example  

Description goes here!

**JASP**
![Chi-square JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/chisq%20JASP.png)

**SPSS**
![Chi-square SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/chisq%20SPSS.png)

**SAS**
![Chi-square SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/chisq%20SAS.PNG)


n11	= 9
n12	= 4
n21	= 7
n22	= 8
a	= .05

# Function in R: 

odds(n11 = 9, n12 = 4, n21 = 7, n22 = 8, a = 0.05) 

# MOTE

## Screenshot

![Z-Test Means Screenshot](../images/z-test-means-screen.png)

## Effect Size:

This effect size is traditionally interpreted as like likelihood of group 1 to group 2. Therefore, an odds of 1 indicates they are equally likely. Odds less than 1 indicate that group 2 is more likely, and odds greater than 1 indicate that group 1 is more likely.

*Odds* = 2.57, 95% CI [1.02, 4.13]

## Interpretation: 

Your confidence interval does not include one, and therefore, you might conclude that this effect size is different from one.

## Summary Statistics: 

Not applicable.

## Test Statistic: 

Not applicable.

## Interpretation: 

Not applicable.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/fxNflokgSTs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
