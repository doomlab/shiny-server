library(shiny)
library(DT)
library(MOTE)
library(reshape)
options(scipen = 999)

tagwordtable = read.csv("../TagWordTab.csv")
tagworddata = read.csv("../lab_table.csv")

tagworddata = tagworddata[ , c("aoa","ambiguity","arousal","assoc","category",
                               "cloze","complex","concrete","confusion","dist",
                               "dominate","easelearn","familiar","freq","gpc",
                               "identify","identifyld","identifyn","imageagree",
                               "imagevar", "imagine","intense","letters", "meaning",
                               "modality","morph","nameagree","orthon","pos",
                               "phonemes","phonon","prime","pronounce",
                               "rt","recall","recognition","rime","semantic",
                               "sensory","sentcomp","similar","syllables",
                               "typical","valence","visualcomp","wordcomp","year")]

longtag = melt(tagworddata,
                   id = c("year"),
                   measured = c("aoa","ambiguity","arousal","assoc","category",
                                "cloze","complex","concrete","confusion","dist",
                                "dominate","easelearn","familiar","freq","gpc",
                                "identify","identifyld","identifyn","imagevar",
                                "imagine","intense","meaning","modality","morph",
                                "nameagree","orthon","pos","phonon","prime","pronounce",
                                "rt","recall","recognition","rime","semantic",
                                "sensory","sentcomp","typical","valence","visualcomp",
                                "wordcomp","syllables","letters","phonemes","imageagree",
                                "similar"))
longtag$year = as.numeric(as.character(longtag$year))
longtag$year[is.na(longtag$year)] = 1999
tagwordtable$r = apa(as.matrix(by(longtag, longtag$variable, function(x) {cor(x$year, x$value)}))[ , 1],3, F)
tagwordtable$N = table(longtag$variable[longtag$value == 1])


ui = fluidPage(
  titlePanel("Tag Variable List"),
  DTOutput('tbl'))

server = function(input, output) {
  output$tbl = renderDT(
    tagwordtable, 
    extensions = 'Responsive',
    options = list(
      dom = 'tp'
    ),
    rownames = FALSE
    
  )
}

shinyApp(ui, server)