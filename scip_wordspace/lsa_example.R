#Load Libraries
library(tm)
library(lsa)
library(LSAfun)

##just some example data so you can see
importdf = read.csv('exam_answers.csv', header = F, stringsAsFactors = F)

##if own file imported
#Create a corpus from a vector of documents
#therefore the data needs to be a column in a DF that includes all the text files
import_corpus = Corpus(VectorSource(importdf$V1)) 

#Lower case all words
import_corpus = tm_map(import_corpus, tolower) 

#Remove punctuation for creating spaces
import_corpus = tm_map(import_corpus, removePunctuation) 

#Remove stop words
import_corpus = tm_map(import_corpus, 
                     function(x) removeWords(x, stopwords("english")))

#Create the term by document matrix
import_mat = as.matrix(TermDocumentMatrix(import_corpus))

#Weight the semantic space
import_weight = lw_logtf(import_mat) * gw_idf(import_mat)

#Run the SVD
import_lsa = lsa(import_weight)

#Convert to textmatrix for coherence
import_lsa = as.textmatrix(import_lsa)

##if you use either space this is the fun stuff
##allow them to pick a word to create neighbors from (use rownames)
##allow them to put in a number of neighbors
plot_neighbors("attention", 
               n = 10, 
               tvectors = import_lsa, 
               method = "MDS", 
               dims = 2)

choose.target("blindness",
              lower = .1,
              upper = .4,
              n = 20,
              tvectors = import_lsa)

#use a multiselect for lists of words
list1 = c("object", "insignificant", "attention", "endogenous")
multicos(list1, tvectors = import_lsa)

plot_wordlist(list1,
              method = "MDS", 
              dims = 2,
              tvectors = import_lsa)

#pick a single text document
coherence(importdf$V1[2], 
          tvectors = import_lsa)

genericSummary(importdf$V1[2],
               k = 1)
