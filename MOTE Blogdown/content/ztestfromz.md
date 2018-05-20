---
title: Z Test - Z
author: DOOM Lab
date: '2018-05-09'
slug: ztestz
url: /meandifferences/ztestz.html
showDate: false
---

<script src="//yihui.name/js/math-code.js"></script>
<script async
src="//cdn.bootcss.com/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

# Description   

This function displays d for z-scores when all you have is the z-statistics. The normoal confidence interval is also provided if you have sigma. If sigma is left blank, then you will not see a confidence interval.

The formula for d is: $$d = \frac{Z}{\sqrt(N)}$$
 
The formula for Z is: $$Z = \frac{M - \mu}{\sigma_M}$$

# R Function

d.z.z(z, sig = NA, n, a = 0.05)

# Arguments 

+ z = statistic
+ sig	= population standard deviation
+ n	= sample size
+ a =	significance level 

# Example  

A recent study suggested that students (N = 100) learning statistics improved their test scores with the use of visual aids (*Z* = 2.5, *SD* = 4). 

+ z = 2.5
+ sig	= 4
+ n	= 100
+ a =	.05

# Function in R: 

d.z.z(z = 2.5, sig = 4, n = 100, a = .05)

# MOTE

## Screenshot


## Effect Size:

Effect Size: *d* = 0.25, 95% CI [-7.59, 8.09]

## Interpretation: 

Your confidence interval does include zero, and therefore, you might conclude that this effect size is similar to zero.

## Summary Statistics: 

Not applicable.

## Test Statistic: 

*Z* = 2.50, *p* = .012

## Interpretation: 

Your *p*-value is less than the alpha value, and therefore, this test would be considered statistically significant.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/CyfOS7Ew-Hw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
