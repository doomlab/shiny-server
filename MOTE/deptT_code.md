---
title: "singletM_code"
author: "Erin M. Buchanan"
date: "3/17/2018"
output: 
  html_document:
        self_contained: no
---
 
The formula for d is: $$d = \frac{t}{\sqrt{N}}$$
 
The formula for t is: $$t = \frac{M_1 - M_2}{SE_{differences}}$$
 
The code to use MOTE in R is: 
 

 
<h2>d from t for Repeated Measures with SD Difference Scores Denominator</h2>  <h3>Description</h3>  <p>This function displays d for repeated measures data and the non-central confidence interval using the standard deviation of the differences as the denominator estimating from the t-statistic. </p>   <h3>Usage</h3>  <pre> d.dep.t.diff.t(t, n, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>t</code></td> <td> <p>t-test value</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>To calculate d, the t-statistic is divided by the square root of the sample size. </p> <p>d_z = t / sqrt(n) </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/deptdifft.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <table summary="R valueblock"> <tr valign="top"><td><code>d</code></td> <td> <p>effect size</p> </td></tr> <tr valign="top"><td><code>dlow</code></td> <td> <p>lower level confidence interval d value</p> </td></tr> <tr valign="top"><td><code>dhigh</code></td> <td> <p>upper level confidence interval d value</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>df</code></td> <td> <p>degrees of freedom (sample size - 1)</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> <tr valign="top"><td><code>estimate</code></td> <td> <p>the d statistic and confidence interval in APA style for markdown printing</p> </td></tr> <tr valign="top"><td><code>statistic</code></td> <td> <p>the t-statistic in APA style for markdown printing</p> </td></tr> </table>   <h3>Examples</h3>  <pre>  #The following example is derived from the "dept_data" dataset included #in the MOTE library.  #In a study to test the effects of science fiction movies on people’s belief #in the supernatural, seven people completed a measure of belief in #the supernatural before and after watching a popular science #fiction movie. Higher scores indicated higher levels of belief.      scifi = t.test(dept_data$before, dept_data$after, paired = TRUE)  #The t-test value was 1.43. You can type in the numbers directly, #or refer to the dataset, as shown below.      d.dep.t.diff.t(t = 1.43, n = 7, a = .05)      d.dep.t.diff.t(1.43, 7, .05)      d.dep.t.diff.t(scifi$statistic, length(dept_data$before), .05)  #The mean measure of belief on the pretest was 5.57, with a standard #deviation of 1.99. The posttest scores appeared lower (M = 4.43, SD = 2.88) #but the dependent t-test was not significant using alpha = .05, #t(7) = 1.43, p = .203, d_z = 0.54. The effect size was a medium effect suggesting #that the movie may have influenced belief in the supernatural. </pre>   </body></html> 
