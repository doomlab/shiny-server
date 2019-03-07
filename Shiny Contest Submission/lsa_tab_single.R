lsa_tab_single <- tabItem(tabName = "lsa_tab_single",
  fluidRow(
    
    box(title = "Output Choices",
        width = 12,
        solidHeader = T,
        status = "primary",
        collapsible = T,
        h4("This page shows you the relation between a single selected word in the corpus to other related 
           words in the corpus. First, select the word that you are interested in viewing. Next, select the number 
           of related words that you would like to view. Last, select the range of cosine values that you would like 
           to view."),
        htmlOutput("rownames_selectUI"),
        numericInput("neighbors", "Number of Neighbors to Display:", 10, min = 1, max = 100),
        sliderInput(inputId = "select_range", 
                    label = "Set Cosine Range:", 
                    min = -1, 
                    max = 1,
                    value = c(-1,1),
                    step = .01)
    ), #close box

    box(title = "Plot of Nearest Neighbors:",
        width = 6,
        solidHeader = T,
        status = "primary",
        collapsible = T,
        h4("This plot displays the neighbors of the selected word in two-dimensional space. 
           The closeness of the concepts (i.e., how far apart they are) indicates how related they are 
           to each other in this corpus."),
        plotOutput("lsa_plotneighbors")
    ), #close box
    
    box(title = "Neighbors Within Selected Cosine Range:",
        width = 6,
        solidHeader = T,
        status = "primary",
        collapsible = T,
        h4("This table presents words that are related to the selected word in the cosine range that you selected. 
           You will see the same number of related words as your choice in Numbers of Neighbors to Display. 
           Note: these are a random selection of words in the target cosine range. Use the buttons at the bottom of 
           the table to download or save the data."),
        DTOutput("lsa_choosetarget")
    ) #close box
  ) #close fluidRow
) #close tabItem


# corpus section ----------------------------------------------------------

lsa_tab_single_corpus <- tabItem(tabName = "lsa_tab_single_corpus",
                          fluidRow(
                            
                            box(title = "Output Choices",
                                width = 12,
                                solidHeader = T,
                                status = "primary",
                                collapsible = T,
                                h4("This page shows you the relation between a single selected word in the corpus to other related 
           words in the corpus using our preloaded English corpus from Wikipedia and the British National Corpus.  
           First, select the word that you are interested in viewing, and only the first 200 most frequent 
           words are shown to keep the app running smoothly. Next, select the number 
           of related words that you would like to view. Last, select the range of cosine values 
           that you would like to view."),
                                selectInput("rownames_select_corpus", 
                                            "Select target word:", rownames(wonderland)[1:200]),
                                numericInput("neighbors_corpus", "Number of Neighbors to Display:", 10, min = 1, max = 100),
                                sliderInput(inputId = "select_range_corpus", 
                                            label = "Set Cosine Range:", 
                                            min = -1, 
                                            max = 1,
                                            value = c(-1,1),
                                            step = .01)
                            ), #close box
                            
                            box(title = "Plot of Nearest Neighbors:",
                                width = 6,
                                solidHeader = T,
                                status = "primary",
                                collapsible = T,
                                h4("This plot displays the neighbors of the selected word in two-dimensional space. 
           The closeness of the concepts (i.e., how far apart they are) indicates how related they are 
           to each other in this corpus."),
                                plotOutput("lsa_plotneighbors_corpus")
                            ), #close box
                            
                            box(title = "Neighbors Within Selected Cosine Range:",
                                width = 6,
                                solidHeader = T,
                                status = "primary",
                                collapsible = T,
                                h4("This table presents words that are related to the selected word in the cosine range that you selected. 
           You will see the same number of related words as your choice in Numbers of Neighbors to Display. 
           Note: these are a random selection of words in the target cosine range. Use the buttons at the bottom of 
           the table to download or save the data. If one or more of the buttons are grayed out 
                                   be sure your Adobe Flash plug-in is enabled."),
                                DTOutput("lsa_choosetarget_corpus")
                            ) #close box
                          ) #close fluidRow
) #close tabItem
