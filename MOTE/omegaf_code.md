---
title: "omegaf_page"
author: "Erin Buchanan"
date: "3/23/2018"
output: 
html_document:
 self_contained: no
---

The formula for $\omega^2$ is: $$\frac{df_{model} \times (F_{model} - 1)}{df_{model} \times (F_{model} - 1) + N}$$

This value will be $\omega^2$ for one-way ANOVA designs and will be $\omega_p^2$ for multi-way ANOVA designs (i.e. with more than one IV). 

The code to use MOTE in R is: 
 

 
<h2>omega.F</h2>  <h3>Description</h3>  <p>This function displays omega squared from ANOVA analyses and its non-central confidence interval based on the F distribution. These values are calculated directly from F statistics and can be used  for between subjects and repeated measures designs. Remember if you have two or more IVs, these values are partial omega squared. </p>   <h3>Usage</h3>  <pre> omega.F(dfm, dfe, Fvalue, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>Fvalue</code></td> <td> <p>F statistic</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>full sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> omega.F(dfm = 2, dfe = 97, Fvalue = 5.7, n = 100, a = .05) </pre>   </body></html> 
