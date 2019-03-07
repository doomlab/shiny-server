---
title: "lsa_code"
author: "Erin M. Buchanan"
date: "11/14/2018"
output: 
  html_document:
        #self_contained: no
---

First, you would need to load the libraries for the Latent Semantic Analysis Packages:


```r
library(tm)
library(lsa)
library(LSAfun)
```
 
Then, you could load a dataset you are interested in working with:


```r
importdf = read.csv('exam_answers.csv', header = F, stringsAsFactors = F)
```

From these documents, we will create a corpus (a set of text documents). Because our data is in one column in our dataset, we will use `VectorSource()` to create the corpus:


```r
import_corpus = Corpus(VectorSource(importdf$V1))
```

When you perform these analyses, you usually have to edit the text. Therefore, we are going to lower case the words, take out the punctuation, and remove English stop words (like *the, an, a*).


```r
#Lower case all words
import_corpus = tm_map(import_corpus, tolower) 

#Remove punctuation for creating spaces
import_corpus = tm_map(import_corpus, removePunctuation) 

#Remove stop words
import_corpus = tm_map(import_corpus, 
                     function(x) removeWords(x, stopwords("english")))
```

Transform the documents you uploaded into a term (words) by document matrix. 


```r
#Create the term by document matrix
import_mat = as.matrix(TermDocumentMatrix(import_corpus))
```

Then you would want to weight that matrix to help control for the sparsity of the matrix. That means you are controlling for the fact that not all words are in each document, as well as the fact that some words are very frequent. 


```r
#Weight the semantic space
import_weight = lw_logtf(import_mat) * gw_idf(import_mat)
```

The next step is to run the LSA, which involves using singular vector decomposition to find the semantic factors avaliable in your corpus. The last step converts the LSA object into a matrix so you can use it to create pictures provided in the app.  


```r
#Run the SVD
import_lsa = lsa(import_weight)

#Convert to textmatrix for coherence
import_lsa = as.textmatrix(import_lsa)
```

If you want to create a picture of your data, you could use the plot_neighbors function, which requires you pick a word, and the number of neighbors to plot (n). MDS is the multidimensional scaling, and dims presents the data in 2 dimensions (you can increase or decrease this number).


```r
plot_neighbors("information", #pick a word
               n = 10, #pick the number of neighbors
               tvectors = import_lsa, 
               method = "MDS", 
               dims = 2) #pick the number of dimensions
```

You can also pick a random set of related words based on cosine values (similar to correlation). In this function, you can pick a concept, a range of cosine values you wish to target, and the number related words to find. 


```r
choose.target("information", #choose word
              lower = .3, #lower cosine
              upper = .4, #upper cosine
              n = 10, #number of related words to get
              tvectors = import_lsa)
```

We then can look at the relationship of a bunch of concepts at once. First, pick a set of words. Then you can plot those words, like the neighbor plot above, and then also see the cosine values between those words you selected. 


```r
#use a multiselect for lists of words
list1 = c("object", "insignificant", "attention", "endogenous")

#plot all the words selected
plot_wordlist(list1, #put in the list above 
              method = "MDS", 
              dims = 2, #pick the number of dimensions
              tvectors = import_lsa)

#look at the cosine of all the words you selected
multicos(list1, tvectors = import_lsa)
```
