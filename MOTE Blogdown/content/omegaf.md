---
title: Omega - *F*
author: DOOM Lab
date: '2018-05-09'
slug: omegaf
url: /tests/omegaf.html
showDate: false
---

<script src="//yihui.name/js/math-code.js"></script>
<script async
src="//cdn.bootcss.com/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML">
</script>

# Description   

This function displays omega squared from ANOVA analyses and its non-central confidence interval based on the *F* distribution. These values are calculated directly from *F* statistics and can be used for between subjects and repeated measures designs. Remember if you have two or more IVs, these values are partial omega squared.

The formula for $\omega^2$ is: $$\frac{df_{model} \times (F_{model} - 1)}{df_{model} \times (F_{model} - 1) + N}$$

This value will be $\omega^2$ for one-way ANOVA designs and will be $\omega_p^2$ for multi-way ANOVA designs (i.e. with more than one IV). 


# R Function

omega.F(dfm, dfe, Fvalue, n, a = 0.05)

# Arguments 


+ dfm =	degrees of freedom for the model/IV/between
+ dfe =	degrees of freedom for the error/residual/within
+ Fvalue = F statistic
+ n =	full sample size
+ a =	significance level

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
