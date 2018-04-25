library(RColorBrewer)
library(lattice)
library(latticeExtra)

data <- read.table(text='HKE  P  Altersgruppe
                   "(y1) ja"  0.01  "20-29"
                   "(y1) ja"  0.02  "30-34"
                   "(y1) ja"  0.03  "35-39"
                   "(y1) ja"  0.05  "40-44"
                   "(y1) ja"  0.06  "45-49"
                   "(y1) ja"  0.05  "50-54"
                   "(y1) ja"  0.13  "55-59"
                   "(y1) ja"  0.08  "60-69"
                   "(y2) nein"  0.09  "20-29"
                   "(y2) nein"  0.13  "30-34"
                   "(y2) nein"  0.09  "35-39"
                   "(y2) nein"  0.10  "40-44"
                   "(y2) nein"  0.07  "45-49"
                   "(y2) nein"  0.03  "50-54"
                   "(y2) nein"  0.04  "55-59"
                   "(y2) nein"  0.02  "60-69" 
                   ',header=TRUE)
 
colors <- c("cornflowerblue","deeppink4")
cloud(P~HKE+Altersgruppe, data, panel.3d.cloud=panel.3dbars, col.facet=colors, 
       xbase=0.4, ybase=0.4, scales=list(arrows=FALSE, col=1), 
       par.settings = list(axis.line = list(col = "transparent")))