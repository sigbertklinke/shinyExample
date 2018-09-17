rm(list=ls())
#rf <- list.files(path="/home/sigbert/syncthing/projekte/R/shinyExample/R", pattern="*.R", full.names = TRUE)
rf <- list.files(path="/home/sk/syncthing/projekte/R/shinyExample/R", pattern="*.R", full.names = TRUE)
for (i in 1:length(rf)) try(source(rf[i]))

library("shinyExample")
makeShinyApp(output=plotOut('plot', file='hist0.R'))