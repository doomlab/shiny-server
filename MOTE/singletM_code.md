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
 

 
<h2>d for Single t from Means</h2>  <h3>Description</h3>  <p>This function displays d and non-central confidence interval for single t from means. </p>   <h3>Usage</h3>  <pre> d.single.t(m, u, sd, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>m</code></td> <td> <p>sample mean</p> </td></tr> <tr valign="top"><td><code>u</code></td> <td> <p>population mean</p> </td></tr> <tr valign="top"><td><code>sd</code></td> <td> <p>sample standard deviation</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>To calculate d, the population is subtracted from the sample mean, which is then divided by the standard deviation. </p> <p>d = (m - u) / sd </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/singletm.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <table summary="R valueblock"> <tr valign="top"><td><code>d</code></td> <td> <p>effect size</p> </td></tr> <tr valign="top"><td><code>dlow</code></td> <td> <p>lower level confidence interval d value</p> </td></tr> <tr valign="top"><td><code>dhigh</code></td> <td> <p>upper level confidence interval d value</p> </td></tr> <tr valign="top"><td><code>m</code></td> <td> <p>sample mean</p> </td></tr> <tr valign="top"><td><code>sd</code></td> <td> <p>standard deviation of the sample</p> </td></tr> <tr valign="top"><td><code>se</code></td> <td> <p>standard error of the sample</p> </td></tr> <tr valign="top"><td><code>Mlow</code></td> <td> <p>lower level confidence interval of the sample mean</p> </td></tr> <tr valign="top"><td><code>Mhigh</code></td> <td> <p>upper level confidence interval of the sample mean</p> </td></tr> <tr valign="top"><td><code>u</code></td> <td> <p>population mean</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>df</code></td> <td> <p>degrees of freedom (n - 1)</p> </td></tr> <tr valign="top"><td><code>t</code></td> <td> <p>t-statistic</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> </table>   <h3>Examples</h3>  <pre>  #The following example is derived from the "singt_data" dataset included #in the MOTE library.  #A school has a gifted/honors program that they claim is #significantly better than others in the country. The gifted/honors #students in this school scored an average of 1370 on the SAT, #with a standard deviation of 112.7, while the national average #for gifted programs is a SAT score of 1080.      gift = t.test(singt_data, mu = 1080, alternative = "two.sided")  #You can type in the numbers directly as shown below, #or refer to your dataset within the function.      d.single.t(m = 1370, u = 1080, sd = 112.7, n = 14, a = .05)      d.single.t(1370, 1080, 112.7, 100, .05)      d.single.t(gift$estimate, gift$null.value,             sd(singt_data$SATscore),         length(singt_data$SATscore), .05) </pre>   </body></html> 
