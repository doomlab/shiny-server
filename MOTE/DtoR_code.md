---
title: "DtoR"
author: "Amber Gillenwaters"
date: "March 23, 2018"
output: 
html_document:
 self_contained: no
---
The formula for *r* is: $$r = \frac{d} {\sqrt{d^2 + (n1 + n2)^2/(n1 \times n2)}}$$

The formula for *t* is: $$t = \frac{r}{\sqrt{1-(r^2)^2/(n -2)}}$$

The formula for *F* is: $$\frac{MS_{model}}{MS_{error}}$$

The code to use MOTE in R is: 
 

 
<h2>d.to.r</h2>  <h3>Description</h3>  <p>Calculates r from d and then translates r to r2 to calculate the non-central confidence interval for r2 using the F distribution. </p>   <h3>Usage</h3>  <pre> d.to.r(d, n1, n2, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>d</code></td> <td> <p>effect size statistic</p> </td></tr> <tr valign="top"><td><code>n1</code></td> <td> <p>sample size group one</p> </td></tr> <tr valign="top"><td><code>n2</code></td> <td> <p>sample size group two</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> d.to.r(d = .5, n1 = 50, n2 = 50, a = .05) </pre>   </body></html> 
