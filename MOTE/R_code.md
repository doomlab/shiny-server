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
 

 
<h2>r.correl</h2>  <h3>Description</h3>  <p>This function displays transformation from r to r2 to calculate the non-central confidence interval for r2 using the F distribution. </p>   <h3>Usage</h3>  <pre> r.correl(r, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>r</code></td> <td> <p>correlation coefficient</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> r.correl(r = .5, n = 100, a = .05) </pre>   </body></html> 
