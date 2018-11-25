---
title: Omega Partial RM - SS
author: DOOM Lab
date: '2018-05-09'
slug: omegaprmss
url: /tests/omegaprmss.html
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

The formula for $\omega\_p^2$ is: $$\frac{df\_{model} \times (MS\_{model} - MS\_{error})}{SS\_{model} + (N - df\_{model}) \times MS\_{error}}$$

The formula for *F* is: $$\frac{MS\_{model}}{MS\_{error}}$$

# R Function

omega.partial.SS.rm(dfm, dfe, msm, mse, ssm, sse, sss, a = 0.05)

# Arguments 

+ dfm = degrees of freedom for the model/IV/between   
+ dfe = degrees of freedom for the error/residual/within 
+ msm = mean square for the model/IV/between
+ mse = mean square for the error/residual/within
+ mss = mean square for the subject variance
+ ssm = sum of squares for the model/IV/between
+ sse = sum of squares for the error/residual/within
+ sss = sum of squares subject variance
+ a	= significance level

# Example  

Participants were tested over several days to measure variations in their pulse given different types of stimuli. One stimulus was a neutral picture (like a toaster), while other stimuli were cute/happy pictures (puppies, babies), and negative stimuli (mutilated faces, pictures of war). Were there differences in pulse for each participant across the stimuli? 

+ dfm = 2  
+ dfe = 34
+ msm = 18786.06
+ mse = 74.17
+ mss = 37572
+ ssm = 23369
+ sse = 2522
+ sss = 53  
+ a	= .05

**JASP**
![Repeated Measures One-Way ANOVA JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/rm%201%20anova%20JASP.png)

**SPSS**
![Repeated Measures One-Way ANOVA SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/rm%201%20anova%20SPSS.png)

**SAS**
![Repeated Measures One-Way ANOVA SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/rm%201%20anova%20SAS.PNG)

# Function in R: 

omega.partial.SS.rm(dfm = 2, dfe = 34, msm = 18786.06, mse = 74.17, mss = 1375, ssm = 37572, sse = 2522, sss = 23369, a = .05)

# MOTE

## Screenshot

![Repeated Measures One-Way ANOVA Screenshot](../images/anovarm.jpg)

## Effect Size:

$$\eta^2$$ = .56, 95% CI [.00, .83]

## Interpretation: 

Your confidence interval does include zero, and therefore, you might conclude that this effect size is similar to zero.

## Summary Statistics: 

Not applicable. 

## Test Statistic: 

*F*(2, 8) = 5.13, *p* = .037

## Interpretation: 

Your *p*-value is less than the alpha value, and therefore, this test would be considered statistically significant.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/40XnVCphLFA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
