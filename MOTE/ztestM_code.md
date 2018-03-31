---
title: "ztestM_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---

The formula for d is: $$d = \frac{M - \mu}{\sigma}$$

The formula for Z is: $$Z = \frac{M - \mu}{\sigma_M}$$

The code to use MOTE in R is: 



<h2>d.z.mean</h2>  <h3>Description</h3>  <p>This function displays d for z-scores with the  population mean and standard deviation. The normal confidence interval is also provided. </p>   <h3>Usage</h3>  <pre> d.z.mean(mu, m1, sig, sd1, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>mu</code></td> <td> <p>population mean</p> </td></tr> <tr valign="top"><td><code>m1</code></td> <td> <p>sample study mean</p> </td></tr> <tr valign="top"><td><code>sig</code></td> <td> <p>population standard deviation</p> </td></tr> <tr valign="top"><td><code>sd1</code></td> <td> <p>standard deviation from the study</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> d.z.mean(mu = 20, m1 = 17, sig = 4, sd1 = 5, n = 100, a = .05) </pre>   </body></html> 
