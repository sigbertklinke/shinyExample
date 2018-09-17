rm(list=ls())
#rf <- list.files(path="/home/sigbert/syncthing/projekte/R/shinyExample/R", pattern="*.R", full.names = TRUE)
rf <- list.files(path="/home/sk/syncthing/projekte/R/shinyExample/R", pattern="*.R", full.names = TRUE)
for (i in 1:length(rf)) try(source(rf[i]))

#dataMake('mmstat.RDS', Boston=Boston)

data   <- dataIn("data", "Choose data set", file="mmstat.RDS",
                 varIn("var1", "Choose variable", type=is.numeric)
                 )
#lang   <- langIn("lang", "Choose language")
lang  <- selectIn("lang", "Select language", c("German", "English"))
#
breaks <- sliderIn("breaks", "Number of bins", min=1, max=50, value=30)
rug    <- checkboxIn("rug", "Show observations")
makeShinyApp(input=list(breaks, rug, data, lang),
             output=plotOut('plot', file='hist.R')
)
