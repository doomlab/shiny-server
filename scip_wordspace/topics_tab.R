topics_tab <- tabItem(tabName = "topics_tab",
                       fluidRow(
                         
                         box(title = "Model Selection:",
                             width = 12,
                             solidHeader = T,
                             status = "primary",
                             collapsible = T,
                             h4("Topic modelling allows you to find the larger themes or topics that might be 
                             present in a document based on the similarity between documents and words. Below, 
                                you will enter what type of model you wish to view, the number of topics you might 
                                expect to find in your documents, the number of terms you want to view in your 
                                output, and a random number (seed) to start the analysis on."),
                             br(),
                             h4("LDA stands for Latent Dirichlet Allocation, which estimates topics based on 
                                the idea that every document includes a mix of topics, and every topic includes 
                                a mix of words. The LDA Fit model includes this analysis with VEM 
                                (variational expectation-maximization) algorithm and estimating an alpha, while the 
                                LDA Fixed model using the VEM algorithm with a fixed alpha value. Last, the LDA Gibbs 
                                option uses a Gibbs (Bayesian) algorithm to fit the data. CTM stands for correlated topics models, 
                                which allows the correlation between topics, and this method uses a VEM algorithm."),
                             br(),
                             h4("If a box doesn't appear to update, try clicking on a different Model and then clicking back 
                                to the model you were interested in."),
                             selectInput("pick_model", "Model:",
                                       c("LDA Fit" = "LDA_fit",
                                         "LDA Fixed" = "LDA_fixed",
                                         "LDA Gibbs" = "LDA_gibbs",
                                         "CTM Fit" = "CTM_fit")
                           ), #close selectInput
                         
                        numericInput("notopics", "Number of Topics to Analyze:", 3, min = 1, max = 100),
                             
                        numericInput("noterms", "Number of Terms to Display:", 10, min = 1, max = 10000),
                        
                        numericInput("SEED", "Pick a Random Seed:", 6410, min = 1, max = 10000)
                        
                         ), #close box
                       
                        box(title = "Model Information:",
                            width = 6,
                            solidHeader = T,
                            status = "primary",
                            collapsible = T,
                            h4("Alpha: smaller alpha values indicate 
                            higher percentages of documents that were 
                            classified to one single topic."),
                            textOutput("alpha_topics"),
                            h4("Entropy: higher values indicate that 
                               topics are evenly spread."),
                            textOutput("entropy_topics")
                          
                        ), #close box
                        
                        box(title = "Topic Matrix:",
                            width = 6,
                            solidHeader = T,
                            status = "primary",
                            collapsible = T,
                            h4("The topic matrix indicates the rank of the 
                               number of topics for each document. For instance, 
                               if you select to estimate 5 topics, you will see 
                               see which topic is covered most in each document, 
                               with less covered topics ranked lower. Therefore, 
                               a score set of 5, 3, 1, 2, 4 indicates that the 5th 
                               topic was covered most in that document, and the 4th 
                               topic was covered least."),
                            DTOutput("topic_matrix")
                        ), #close box
                        
                        box(title = "Topic Summary:",
                            width = 6,
                            solidHeader = T,
                            status = "primary",
                            collapsible = T,
                            h4("This table presents the frequency of each topic as the top 
                               choice for each document (i.e., a frequency of the number of times 
                               that the topic was listed as the most likely for a document."),
                            DTOutput("topic_summary")
                        ), #close box
                        
                        box(title = "Terms by Topic:",
                            width = 6,
                            solidHeader = T,
                            status = "primary",
                            collapsible = T,
                            h4("This table presents the most frequent terms for each of the topics 
                               that were estimated."),
                            DTOutput("topic_terms")
                        ), #close box
                        
                        box(title = "Beta Weight Graph:",
                            width = 12,
                            solidHeader = T,
                            status = "primary",
                            collapsible = T,
                            h4("This graph shows the number of terms you selected for each topic 
                            graphed by beta, which is the probability that the term was included 
                            in that topic."),
                            plotOutput("beta_plot")
                        ) #close box
                        ) #close fluidRow
                      ) #close tab
