---
title: "omegaSSbn_page"
author: "Gillenwaters"
date: "3/23/2018"
output: 
html_document:
 self_contained: no
---
The formula for $\omega_p^2$ is: $$\frac{df_{model} \times (MS_{model} - MS_{error})}{SS_{model} + (N - df_{model}) \times MS_{error}}$$

The formula for *F* is: $$\frac{MS_{model}}{MS_{error}}$$

The code to use MOTE in R is: 
 

 
<h2>omega.partial.SS.bn</h2>  <h3>Description</h3>  <p>This function displays omega squared from ANOVA analyses and its non-central confidence interval based on the F distribution. This formula is appropriate for multi-way between subjects designs. </p>   <h3>Usage</h3>  <pre> omega.partial.SS.bn(dfm, dfe, msm, mse, ssm, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>msm</code></td> <td> <p>mean square for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>mse</code></td> <td> <p>mean square for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>ssm</code></td> <td> <p>sum of squares for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>total sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> omega.partial.SS.bn(dfm = 2, dfe = 100, msm = 214, mse = 100, ssm = 5339, n = 150, a = .05) </pre>   </body></html> 
