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
 

 
<h2>d from z-statistic for Z-test</h2>  <h3>Description</h3>  <p>This function displays d for Z-tests when all you have is the z-statistic. The normal confidence interval is also provided if you have sigma. If sigma is left blank, then you will not see a confidence interval. </p>   <h3>Usage</h3>  <pre> d.z.z(z, sig = NA, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>z</code></td> <td> <p>z statistic</p> </td></tr> <tr valign="top"><td><code>sig</code></td> <td> <p>population standard deviation</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>To calculate d, z is divided by the square root of N. </p> <p>d = z / sqrt(N) </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/ztestz.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>The effect size (Cohen's d) with associated confidence intervals and relevant statistics. </p> <table summary="R valueblock"> <tr valign="top"><td><code>d</code></td> <td> <p>effect size</p> </td></tr> <tr valign="top"><td><code>dlow</code></td> <td> <p>lower level confidence interval d value</p> </td></tr> <tr valign="top"><td><code>dhigh</code></td> <td> <p>upper level confidence interval d value</p> </td></tr> <tr valign="top"><td><code>sigma</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>z</code></td> <td> <p>sig stats</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>estimate</code></td> <td> <p>the d statistic and confidence interval in APA style for markdown printing</p> </td></tr> <tr valign="top"><td><code>statistic</code></td> <td> <p>the Z-statistic in APA style for markdown printing</p> </td></tr> </table>   <h3>Examples</h3>  <pre>  #A recent study suggested that students (N = 100) learning #statistics improved their test scores with the use of #visual aids (Z = 2.5). The population standard deviation is 4.  #You can type in the numbers directly as shown below, #or refer to your dataset within the function.      d.z.z(z = 2.5, sig = 4, n = 100, a = .05)      d.z.z(z = 2.5, n = 100, a = .05)      d.z.z(2.5, 4, 100, .05) </pre>   </body></html> 
