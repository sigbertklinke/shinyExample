setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) # RStudio only
#
library("shinyExample")
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
