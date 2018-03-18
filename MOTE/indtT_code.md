---
title: "singletM_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---
 
The formula for d is: $$d = 2*\frac{t}{\sqrt{N_1 + N_2 - 2}}$$
 
The formula for t is: $$t = \frac{M_1 - M_2}{SE}$$
 
The code to use MOTE in R is: 
 

 
<h2>d.ind.t.t</h2>  <h3>Description</h3>  <p>This function displays d for between subjects data and the non-central confidence interval estimating from the t-statistic. </p>   <h3>Usage</h3>  <pre> d.ind.t.t(t, n1, n2, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>t</code></td> <td> <p>t-test value</p> </td></tr> <tr valign="top"><td><code>n1</code></td> <td> <p>sample size group one</p> </td></tr> <tr valign="top"><td><code>n2</code></td> <td> <p>sample size group two</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> d.ind.t.t(t = 4.12, n1 = 100, n2 = 100, a = .05) </pre>   </body></html> 
