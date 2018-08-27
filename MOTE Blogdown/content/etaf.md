---
title: Eta - F
author: DOOM Lab
date: '2018-05-09'
slug: etaf
url: /tests/etaf.html
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

The formula for $\eta^{2}$ is: $${df\_{model} \times F\_{model}\over df\_{model} \times F\_{model} + df\_{error}}$$

This value will be $\eta^{2}$ when you use a one-way ANOVA and will be $\eta\_{p}^{2}$ when you use a multi-way ANOVA (more than one IV).

# R Function

eta.F(dfm, dfe, Fvalue, a = 0.05)

# Arguments 

+ dfm = degrees of freedom for the model/IV/between   
+ dfe = degrees of freedom for the error/residual/within   
+ Fvalue	= F statistic   
+ a	= significance level

# Example  

NEEDS EXAMPLE

+ dfm = degrees of freedom for the model/IV/between   
+ dfe = degrees of freedom for the error/residual/within   
+ Fvalue	= F statistic   
+ a	= significance level

**JASP**
![Independent t JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/independent%20t%20JASP.png)

**SPSS**
![Independent t SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/independent%20t%20SPSS.png)

**SAS**
![Independent t SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/independent%20t%20SAS.PNG)

# Function in R: 

eta.F(dfm = 2, dfe = 8, Fvalue = 5.134, a = 0.05)

# MOTE

## Screenshot

![Z-Test Means Screenshot](../images/z-test-means-screen.png)

## Effect Size:

$$\eta^2$$ = .56, 95% CI [.00, .83]

## Interpretation: 

Your confidence interval does include zero, and therefore, you might conclude that this effect size is similar to zero.

## Summary Statistics: 

Not applicable. 

## Test Statistic: 

*F*(2, 8) = 5.13, *p* = .037

## Interpretation: 

Your p-value is less than the alpha value, and therefore, this test would be considered statistically significant.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/40XnVCphLFA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
