rm(list=ls())
#rf <- list.files(path="/home/sigbert/syncthing/projekte/R/shinyExample/R", pattern="*.R", full.names = TRUE)
rf <- list.files(path="/home/sk/syncthing/projekte/R/shinyExample/R", pattern="*.R", full.names = TRUE)
for (i in 1:length(rf)) try(source(rf[i]))

breaks <- sliderIn('breaks', 'Number of bins', min=1, max=50, value=10)
makeShinyApp(input=breaks,
             output=plotOut('plot', file='hist1.R'))