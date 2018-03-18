---
title: "singletM_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---
 
The formula for d is: $$d = \frac{M_1 - M_2}{SD_{differences}}$$
 
The formula for t is: $$t = \frac{M_1 - M_2}{SE_{differences}}$$
 
The code to use MOTE in R is: 
 

 
<h2>d.dep.t.diff</h2>  <h3>Description</h3>  <p>This function displays d for repeated measures data and the non-central confidence interval using the  standard deviation of the differences as the denominator. </p>   <h3>Usage</h3>  <pre> d.dep.t.diff(mdiff, sddiff, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>mdiff</code></td> <td> <p>mean difference score</p> </td></tr> <tr valign="top"><td><code>sddiff</code></td> <td> <p>standard deviation of the difference scores</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> d.dep.t.diff(mdiff = 5, sddiff = 3, n = 100, a = .05) </pre>   </body></html> 
