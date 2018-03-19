---
title: "singletT_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---
 
The formula for d is: $$d = \frac{t}{\sqrt(N)}$$
 
The formula for t is: $$t = \frac{M - \mu}{SE}$$
 
The code to use MOTE in R is: 
 

 
<h2>d.single.t.t</h2>  <h3>Description</h3>  <p>This function displays d and non-central confidence interval for single t  estimated from the t-statistic. </p>   <h3>Usage</h3>  <pre> d.single.t.t(t, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>t</code></td> <td> <p>t-test value</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> d.single.t.t(t = 4.20, n = 100, a = .05) </pre>   </body></html> 
