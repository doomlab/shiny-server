---
title: "chiV_code"
author: "Gillenwaters"
date: "3/23/2018"
output: 
html_document:
 self_contained: no
---

The code to use MOTE in R is: 
 

 
<h2>v.chi.sq</h2>  <h3>Description</h3>  <p>This function displays V and non-central confidence interval  for the specified chi-square statistic. </p>   <h3>Usage</h3>  <pre> v.chi.sq(x2, n, r, c, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>x2</code></td> <td> <p>chi-square statistic</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>r</code></td> <td> <p>number of rows in the contingency table</p> </td></tr> <tr valign="top"><td><code>c</code></td> <td> <p>number of columns in the contingency table</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> v.chi.sq(x2 = 4, n = 25, r = 2, c = 2, a = .05) </pre>   </body></html> 
