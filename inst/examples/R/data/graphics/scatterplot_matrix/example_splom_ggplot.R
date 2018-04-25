library("MASS")
library("ggplot2")
library("GGally")
ggpairs(Boston, columns=c(6,13,14))