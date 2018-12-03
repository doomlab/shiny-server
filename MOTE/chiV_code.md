---
title: "chiV_code"
author: "Gillenwaters"
date: "3/23/2018"
output: 
html_document:
 self_contained: no
---

The formula for *V* is: $$\sqrt{ \frac{\chi^2} {N \times df_{smaller}} } $$

$df_{smaller}$ is defined by the minimum of (rows - 1) or (columns - 1). 

The code to use MOTE in R is: 
 

 
<h2>V for Chi-Square</h2>  <h3>Description</h3>  <p>This function displays V and non-central confidence interval for the specified chi-square statistic. </p>   <h3>Usage</h3>  <pre> v.chi.sq(x2, n, r, c, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>x2</code></td> <td> <p>chi-square statistic</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>r</code></td> <td> <p>number of rows in the contingency table</p> </td></tr> <tr valign="top"><td><code>c</code></td> <td> <p>number of columns in the contingency table</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>V is calculated by finding the square root of chi-squared divided by the product of the sample size and the degrees of freedom with the lowest value. </p> <p>v = sqrt(x2 / (n * dfsmall)) </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/chiv.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>Provides V with associated confidence intervals and relevant statistics. </p> <table summary="R valueblock"> <tr valign="top"><td><code>v</code></td> <td> <p>v-statistic</p> </td></tr> <tr valign="top"><td><code>vlow</code></td> <td> <p>lower level confidence interval of omega</p> </td></tr> <tr valign="top"><td><code>vhigh</code></td> <td> <p>upper level confidence interval of omega</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>df</code></td> <td> <p>degrees of freedom</p> </td></tr> <tr valign="top"><td><code>x2</code></td> <td> <p>significance statistic</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> </table>   <h3>Examples</h3>  <pre> v.chi.sq(x2 = 4, n = 25, r = 2, c = 2, a = .05) </pre>   </body></html> 
