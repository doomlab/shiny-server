---
title: "etaf_code"
author: "Erin Buchanan"
date: "March 23, 2018"
output: 
html_document:
 self_contained: no
---

The formula for $\eta_p^2$ is: $$\frac{SS_{model}} {SS_{model} + SS_{error}}$$

The code to use MOTE in R is: 
 

 
<h2>Partial Eta Squared for ANOVA from F and Sum of Squares</h2>  <h3>Description</h3>  <p>This function displays partial eta squared from ANOVA analyses and its non-central confidence interval based on the F distribution. This formula works for one way and multi way designs. </p>   <h3>Usage</h3>  <pre> eta.partial.SS(dfm, dfe, ssm, sse, Fvalue, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>ssm</code></td> <td> <p>sum of squares for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>sse</code></td> <td> <p>sum of squares for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>Fvalue</code></td> <td> <p>F statistic</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>Partial eta squared is calculated by dividing the sum of squares of the model by the sum of the sum of squares of the model and sum of squares of the error. </p> <p>partial eta squared = ssm / (ssm + sse) </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/etapss.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>Provides partial eta squared with associated confidence intervals and relevant statistics. </p> <table summary="R valueblock"> <tr valign="top"><td><code>eta</code></td> <td> <p>partial eta squared effect size</p> </td></tr> <tr valign="top"><td><code>etalow</code></td> <td> <p>lower level confidence interval of partial eta squared</p> </td></tr> <tr valign="top"><td><code>etahigh</code></td> <td> <p>upper level confidence interval of partial eta squared</p> </td></tr> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/resisual/within</p> </td></tr> <tr valign="top"><td><code>F</code></td> <td> <p>F-statistic</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> </table>   <h3>Examples</h3>  <pre> eta.partial.SS(dfm = 2, dfe = 100, ssm = 435, sse = 659, Fvalue = 5.46, a = .05) </pre>   </body></html> 
