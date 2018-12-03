---
title: "epsilon"
author: "Amber Gillenwaters"
date: "March 23, 2018"
output: 
html_document:
 self_contained: no
---

The formula for $\epsilon^2$ is: $$\frac{df_{model} \times (MS_{model} - MS_{error})} {SS_{total}}$$

The formula for *F* is: $$\frac{MS_{model}}{MS_{error}}$$

The code to use MOTE in R is: 
 

 
<h2>Epsilon for ANOVA from F and Sum of Squares</h2>  <h3>Description</h3>  <p>This function displays epsilon squared from ANOVA analyses and its non-central confidence interval based on the F distribution. This formula works for one way and multi way designs with careful focus on the sum of squares total calculation. </p>   <h3>Usage</h3>  <pre> epsilon.full.SS(dfm, dfe, msm, mse, sst, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>msm</code></td> <td> <p>mean square for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>mse</code></td> <td> <p>mean square for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>sst</code></td> <td> <p>sum of squares total</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>To calculate epsilon, first, the mean square for the error is substracted from the mean square for the model. The difference is multiplied by the degrees of freedom for the model. The product is divided by the sum of squares total. </p> <p>epsilon = (dfm * (msm - mse)) / (sst) </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/epsilon.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>Provides the effect size (Cohen's d) with associated confidence intervals, the t-statistic, the confidence intervals associated with the means of each group, as well as the standard deviations and standard errors of the means for each group. </p> <table summary="R valueblock"> <tr valign="top"><td><code>epsilon</code></td> <td> <p>effect size</p> </td></tr> <tr valign="top"><td><code>epsilonlow</code></td> <td> <p>lower level confidence interval of epsilon</p> </td></tr> <tr valign="top"><td><code>epsilonhigh</code></td> <td> <p>upper level confidence interval of epsilon</p> </td></tr> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/resisual/within</p> </td></tr> <tr valign="top"><td><code>F</code></td> <td> <p>F-statistic</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> </table>   <h3>Examples</h3>  <pre> epsilon.full.SS(dfm = 2, dfe = 100, msm = 214, mse = 100, sst = 5339, a = .05) </pre>   </body></html> 
