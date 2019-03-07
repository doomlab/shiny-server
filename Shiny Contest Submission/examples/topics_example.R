library(tm)
library(topicmodels)
library(slam)
library(lsa)

##just some example data so you can see
importdf = read.csv('exam_answers.csv', header = F, stringsAsFactors = F)

##if own file imported
#Create a corpus from a vector of documents
#therefore the data needs to be a column in a DF that includes all the text files
import_corpus = Corpus(VectorSource(importdf$V1)) 

#create corpus textmatrix
import_mat = DocumentTermMatrix(import_corpus,
                                control = list(stemming = TRUE, stopwords = TRUE, minWordLength = 3,
                                               removeNumbers = TRUE, removePunctuation = TRUE)) 

#weighting scheme
import_weight = tapply(import_mat$v/row_sums(import_mat)[import_mat$i], import_mat$j, mean) *
  log2(nDocs(import_mat)/col_sums(import_mat > 0))

#ignore very frequent and 0 terms
import_mat = import_mat[ , import_weight >= .1]
import_mat = import_mat[ row_sums(import_mat) > 0, ]

#make the user pick a number of topics
k = 5
SEED = 2010

LDA_fit = LDA(import_mat, k = k, control = list(seed = SEED))
LDA_fixed = LDA(import_mat, k = k, control = list(estimate.alpha = FALSE, seed = SEED))
LDA_gibbs = LDA(import_mat, k = k, method = "Gibbs", 
                control = list(seed = SEED, burnin = 1000, thin = 100, iter = 1000))
CTM_fit = CTM(import_mat, k = k, 
              control = list(seed = SEED, 
                             var = list(tol = 10^-4), 
                             em = list(tol = 10^-3)))

alltogether = list(LDA_fit, LDA_fixed, LDA_gibbs, CTM_fit)

#compare alpha
sapply(alltogether[1:2], slot, "alpha")
#lower alphas = higher that documents are assigned to a single topic

#figure out entropy
sapply(alltogether, function (x)
  mean(apply(posterior(x)$topics, 1, function(z)
    - sum(z * log(z)))))
#higher values indicate that the topic distributions are evenly spread over topics

#get the number of topics for each document
topics(LDA_fit, 1)
topics(LDA_fixed, 1)
topics(LDA_gibbs, 1)
topics(CTM_fit, 1)

#get the terms by topic
terms(LDA_fit,10)
terms(LDA_fixed, 10)
terms(LDA_gibbs,10)
terms(CTM_fit,10)

#look at the most frequent words for the most frequent topics
most_frequent = which.max(tabulate(topics(LDA_fit,1)))
terms(LDA_fit, 10)[ , most_frequent]
