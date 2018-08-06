if(!require("RColorBrewer")) install.packages("RColorBrewer"); library("RColorBrewer")
if(!require("lattice")) install.packages("lattice"); library("lattice")
if(!require("latticeExtra")) install.packages("latticeExtra"); library("latticeExtra")

library(RColorBrewer)
library(lattice)
library(latticeExtra)

data <- read.table(text='Sport   Absolut     Beruf
                kaum  240 Arbeiter
                kaum  160 Angestellter
                kaum  35  Beamter
                kaum  40  Landwirt
                kaum  43 andere
                manchmal  120 Arbeiter
                manchmal  92  Angestellter
                manchmal  36  Beamter
                manchmal  5 Landwirt
                manchmal  38  andere
                regelm\u00E4\u00DFig  65  Arbeiter
                regelm\u00E4\u00DFig  85  Angestellter
                regelm\u00E4\u00DFig  32  Beamter
                regelm\u00E4\u00DFig  3 Landwirt
                regelm\u00E4\u00DFig  23  andere',header=TRUE)

colors <- c("cornflowerblue","deeppink4","cornsilk1","lightcyan2","purple4")
cloud(Absolut~Sport+Beruf, data, panel.3d.cloud=panel.3dbars, col.facet=colors, 
      xbase=0.4, ybase=0.4, scales=list(arrows=FALSE, col=1), 
      par.settings = list(axis.line = list(col = "transparent")))
