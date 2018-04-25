library("MASS") # for Boston Housing data
library("ggplot2")
library("GGally")
ggparcoord(Boston, columns=1:14) + geom_line()