---
title: Partial Eta Squared for ANOVA from F and Sum of Squares
author: DOOM Lab
date: '2018-05-09'
slug: etapss
url: /tests/etapss.html
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

The formula for $\eta\_p^2$ is: $$\frac{SS\_{model}} {SS\_{model} + SS\_{error}}$$

# R Function

eta.partial.SS(dfm, dfe, ssm, sse, Fvalue, a)

# Arguments 

+ dfm = degrees of freedom for the model/IV/between   
+ dfe = degrees of freedom for the error/residual/within 
+ ssm = sum of squares for the model/IV/between
+ sse = sum of squares for the error/residual/within
+ Fvalue = F statistic   
+ a	= significance level

# Example  

We looked at two year’s worth of athletic spending data (treating each receipt and years as separate between subjects’ events) for four different sports. Are there differences across sports and years in spending? The data are available on [GitHub](https://github.com/doomlab/shiny-server/tree/master/MOTE/examples). Example output from JASP, SPSS, and SAS are shown below.

**JASP**
![Between Subjects Two Way ANOVA JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/bn%202%20anova%20JASP.png)

**SPSS**
![Between Subjects Two Way ANOVA SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/bn%202%20anova%20SPSS.png)

**SAS**
![Between Subjects Two Way ANOVA SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/bn%202%20anova%20SAS.PNG)

# Function in R: 

eta.partial.SS(dfm = 1, dfe = 18250, ssm = 1675682.823, sse = 620442270.8, Fvalue = 49.289, a = .05)

# MOTE

## Screenshot

![Eta Partial SS Screenshot](../images/etapartialss.jpg)

## Effect Size:

$\eta\_p^2$ = .00, 95% CI [.00, .00]

## Interpretation: 

Your confidence interval does not include zero, and therefore, you might conclude that this effect size is different from zero.

## Summary Statistics: 

Not applicable. 

## Test Statistic: 

*F*(1, 18250) = 49.29, *p* < .001

## Interpretation: 

Your *p*-value is less than the alpha value, and therefore, this test would be considered statistically significant.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/qVeBv2yqVTM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
