---
title: "singletM_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---
 
The formula for d is: $$d = \frac{M_1 - M_2}{SD_{pooled}}*(1-\frac{3}{4*(N_1+N_2)-9})$$
 
The formula for t is: $$t = \frac{M_1 - M_2}{SE_{pooled}}$$
 
The code to use MOTE in R is: 
 

 
<h2>g.ind.t</h2>  <h3>Description</h3>  <p>This function displays d-g corrected  and the non-central confidence interval for independent t. </p>   <h3>Usage</h3>  <pre> g.ind.t(m1, m2, sd1, sd2, n1, n2, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>m1</code></td> <td> <p>mean group one</p> </td></tr> <tr valign="top"><td><code>m2</code></td> <td> <p>mean group two</p> </td></tr> <tr valign="top"><td><code>sd1</code></td> <td> <p>standard deviation group one</p> </td></tr> <tr valign="top"><td><code>sd2</code></td> <td> <p>standard deviation group two</p> </td></tr> <tr valign="top"><td><code>n1</code></td> <td> <p>sample size group one</p> </td></tr> <tr valign="top"><td><code>n2</code></td> <td> <p>sample size group two</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> g.ind.t(m1 = 20, m2 = 17, sd1 = 4, sd2 = 5, n1 = 100, n2 = 100, a = .05) </pre>   </body></html> 
