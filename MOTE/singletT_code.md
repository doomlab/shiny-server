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
 

 
<h2>d for Single t from t</h2>  <h3>Description</h3>  <p>This function displays d and non-central confidence interval for single t estimated from the t-statistic. </p>   <h3>Usage</h3>  <pre> d.single.t.t(t, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>t</code></td> <td> <p>t-test value</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>To calculate d, the t-statistic is divided by the square root of the sample size. </p> <p>d = t / sqrt(n) </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/singlett.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>The effect size (Cohen's d) with associated confidence intervals and relevant statistics. </p> <table summary="R valueblock"> <tr valign="top"><td><code>d</code></td> <td> <p>effect size</p> </td></tr> <tr valign="top"><td><code>dlow</code></td> <td> <p>lower level confidence interval d value</p> </td></tr> <tr valign="top"><td><code>dhigh</code></td> <td> <p>upper level confidence interval d value</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>df</code></td> <td> <p>degrees of freedom (sample size - 1)</p> </td></tr> <tr valign="top"><td><code>t</code></td> <td> <p>sig stats</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> </table>   <h3>Examples</h3>  <pre>  #A school has a gifted/honors program that they claim is #significantly better than others in the country. The gifted/honors #students in this school scored an average of 1370 on the SAT, #with a standard deviation of 112.7, while the national average #for gifted programs is a SAT score of 1080.      gift = t.test(singt_data, mu = 1080, alternative = "two.sided")  #According to a single-sample t-test, the scores of the students #from the program were significantly higher than the national #average, t(14) = 9.97, p &lt; .001.  #You can type in the numbers directly as shown below, or refer #to your dataset within the function.      d.single.t.t(t = 9.968, n = 15, a = .05)      d.single.t.t(9.968, 15, .05)      d.single.t.t(gift$statistic, length(singt_data$SATscore), .05) </pre>   </body></html> 
