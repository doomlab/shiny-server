---
title: Z Test - Means
author: DOOM Lab
date: '2018-05-09'
slug: ztestmeans
url: /meandifferences/ztestmeans/
showDate: false
showMeta: false
showActions: false
showTags: false
---

<!--more-->
<!-- toc -->

# Description   
This function displays d for z-scores with the population mean and standard deviation. The normal confidence interval is also provided. 

The formula for d is: $$d = \frac{M - \mu}{\sigma}$$

The formula for Z is: \\Z = \frac{M - \mu}{\sigma_M}\\]

# Arguments 

+ mu = population mean  
+ m1 = sample study mean  
+ sig = population standard deviation  
+ sd1 = standard deviation from the study  
+ n = sample size  
+ a = significance level  

# Example  
The average quiz test taking time (population mean) for a 10 item test is 22.5 minutes, with a standard deviation of 10 minutes. My class of 25 students took 19 minutes on the test (sample study mean) with a standard deviation of 5. 

## Effect Size:   
*d* = -0.35, 95% CI [-19.95, 19.25]

## Interpretation: 
Your confidence interval does include zero, and therefore, you might conclude that this effect size is similar to zero.

## Summary Statistics: 
*M* = 19.00, *SD* = 5.00, *SE* = 1.00, 95% CI [17.04, 20.96]

## Test Statistic: 
*Z* = -1.75, *p* = .080

## Interpretation: 

Your p-value is greater than the alpha value, and therefore, this test would be considered not statistically significant.

# Function in R: 
d.z.mean(mu = 22.5, m1 = 19, sig = 4, sd1 = 5, n = 25, a = .05)

[Stats Tools Z-Test Means Tutorial](https://youtu.be/CyfOS7Ew-Hw)
