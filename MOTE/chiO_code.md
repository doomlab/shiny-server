---
title: "chiO_code"
author: "Gillenwaters"
date: "3/23/2018"
output: 
html_document:
 self_contained: no
---
The formula for *odds* is: $$\frac{(N_{11}/N_{12})}{(N_{21}/N_{22})}$$

The code to use MOTE in R is: 
 

 
<h2>Chi-Square Odds Ratios</h2>  <h3>Description</h3>  <p>This function displays odds ratios and their normal confidence intervals. </p>   <h3>Usage</h3>  <pre> odds(n11, n12, n21, n22, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>n11</code></td> <td> <p>sample size for level 1.1</p> </td></tr> <tr valign="top"><td><code>n12</code></td> <td> <p>sample size for level 1.2</p> </td></tr> <tr valign="top"><td><code>n21</code></td> <td> <p>sample size for level 2.1</p> </td></tr> <tr valign="top"><td><code>n22</code></td> <td> <p>sample size for level 2.2</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>This statistic is the ratio between level 1.1 divided by level 1.2, and level 2.1 divided by 2.2. In other words, these are the odds of level 1.1 given level 1 overall versus level 2.1 given level 2 overall. </p> <p>To calculate odds ratios, First, the sample size for level 1.1 is divided by the sample size for level 1.2. This value is divided by the sample size for level 2.1, after dividing by the sample size of level 2.2. </p> <p>odds &lt;- (n11 / n12) / (n21 / n22) </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/chio.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>Provides odds ratios with associated confidence intervals and relevant statistics. </p> <table summary="R valueblock"> <tr valign="top"><td><code>odds</code></td> <td> <p>odds statistic</p> </td></tr> <tr valign="top"><td><code>olow</code></td> <td> <p>lower level confidence interval of odds statistic</p> </td></tr> <tr valign="top"><td><code>ohigh</code></td> <td> <p>upper level confidence interval of odds statistic</p> </td></tr> <tr valign="top"><td><code>se</code></td> <td> <p>standard error</p> </td></tr> <tr valign="top"><td><code>estimate</code></td> <td> <p>the oods statistic and confidence interval in APA style for markdown printing</p> </td></tr> </table>   <h3>Examples</h3>  <pre>  #A health psychologist was interested in the rates of anxiety in #first generation and regular college students. They polled campus #and found the following data:    #|              | First Generation | Regular |   #|--------------|------------------|---------|   #| Low Anxiety  | 10               | 50      |   #| High Anxiety | 20               | 15      |  #What are the odds for the first generation students to have anxiety?  odds(n11 = 10, n12 = 50, n21 = 20, n22 = 15, a = .05) </pre>   </body></html> 
