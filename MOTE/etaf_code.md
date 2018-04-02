---
title: "etaf_code"
author: "Erin Buchanan"
date: "March 23, 2018"
output: 
html_document:
 self_contained: no
---

The formula for $\eta^2$ is: $$\frac{df_{model} \times F_{model}} {df_{model} \times F_{model} + df_{error}}$$

This value will be $\eta^2$ when you use a one-way ANOVA and will be $\eta_p^2$ when you use a multi-way ANOVA (more than one IV).

The code to use MOTE in R is: 
 

 
<h2>eta.F</h2>  <h3>Description</h3>  <p>This function displays eta, r squared, ICCs from ANOVA analyses and their non-central confidence interval based on the F distribution. These values are calculated directly from F statistics and can be used  for between subjects and repeated measures designs. Remember if you have two or more IVs, these values are partial eta squared. </p>   <h3>Usage</h3>  <pre> eta.F(dfm, dfe, Fvalue, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>Fvalue</code></td> <td> <p>F statistic</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> eta.F(dfm = 2, dfe = 20, Fvalue = 5.7, a = .05) </pre>   </body></html> 
