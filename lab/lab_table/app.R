library(shiny)
library(DT)
library(MOTE)
options(scipen = 999)

#load data
labtable = read.csv("../lab_table.csv")

#clean up journal information
labtable$Full.Reference = with(labtable, paste(author, year, ref_title,
                                            ref_journal, ref_volume, 
                                            ref_page, ref_doi, sep = ". "))
#clean up the tags
labtable$Tag.List = apply(labtable[ , 21:66] == 1, 1, function(x) { toString(names(which(x))) } )

#clean up the stimuli
labtable$Stimuli.List = paste(labtable$no1, " ", labtable$type1, ", ",
                              labtable$no2, " ", labtable$type2, sep = "")

labtable$Stimuli.List = gsub("NA", "", labtable$Stimuli.List, ignore.case = F)
labtable$Stimuli.List = gsub(",\\s\\s$", "", labtable$Stimuli.List, ignore.case = F)

#selectizeInput(
#  'e2', '2. Multi-select', choices = state.name, multiple = TRUE),

ui = fluidPage(
  sidebarLayout()
  titlePanel("LAB Table List"),
  DTOutput('tbl'))

server = function(input, output) {
  output$tbl = renderDT(
    labtable[ , 76:78], 
    extensions = 'Responsive',
    options = list(
      dom = 'tp'
    ),
    rownames = FALSE
    
  )
}

shinyApp(ui, server)