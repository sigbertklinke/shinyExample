setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) # RStudio only
#
library("shinyExample")
n <- sampleSizeIn('n')
r <- correlationIn('r')
makeShinyApp(input=list(r, n),
             output=plotOut('plot', file='corr.R')
)
