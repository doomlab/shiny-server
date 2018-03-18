---
title: "singletM_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---
 
The formula for d is: $$d = \frac{P_1}{SE_1} - \frac{P_2}{SE_2}$$
 
The formula for t is: $$Z = \frac{P_1 - P_2}{SE}$$
 
The code to use MOTE in R is: 
 

 
<h2>d.prop</h2>  <h3>Description</h3>  <p>This function displays d and central confidence interval calculated from differences in independent proportions. </p>   <h3>Usage</h3>  <pre> d.prop(p1, p2, n1, n2, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>p1</code></td> <td> <p>proportion of people group one</p> </td></tr> <tr valign="top"><td><code>p2</code></td> <td> <p>proportion of people group two</p> </td></tr> <tr valign="top"><td><code>n1</code></td> <td> <p>sample size group one</p> </td></tr> <tr valign="top"><td><code>n2</code></td> <td> <p>sample size group two</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> d.prop(p1 = .4, p2 = .6, n1 = 100, n2 = 100, a = .05) </pre>   </body></html> 
