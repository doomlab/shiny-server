---
title: "gesSSrm_page"
author: "Erin Buchanan"
date: "March 23, 2018"
output: 
html_document:
 self_contained: no
---


The formula for $\eta_G^2$ is: $$\frac{SS_{model}}{SS_{model} + SS_{subject} + SS_{errorA} + SS_{errorB} + SS_{errorAxB}}$$

The labels A and B here indicate the two IVs in a two-way design. AxB indicates the interaction term for A by B. This formula does not cover more than two-way designs.

The code to use MOTE in R is: 
 

 
<h2>ges.partial.SS.rm</h2>  <h3>Description</h3>  <p>This function displays partial ges squared from ANOVA analyses and its non-central confidence interval based on the F distribution. This formula works for multi-way repeated measures designs. </p>   <h3>Usage</h3>  <pre> ges.partial.SS.rm(dfm, dfe, ssm, sss, sse1, sse2, sse3, Fvalue, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>ssm</code></td> <td> <p>sum of squares for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>sss</code></td> <td> <p>sum of squares subject variance</p> </td></tr> <tr valign="top"><td><code>sse1</code></td> <td> <p>sum of squares for the error/residual/within for the first IV</p> </td></tr> <tr valign="top"><td><code>sse2</code></td> <td> <p>sum of squares for the error/residual/within for the second IV</p> </td></tr> <tr valign="top"><td><code>sse3</code></td> <td> <p>sum of squares for the error/residual/within for the interaction</p> </td></tr> <tr valign="top"><td><code>Fvalue</code></td> <td> <p>F statistic</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> ges.partial.SS.rm(dfm = 2, dfe = 100, ssm = 435, sss = 659, sse1 = 435, sse2 = 446, sse3 = 546, Fvalue = 5.46, a = .05) </pre>   </body></html> 
