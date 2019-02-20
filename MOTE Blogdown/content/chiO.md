---
title: Chi-Square Odds Ratios
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

odds(n11, n12, n21, n22, a) 

# Arguments 

+ n11	= sample size for level 1.1
+ n12	= sample size for level 1.2
+ n21	= sample size for level 2.1
+ n22	= sample size for level 2.2
+ a	= significance level

# Example  

A health psychologist was interested in the rates of anxiety in first generation and regular college students. They polled campus and found the following data:

|              | First Generation | Regular |
|--------------|------------------|---------|
| Low Anxiety  | 10               | 50      |
| High Anxiety | 20               | 15      |

# Function in R: 

odds(n11 = 10, n12 = 50, n21 = 20, n22 = 15, a = 0.05) 

# MOTE

## Screenshot

![Chi-Square Odds Screenshot](../images/chisqo.jpg)

## Effect Size:

This effect size is traditionally interpreted as like likelihood of group 1 to group 2. Therefore, an odds of 1 indicates they are equally likely. Odds less than 1 indicate that group 2 is more likely, and odds greater than 1 indicate that group 1 is more likely.

*Odds* = .15, 95% CI [-.80, 1.10]

## Interpretation: 

Your confidence interval does not include one, and therefore, you might conclude that this effect size is different from one.

## Summary Statistics: 

Not applicable.

## Test Statistic: 

Not applicable.

## Interpretation: 

Not applicable.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/fxNfIokgSTs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
