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
temp = plot_neighbors("information", 
               n = 10, 
               tvectors = import_lsa, 
               method = "MDS", 
               dims = 2)
library(ggplot2)
neighbor_plot = ggplot(temp, aes(x,y))
neighbor_plot + 
  geom_point() + 
  xlab("Dimension 1") +
  ylab("Dimension 2")
#figure out how to add the labels for the dots 
#also add clean up 
#put clean up code in new section at the top
#update graph section 

choose.target("information",
              lower = .3,
              upper = .4,
              n = 10,
              tvectors = import_lsa)

#use a multiselect for lists of words
list1 = c("object", "insignificant", "attention", "endogenous")
multicos(list1, tvectors = import_lsa)

plot_wordlist(list1,
              method = "MDS", 
              dims = 2,
              tvectors = import_lsa)

#pick a single text document

coh_value = rep(NA, length(importdf$V1))
gen_summary = rep(NA, length(importdf$V1))

##don't run this unless you got time 
for (i in 1:length(importdf$V1))
{
  tryCatch({
    coh_value[i] = coherence(importdf$V1[i], 
                             tvectors = import_lsa)$global
  }, error = function (x) {})
  
  tryCatch({
    gen_summary[i] = genericSummary(importdf$V1[i],
                   k = 1)
  }, error = function (x) {})
}


