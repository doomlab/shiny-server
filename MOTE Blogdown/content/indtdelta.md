---
title: Independent t Delta - Means
author: DOOM Lab
date: '2018-05-09'
slug: indtdelta
url: /tests/indtdelta.html
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

This function displays $d\_{delta}$ for between subjects data and the non-central confidence interval using the control group standard deviation as the denominator.

The formula for $d\_{delta}$ is $$d\_{delta} = {M\_{control} - M\_{exp}\over SD\_{control}}$$

The formula for *t* is $$t = {M\_{control} - M\_{exp}\over SE\_{pooled}}$$

# R Function

delta.ind.t(m1, m2, sd1, sd2, n1, n2, a = 0.05)

# Arguments 

+ m1 = mean from control group
+ m2 = mean from experimental group
+ sd1	= standard deviation from control group
+ sd2	= standard deviation from experimental group
+ n1	= sample size from control group
+ n2 = sample size from experimental group
+ a	= significance level

# Information Provided

Provides the effect size (Cohen's *d_delta*) with associated confidence intervals, the *t*-statistic, the confidence intervals associated with the means of each group, as well as the standard deviations and standard errors of the means for each group.

+ d	= d-delta effect size
+ dlow = lower level confidence interval of d-delta value
+ dhigh	= upper level confidence interval of d-delta value
+ M1 = mean of group one
+ sd1 = standard deviation of group one mean
+ se1	= standard error of group one mean
+ M1low	= lower level confidence interval of group one mean
+ M1high = upper level confidence interval of group one mean
+ M2 = mean of group two
+ sd2	= standard deviation of group two mean
+ se2	= standard error of group two mean
+ M2low	= lower level confidence interval of group two mean
+ M2high = upper level confidence interval of group two mean
+ spooled	= pooled standard deviation
+ sepooled = pooled standard error
+ n1 = sample size of group one
+ n2 = sample size of group two
+ df = degrees of freedom (n1 - 1 + n2 - 1)
+ t = t-statistic
+ p	= p-value

# Example  

A forensic psychologist conducted a study to examine whether being hypnotized during recall affects how well a witness can remember facts about an event. Eight participants watched a short film of a mock robbery, after which each participant was questioned about what he or she had seen. The four participants in the experimental group were questioned while they were hypnotized, and had an average score of 17.75 with a standard deviation of 3.304. The four participants in the control group recieved the same questioning without hypnosis, and recieved an average score of 23 with a standard deviation of 2.160. The data is included at [GitHub](https://github.com/doomlab/shiny-server/tree/master/MOTE/examples). Example output from JASP, SPSS, and SAS are shown below.

**JASP**
![Independent t JASP](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/independent%20t%20JASP.png)

**SPSS**
![Independent t SPSS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/independent%20t%20SPSS.png)

**SAS**
![Independent t SAS](https://raw.githubusercontent.com/doomlab/shiny-server/master/MOTE/examples/independent%20t%20SAS.PNG)

# Example Arguments

+ m1 = 17.75
+ m2 = 23.00
+ sd1	= 3.304
+ sd2	= 2.160
+ n1	= 4
+ n2 = 4
+ a	= .05

# Function in R: 

delta.ind.t(m1 = 17.75, m2 = 23.00, sd1 = 3.304, sd2 = 2.160, n1 = 4, n2 = 4, a = .05)

# MOTE

## Screenshot

![Independent t Delta - Means Screenshot](../images/indtdeltameans.jpg)

## Effect Size:

$d\_{delta}$ = -1.59, 95% CI [-3.57, -0.10]

## Interpretation: 

Your confidence interval does not include zero, and therefore, you might conclude that this effect size is different from zero.

## Summary Statistics: 

Control Group Summary Statistics: M = 17.75, SD = 3.30, SE = 1.65, 95% CI [12.49, 23.01]

Experimental Group Summary Statistics: M = 23.00, SD = 2.16, SE = 1.08, 95% CI [19.56, 26.44]

## Test Statistic: 

*t*(6) = -2.66, *p* = .038

## Interpretation: 

Your p-value is less than the alpha value, and therefore, this test would be considered statistically significant.

# Sample Writeup

Contrary to the hypothesized result, the group that underwent hypnosis was significantly less accurate while reporting facts than the control group with a large effect size, *t(6)* = -2.66, *p* = .038, $d\_{delta}$ = 1.59.

# Tutorial

<iframe width="560" height="315" src="https://www.youtube.com/embed/kH3UOoFh9Ng" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
