code_tab <- tabItem(tabName = "code_tab",
  fluidRow(
    
    box(title = "Latent Semantic Analysis Code:",
        width = 12,
        solidHeader = T,
        status = "primary",
        collapsible = T,
        HTML(markdown::markdownToHTML(knit("lsa_code.Rmd", quiet = T)))
        ),#close box one
    
    box(title = "Topic Models Code:",
        width = 12,
        solidHeader = T,
        status = "primary",
        collapsible = T,
        HTML(markdown::markdownToHTML(knit("topic_code.Rmd", quiet = T)))
        ) #close box two
    
    ) #close fluid row
  ) #close tab item
