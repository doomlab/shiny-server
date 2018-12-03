---
title: "gesmix_page"
author: "Amber Gillenwaters"
date: "March 23, 2018"
output: 
html_document:
 self_contained: no
---


The formula for $\eta_G^2$ is: $$\frac{SS_{model}}{SS_{model} + SS_{subject} + SS_{error}}$$

The code to use MOTE in R is: 
 

 
<h2>Partial Generalized Eta-Squared for Mixed Design ANOVA from F</h2>  <h3>Description</h3>  <p>This function displays partial generalized eta-squared (GES) from ANOVA analyses and its non-central confidence interval based on the F distribution. This formula works for mixed designs. </p>   <h3>Usage</h3>  <pre> ges.partial.SS.mix(dfm, dfe, ssm, sss, sse, Fvalue, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>ssm</code></td> <td> <p>sum of squares for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>sss</code></td> <td> <p>sum of squares subject variance</p> </td></tr> <tr valign="top"><td><code>sse</code></td> <td> <p>sum of squares for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>Fvalue</code></td> <td> <p>F statistic</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>To calculate partial generalized eta squared, first, the sum of squares of the model, sum of squares of the subject variance, sum of squares for the subject variance, and the sum of squares for the error/residual/within are added together. The sum of squares of the model is divided by this value. </p> <p>partial ges = ssm / (ssm + sss + sse) </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/gesmixss.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>Partial generalized eta-squared (GES) with associated confidence intervals and relevant statistics. </p> <table summary="R valueblock"> <tr valign="top"><td><code>ges</code></td> <td> <p>effect size</p> </td></tr> <tr valign="top"><td><code>geslow</code></td> <td> <p>lower level confidence interval for ges</p> </td></tr> <tr valign="top"><td><code>geshigh</code></td> <td> <p>upper level confidence interval for ges</p> </td></tr> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>F</code></td> <td> <p>F-statistic</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> </table>   <h3>Examples</h3>  <pre> ges.partial.SS.mix(dfm = 2, dfe = 100, ssm = 435, sss = 235, sse = 659, Fvalue = 5.46, a = .05) </pre>   </body></html> 
