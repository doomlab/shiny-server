---
title: Generalized Eta Squared Partial Repeated Measures SS
author: DOOM Lab
date: '2018-05-09'
slug: gesrmss
url: /tests/gesrmss.html
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

The formula for $\eta\_G^2$ is: $$\frac{SS\_{model}}{SS\_{model} + SS\_{subject} + SS\_{errorA} + SS\_{errorB} + SS\_{errorAxB}}$$

The labels A and B here indicate the two IVs in a two-way design. AxB indicates the interaction term for A by B. This formula does not cover more than two-way designs.

# R Function

ges.partial.SS.rm(dfm, dfe, ssm, sss, sse1, sse2, sse3, Fvalue, a = 0.05)

# Arguments 

+ dfm = degrees of freedom for the model/IV/between   
+ dfe = degrees of freedom for the error/residual/within 
+ ssm = sum of squares subject variance
+ sse1 = sum of squares for the error/residual/within for the first IV
+ sse2 = sum of squares for the error/residual/within for the second IV
+ sse3 = sum of squares for the error/residual/within for the interaction
+ Fvalue = F statistic   
+ a	= significance level

# Example  

In this experiment people were given word pairs to rate based on their “relatedness”. How many people out of a 100 would put LOST-FOUND together? Participants were given pairs of words and asked to rate them on how often they thought 100 people would give the second word if shown the first word.  The strength of the word pairs was manipulated through the actual rating (forward strength: FSG) and the strength of the reverse rating (backward strength: BSG). Is there an interaction between FSG and BSG when participants are estimating the relation between word pairs?

+ dfm = 2  
+ dfe = 100
+ ssm = 435
+ sss = 659
+ sse1 = 435
+ sse2 = 446
+ sse3 = 546
+ Fvalue = 5.46   
+ a	= .05

**JASP**
![Repeated Measures Two-Way ANOVA JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/rm%202%20ANOVA%20JASP.png)

**SPSS**
![Repeated Measures Two-Way ANOVA SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/rm%202%20anova%20SPSS.png)

**SAS**
![Repeated Measures Two-Way ANOVA SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/rm%202%20anova%20SAS.PNG)

# Function in R: 

ges.partial.SS.rm(dfm = 2, dfe = 100, ssm = 435, sss = 659, sse1 = 435, sse2 = 446, sse3 = 546, Fvalue = 5.46, a = .05)

# MOTE

## Screenshot

![Repeated Measures One-Way ANOVA Screenshot](../images/anovarm2.jpg)

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

<iframe width="560" height="315" src="https://www.youtube.com/embed/Y1piNdNdMbc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
