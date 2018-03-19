---
title: "singletM_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---
 
The formula for d is: $$d = \frac{M_{control} - M_{exp}}{SD_{control}}$$
 
The formula for t is: $$t = \frac{M_{control} - M_{exp}}{SE_{pooled}}$$
 
The code to use MOTE in R is: 
 

 
<h2>delta.ind.t</h2>  <h3>Description</h3>  <p>This function displays d-delta for between subjects data and the non-central confidence interval using the  control group standard deviation as the denominator. </p>   <h3>Usage</h3>  <pre> delta.ind.t(m1, m2, sd1, sd2, n1, n2, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>m1</code></td> <td> <p>mean from control group</p> </td></tr> <tr valign="top"><td><code>m2</code></td> <td> <p>mean from experimental group</p> </td></tr> <tr valign="top"><td><code>sd1</code></td> <td> <p>standard deviation from control group</p> </td></tr> <tr valign="top"><td><code>sd2</code></td> <td> <p>standard deviation from experimental group</p> </td></tr> <tr valign="top"><td><code>n1</code></td> <td> <p>sample size from control group</p> </td></tr> <tr valign="top"><td><code>n2</code></td> <td> <p>sample size from experimental group</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> delta.ind.t(m1 = 20, m2 = 17, sd1 = 4, sd2 = 5, n1 = 100, n2 = 100, a = .05) </pre>   </body></html> 
