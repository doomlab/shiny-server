---
title: "etaf_code"
author: "Erin Buchanan"
date: "March 23, 2018"
output: 
html_document:
 self_contained: no
---

The formula for $\eta^2$ is: $$\frac{SS_{model}} {SS_{total}}$$

The code to use MOTE in R is: 
 

 
<h2>eta.full.SS</h2>  <h3>Description</h3>  <p>This function displays eta squared from ANOVA analyses and its non-central confidence interval based on the F distribution. This formula works for one way and multi way designs with careful focus on the sum of squares total. </p>   <h3>Usage</h3>  <pre> eta.full.SS(dfm, dfe, ssm, sst, Fvalue, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>ssm</code></td> <td> <p>sum of squares for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>sst</code></td> <td> <p>sum of squares total</p> </td></tr> <tr valign="top"><td><code>Fvalue</code></td> <td> <p>F statistic</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> eta.full.SS(dfm = 2, dfe = 100, ssm = 435, sst = 659, Fvalue = 5.46, a = .05) </pre>   </body></html> 
