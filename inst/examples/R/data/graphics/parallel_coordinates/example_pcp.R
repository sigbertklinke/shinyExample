library("MASS") # for Boston Housing data
parcoord(Boston)
#
library("lattice")
parallelplot(Boston, horizontal.axis=F)
#
library("ggplot2")
library("GGally")
ggparcoord(Boston, columns=1:14) + geom_line()