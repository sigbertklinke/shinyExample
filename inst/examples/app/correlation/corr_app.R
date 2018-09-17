rm(list=ls())
#rf <- list.files(path="/home/sigbert/syncthing/projekte/R/shinyExample/R", pattern="*.R", full.names = TRUE)
rf <- list.files(path="/home/sk/syncthing/projekte/R/shinyExample/R", pattern="*.R", full.names = TRUE)
for (i in 1:length(rf)) try(source(rf[i]))

n <- sampleSizeIn('Sample size', label='n', min=30, max=500, value=30, step=10)
r <- correlationIn('Correlation', label='r', min=-1, max=+1, value=0, step=0.01)
makeShinyApp(input=list(r, n),
             output=plotOut('plot', file='corr.R')
)
