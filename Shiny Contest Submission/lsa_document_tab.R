lsa_document_tab <- tabItem(tabName = "lsa_document_tab",
                       fluidRow(
                         
                           box(title = "Output Choices:",
                               width = 12,
                               solidHeader = T,
                               status = "primary",
                               collapsible = T,
                               h4("On this page, you can select a specific document from your uploaded data 
                                  to calculate coherence values and summaries from based on the LSA model 
                                  calculated from the uploaded corpus."),
                               htmlOutput("document_selectUI")
                           ), #close box
                         
                           box(title = "Local Coherence:",
                               width = 6,
                               solidHeader = T,
                               status = "primary",
                               collapsible = T,
                               h4("Local coherence is the cosine calculated between two adjacent sentences. 
                                  These values represent the relationship between each sentence where higher 
                                  positive numbers represent more similar sentences. Use the buttons at the bottom of the table to download 
                                 or save the data."),
                               DTOutput("local_coherence")
                           ), #close box
                           
                           box(title = "Global Coherence:",
                               width = 6,
                               solidHeader = T,
                               status = "primary",
                               collapsible = T,
                               h4("Global coherence represent the average of each of the local coherence values, 
                                  representing an overall relatedness between sentences in a document."),
                               textOutput("global_coherence")
                           ), #close box
                           
                           box(title = "Generic Summary:",
                               width = 6,
                               solidHeader = T,
                               status = "primary",
                               collapsible = T,
                               h4("The generic summary of a document is a single sentence selected such that 
                                  the sentence has the highest coverage of the main document."),
                           textOutput("generic_summary")
                           ) # close box
                         ) #close fluidRow
                   ) #close tabItem
