---
title: "singletM_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---
 
The formula for d is: $$d = \frac{M - \mu}{SD}$$
 
The formula for t is: $$t = \frac{M - \mu}{SE}$$
 
The code to use MOTE in R is: 
 

 
<h2>d.single.t</h2>  <h3>Description</h3>  <p>This function displays d and non-central confidence interval for single t from means. </p>   <h3>Usage</h3>  <pre> d.single.t(m, u, sd, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>m</code></td> <td> <p>sample mean</p> </td></tr> <tr valign="top"><td><code>u</code></td> <td> <p>population mean</p> </td></tr> <tr valign="top"><td><code>sd</code></td> <td> <p>sample standard deviation</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> d.single.t(m = 20, u = 17, sd = 4, n = 100, a = .05) </pre>   </body></html> 
