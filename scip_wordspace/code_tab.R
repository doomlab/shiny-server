code_tab <- tabItem(tabName = "code_tab",
  fluidRow(
    
    box(title = "Latent Semantic Analysis Code:",
        width = 12,
        solidHeader = T,
        status = "primary",
        collapsible = T,
        includeMarkdown("lsa_code.md")
        ),#close box one
    
    box(title = "Topic Models Code:",
        width = 12,
        solidHeader = T,
        status = "primary",
        collapsible = T,
        includeMarkdown("topic_code.md")
        ) #close box two
    
    ) #close fluid row
  ) #close tab item
