---
title: Omega Squared for ANOVA from F
author: DOOM Lab
date: '2018-05-09'
slug: omegaf
url: /tests/omegaf.html
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

This function displays omega squared from ANOVA analyses and its non-central confidence interval based on the *F* distribution. These values are calculated directly from *F* statistics and can be used for between subjects and repeated measures designs. Remember if you have two or more IVs, these values are partial omega squared.

The formula for $\omega^2$ is: $$\frac{df\_{model} \times (F\_{model} - 1)}{df\_{model} \times (F\_{model} - 1) + N}$$

This value will be $\omega^2$ for one-way ANOVA designs and will be $\omega_p^2$ for multi-way ANOVA designs (i.e. with more than one IV). 


# R Function

omega.F(dfm, dfe, Fvalue, n, a = .05)

# Arguments 

+ dfm =	degrees of freedom for the model/IV/between
+ dfe =	degrees of freedom for the error/residual/within
+ Fvalue = F statistic
+ n =	full sample size
+ a =	significance level

# Example  

Participants were tested over several days to measure variations in their pulse given different types of stimuli. One stimulus was a neutral picture (like a toaster), while other stimuli were cute/happy pictures (puppies, babies), and negative stimuli (mutilated faces, pictures of war). Were there differences in pulse for each participant across the stimuli? The data are available on [GitHub](https://github.com/doomlab/shiny-server/tree/master/MOTE/examples). Example output from JASP, SPSS, and SAS are shown below.

**JASP**
![One-Way Repeated Measures ANOVA JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/rm%201%20anova%20JASP.png)

**SPSS**
![One-Way Repeated Measures ANOVA SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/rm%201%20anova%20SPSS.png)

**SAS**
![One-Way Repeated Measures ANOVA SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/rm%201%20anova%20SAS.PNG)

# Function in R: 

omega.F(dfm = 2, dfe = 34, Fvalue = 253.273, n = 40, a = .05)

# MOTE

## Screenshot

![Omega-F Screenshot](../images/omegaf.jpg)

## Effect Size:

$\omega^2$ = .93, 95% CI [.85, .96]

## Interpretation: 

Your confidence interval does not include zero, and therefore, you might conclude that this effect size is different from zero.

## Summary Statistics: 

Not applicable. 

## Test Statistic: 

*F*(2, 34) = 253.27, *p* < .001

## Interpretation: 

Your p-value is less than the alpha value, and therefore, this test would be considered statistically significant.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/40XnVCphLFA" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
