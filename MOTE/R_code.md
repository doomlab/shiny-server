---
title: "R_code"
author: "Gillenwaters"
date: "3/23/2018"
output: 
html_document:
 self_contained: no
---

The formula for *t* is: $$t = \frac{r}{\sqrt{ \frac{1-r^2} {(N - 2)}}}$$

The code to use MOTE in R is: 
 

 
<h2>r to Coefficient of Determination (R2) from F</h2>  <h3>Description</h3>  <p>This function displays transformation from r to r2 to calculate the non-central confidence interval for r2 using the F distribution. </p>   <h3>Usage</h3>  <pre> r.correl(r, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>r</code></td> <td> <p>correlation coefficient</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>The t-statistic is calculated by first dividing one minus the square root of r squared by degrees of freedom of the error. r is divided by this value. </p> <p>t = r / sqrt((1 - rsq) / (n - 2)) </p> <p>The F-statistic is the t-statistic squared. </p> <p>Fvalue = t ^ 2 </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/rcorrel.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>Provides correlation coefficient and coefficient of determination with associated confidence intervals and relevant statistics. </p> <table summary="R valueblock"> <tr valign="top"><td><code>r</code></td> <td> <p>correlation coefficient</p> </td></tr> <tr valign="top"><td><code>rlow</code></td> <td> <p>lower level confidence interval r</p> </td></tr> <tr valign="top"><td><code>rhigh</code></td> <td> <p>upper level confidence interval r</p> </td></tr> <tr valign="top"><td><code>R2</code></td> <td> <p>coefficient of determination</p> </td></tr> <tr valign="top"><td><code>R2low</code></td> <td> <p>lower level confidence interval of R2</p> </td></tr> <tr valign="top"><td><code>R2high</code></td> <td> <p>upper level confidence interval of R2</p> </td></tr> <tr valign="top"><td><code>se</code></td> <td> <p>standard error</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom of mean</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom of error</p> </td></tr> <tr valign="top"><td><code>t</code></td> <td> <p>t-statistic</p> </td></tr> <tr valign="top"><td><code>F</code></td> <td> <p>F-statistic</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> </table>   <h3>Examples</h3>  <pre> r.correl(r = .5, n = 100, a = .05) </pre>   </body></html> 
