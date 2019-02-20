---
title: Partial Generalized Eta-Squared for Mixed Design ANOVA from F
author: DOOM Lab
date: '2018-05-09'
slug: gesmixss
url: /tests/gesmixss.html
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

The formula for $\eta\_G^2$ is: $$\frac{SS\_{model}}{SS\_{model} + SS\_{subject} + SS\_{error}}$$

# R Function

ges.partial.SS.mix(dfm, dfe, ssm, sss, sse, Fvalue, a = 0.05)

# Arguments 

+ dfm = degrees of freedom for the model/IV/between   
+ dfe = degrees of freedom for the error/residual/within 
+ ssm = sum of squares for the model/IV/between
+ sss = sum of squares subject variance
+ sse = sum of squares for the error/residual/within
+ Fvalue = F statistic   
+ a	= significance level

# Example  

Given previous research, we know that backward strength in free association tends to increase the ratings participants give when you ask them how many people out of 100 would say a word in response to a target word (like Family Feud). This result is tied to people’s overestimation of how well they think they know something, which is bad for studying. So, we gave people instructions on how to ignore the BSG.  Did it help? Is there an interaction between BSG and instructions given? The data are available on [GitHub](https://github.com/doomlab/shiny-server/tree/master/MOTE/examples). Example output from JASP, SPSS, and SAS are shown below.

**JASP**
![Two Way Mixed ANOVA JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/mix%202%20anova%20JASP.png)

**SPSS**
![Two Way Mixed ANOVA SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/mix%202%20anova%20SPSS.png)

**SAS**
![Two Way Mixed ANOVA SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/mix%202%20anova%20SAS.PNG)

# Function in R: 

ges.partial.SS.mix(dfm = 1, dfe = 156, ssm = 50860.89, sss = 64251, sse = 8301.74, Fvalue = 955.740, a = .05)

# MOTE

## Screenshot

![GES Partial Mixed SS Screenshot](../images/gespartmixss.jpg)

## Effect Size:

$\eta\_G^2$ = .41, 95% CI [.29, .52]

## Interpretation: 

Your confidence interval does not include zero, and therefore, you might conclude that this effect size is different from zero.

## Summary Statistics: 

Not applicable. 

## Test Statistic: 

*F*(1, 156) = 955.74, *p* < .001

## Interpretation: 

Your *p*-value is less than the alpha value, and therefore, this test would be considered statistically significant.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/Y1piNdNdMbc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
