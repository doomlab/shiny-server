---
title: "singletM_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---
 
The formula for d is: $$d = \frac{M_1 - M_2}{\frac{SD_1 + SD_2}{2}}$$
 
The t-test is not given in this example, as you do not have the information needed to calculate it. 
 
The code to use MOTE in R is: 
 

 
<h2>d.dep.t.avg</h2>  <h3>Description</h3>  <p>This function displays d for repeated measures data and the non-central confidence interval using the  average standard deviation of each level as the denominator. </p>   <h3>Usage</h3>  <pre> d.dep.t.avg(m1, m2, sd1, sd2, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>m1</code></td> <td> <p>mean from first level</p> </td></tr> <tr valign="top"><td><code>m2</code></td> <td> <p>mean from second level</p> </td></tr> <tr valign="top"><td><code>sd1</code></td> <td> <p>standard deviation from first level</p> </td></tr> <tr valign="top"><td><code>sd2</code></td> <td> <p>standard deviation from second level</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Examples</h3>  <pre> d.dep.t.avg(m1 = 20, m2 = 17, sd1 = 4, sd2 = 5, n = 100, a = .05) </pre>   </body></html> 
