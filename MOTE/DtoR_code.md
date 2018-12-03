---
title: "DtoR"
author: "Amber Gillenwaters"
date: "March 23, 2018"
output: 
html_document:
 self_contained: no
---
The formula for *r* is: $$r = \frac{d} {\sqrt{d^2 + \frac{(n_1 + n_2)^2}{(n_1 \times n_2)}}}$$

The formula for *t* is: $$t = \frac{r}{\sqrt{ \frac{1-r^2} {(N - 2)}}}$$

The code to use MOTE in R is: 
 

 
<h2>r and Coefficient of Determination (R2) from d</h2>  <h3>Description</h3>  <p>Calculates r from d and then translates r to r2 to calculate the non-central confidence interval for r2 using the F distribution. </p>   <h3>Usage</h3>  <pre> d.to.r(d, n1, n2, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>d</code></td> <td> <p>effect size statistic</p> </td></tr> <tr valign="top"><td><code>n1</code></td> <td> <p>sample size group one</p> </td></tr> <tr valign="top"><td><code>n2</code></td> <td> <p>sample size group two</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>The correlation coefficient (r) is calculated by dividing Cohen's d by the square root of the total sample size squared - divided by the product of the sample sizes of group one and group two. </p> <p>r = d / sqrt(d^2 + (n1 + n2)^2 / (n1*n2)) </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/dtor.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>Provides the effect size (Cohen's d) with associated confidence intervals, the t-statistic, the confidence intervals associated with the means of each group, as well as the standard deviations and standard errors of the means for each group. </p> <table summary="R valueblock"> <tr valign="top"><td><code>r</code></td> <td> <p>correlation coefficient</p> </td></tr> <tr valign="top"><td><code>rlow</code></td> <td> <p>lower level confidence interval r</p> </td></tr> <tr valign="top"><td><code>rhigh</code></td> <td> <p>upper level confidence interval r</p> </td></tr> <tr valign="top"><td><code>R2</code></td> <td> <p>coefficient of determination</p> </td></tr> <tr valign="top"><td><code>R2low</code></td> <td> <p>lower level confidence interval of R2</p> </td></tr> <tr valign="top"><td><code>R2high</code></td> <td> <p>upper level confidence interval of R2</p> </td></tr> <tr valign="top"><td><code>se</code></td> <td> <p>standard error</p> </td></tr> <tr valign="top"><td><code>n</code></td> <td> <p>sample size</p> </td></tr> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom of mean</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom error</p> </td></tr> <tr valign="top"><td><code>t</code></td> <td> <p>t-statistic</p> </td></tr> <tr valign="top"><td><code>F</code></td> <td> <p>F-statistic</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> </table>   <h3>Examples</h3>  <pre> d.to.r(d = .5, n1 = 50, n2 = 50, a = .05) </pre>   </body></html> 
