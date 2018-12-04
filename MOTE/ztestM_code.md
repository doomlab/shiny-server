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



<h2>d for Z-test from Population Mean and SD</h2>  <h3>Description</h3>  <p>This function displays d for Z-test with the population mean and standard deviation. The normal confidence interval is also provided. </p>   <h3>Usage</h3>  <pre> d.z.mean(mu, m1, sig, sd1, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>mu</code></td> <td> <p>population mean</p> </td></tr> <tr valign="top"><td><code>m1</code></td> <td> <p>sample study mean</p> </td></tr> <tr valign="top"><td><code>sig</code></td> <td> <p>population standard deviation</p> </td></tr> <tr valign="top"><td><code>sd1</code></td> <td> <p>standard deviation from the study</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>d is calculated by deducting the population mean from the sample study mean and dividing by the alpha level. </p> <p>d = (m1 - mu) / sig </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/zm.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>The effect size (Cohen's d) with associated confidence intervals and relevant statistics. </p> <table summary="R valueblock"> <tr valign="top"><td><code>d</code></td> <td> <p>effect size</p> </td></tr> <tr valign="top"><td><code>dlow</code></td> <td> <p>lower level confidence interval d value</p> </td></tr> <tr valign="top"><td><code>dhigh</code></td> <td> <p>upper level confidence interval d value</p> </td></tr> <tr valign="top"><td><code>M1</code></td> <td> <p>mean of sample</p> </td></tr> <tr valign="top"><td><code>sd1</code></td> <td> <p>standard deviation of sample</p> </td></tr> <tr valign="top"><td><code>se1</code></td> <td> <p>standard error of sample</p> </td></tr> <tr valign="top"><td><code>M1low</code></td> <td> <p>lower level confidence interval of the mean</p> </td></tr> <tr valign="top"><td><code>M1high</code></td> <td> <p>upper level confidence interval of the mean</p> </td></tr> <tr valign="top"><td><code>Mu</code></td> <td> <p>population mean</p> </td></tr> <tr valign="top"><td><code>Sigma</code></td> <td> <p>standard deviation of population</p> </td></tr> <tr valign="top"><td><code>se2</code></td> <td> <p>standard error of population</p> </td></tr> <tr valign="top"><td><code>z</code></td> <td> <p>z-statistic</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> </table>   <h3>Examples</h3>  <pre>  d.z.mean(mu = 20, m1 = 17, sig = 4, sd1 = 5, n = 100, a = .05) </pre>   </body></html> 
