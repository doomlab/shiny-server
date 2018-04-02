---
title: "chiO_code"
author: "Gillenwaters"
date: "3/23/2018"
output: 
html_document:
 self_contained: no
---
The formula for *odds* is: $$\frac{(N_{11}/N_{12})}{(N_{21}/N_{22})}$$

The code to use MOTE in R is: 
 

 
<h2>odds</h2>  <h3>Description</h3>  <p>This function displays odds ratios and their normal confidence intervals. This statistic is calculated as (level1.1/level2.1) / (level1.2/level2.2), which can be considered the odds of level1.1 given level1 overall versus level1.2 given level2 overall. </p>   <h3>Usage</h3>  <pre> odds(n11, n12, n21, n22, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>n11</code></td> <td> <p>sample size for level1.1, level2.1</p> </td></tr> <tr valign="top"><td><code>n12</code></td> <td> <p>sample size for level1.1, level2.2</p> </td></tr> <tr valign="top"><td><code>n21</code></td> <td> <p>sample size for level1.2, level2.1</p> </td></tr> <tr valign="top"><td><code>n22</code></td> <td> <p>sample size for level1.2, level 2.2</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> odds(n11 = 10, n12 = 15, n21 = 20, n22 = 5, a = .05) </pre>   </body></html> 
