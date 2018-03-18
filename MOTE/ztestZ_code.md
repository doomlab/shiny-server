---
title: "ztestZ_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---
 
The formula for d is: $$d = \frac{Z}{\sqrt(N)}$$
 
The formula for Z is: $$Z = \frac{M - \mu}{\sigma_M}$$
 
The code to use MOTE in R is: 
 

 
<h2>d.z.z</h2>  <h3>Description</h3>  <p>This function displays d for z-scores when all you have is the z-statistics. The normoal confidence interval is also provided if you have sigma. If sigma is left blank, then you will not see a confidence interval. </p>   <h3>Usage</h3>  <pre> d.z.z(z, sig = NA, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>z</code></td> <td> <p>z statistic</p> </td></tr> <tr valign="top"><td><code>sig</code></td> <td> <p>population standard deviation</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> d.z.z(z = 1.25, n = 10, a = .05) </pre>   </body></html> 
