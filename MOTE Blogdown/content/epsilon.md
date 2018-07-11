---
title: Epsilon
author: DOOM Lab
date: '2018-05-09'
slug: epsilon
url: /tests/epsilon.html
showDate: false
---

<script src="//yihui.name/js/math-code.js"></script>
<script async
src="//cdn.bootcss.com/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

# Description   

This function displays epsilon squared from ANOVA analyses and its non-central confidence interval based on the F distribution. This formula works for one way and multi way designs with careful focus on the sum of squares total calculation.

The formula for $\epsilon\^2$ is: $$\frac{df\_{model} \times (MS\_{model} - MS\_{error})} {SS\_{total}}$$

The formula for *F* is: $$\frac{MS\_{model}}{MS\_{error}}$$

# R Function

epsilon.full.SS(dfm, dfe, msm, mse, sst, a = 0.05)

# Arguments 

+ dfm	= degrees of freedom for the model/IV/between
+ dfe	= degrees of freedom for the error/residual/within
+ msm = mean square for the model/IV/between
+ mse =	mean square for the error/residual/within
+ sst	= sum of squares total
+ a	= significance level

# Example  

INCLUDE AN EXAMPLE FROM 527

INCLUDE THE NUMBERS FOR THE ARGUMENT LISTED OUT 

# Function in R: 

INCLUDE THE FUNCTION HOW YOU WOULD WRITE IT IN R

# MOTE

## Screenshot

![Z-Test Means Screenshot](../images/z-test-means-screen.png)

## Effect Size:

INCLUDE THE OUTPUT FROM MOTE

## Interpretation: 

INCLUDE INTERPRETATION FROM MOTE

## Summary Statistics: 

INCLUDE SUMMARY STATISTICS FROM MOTE

## Test Statistic: 

INCLUDE TEST STATISTICS FROM MOTE

## Interpretation: 

INCLUDE INTERPRETATION FROM MOTE

# Tutorial

ONLY CHANGE THE NUMBERS/LETTERS AFTER EMBED HERE. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/CyfOS7Ew-Hw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
