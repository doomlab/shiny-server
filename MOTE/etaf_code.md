---
title: "etaf_code"
author: "Erin Buchanan"
date: "March 23, 2018"
output: 
html_document:
 self_contained: no
---

The formula for $\eta^2$ is: $$\frac{df_{model} \times F_{model}} {df_{model} \times F_{model} + df_{error}}$$

This value will be $\eta^2$ when you use a one-way ANOVA and will be $\eta_p^2$ when you use a multi-way ANOVA (more than one IV).

The code to use MOTE in R is: 
 

 
<h2>Eta and Coefficient of Determination (R2) for ANOVA from F</h2>  <h3>Description</h3>  <p>This function displays eta squared from ANOVA analyses and their non-central confidence interval based on the F distribution. These values are calculated directly from F statistics and can be used for between subjects and repeated measures designs. Remember if you have two or more IVs, these values are partial eta squared. </p>   <h3>Usage</h3>  <pre> eta.F(dfm, dfe, Fvalue, a = 0.05) </pre>   <h3>Arguments</h3>  <table summary="R argblock"> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/residual/within</p> </td></tr> <tr valign="top"><td><code>Fvalue</code></td> <td> <p>F statistic</p> </td></tr> <tr valign="top"><td><code>a</code></td> <td> <p>significance level</p> </td></tr> </table>   <h3>Details</h3>  <p>Eta is calculated by multiplying the degrees of freedom of the model by the F-statistic. This is divided by the product of degrees of freedom of the model, the F-statistic, and the degrees of freedom for the error or residual. </p> <p>eta^2 = (dfm * Fvalue) / (dfm * Fvalue + dfe) </p> <p><a href="https://www.aggieerin.com/shiny-server/tests/etaf.html">Learn more on our example page.</a> </p>   <h3>Value</h3>  <p>Provides eta with associated confidence intervals and relevant statistics. </p> <table summary="R valueblock"> <tr valign="top"><td><code>eta</code></td> <td> <p>effect size</p> </td></tr> <tr valign="top"><td><code>etalow</code></td> <td> <p>lower level confidence interval of eta</p> </td></tr> <tr valign="top"><td><code>etahigh</code></td> <td> <p>upper level confidence interval of eta</p> </td></tr> <tr valign="top"><td><code>dfm</code></td> <td> <p>degrees of freedom for the model/IV/between</p> </td></tr> <tr valign="top"><td><code>dfe</code></td> <td> <p>degrees of freedom for the error/resisual/within</p> </td></tr> <tr valign="top"><td><code>F</code></td> <td> <p>F-statistic</p> </td></tr> <tr valign="top"><td><code>p</code></td> <td> <p>p-value</p> </td></tr> <tr valign="top"><td><code>estimate</code></td> <td> <p>the eta squared statistic and confidence interval in APA style for markdown printing</p> </td></tr> <tr valign="top"><td><code>statistic</code></td> <td> <p>the F-statistic in APA style for markdown printing</p> </td></tr> </table>   <h3>Examples</h3>  <pre>  #The following example is derived from the "bn1_data" dataset, included #in the MOTE library.  #A health psychologist recorded the number of close inter-personal #attachments of 45-year-olds who were in excellent, fair, or poor #health. People in the Excellent Health group had 4, 3, 2, and 3 #close attachments; people in the Fair Health group had 3, 5, #and 8 close attachments; and people in the Poor Health group #had 3, 1, 0, and 2 close attachments.  anova_model = lm(formula = friends ~ group, data = bn1_data) summary.aov(anova_model)  eta.F(dfm = 2, dfe = 8,       Fvalue = 5.134, a = .05) </pre>   </body></html> 
