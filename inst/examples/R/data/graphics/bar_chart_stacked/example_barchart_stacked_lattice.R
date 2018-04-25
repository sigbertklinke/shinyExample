library("MASS") # for Boston Housing data
library("lattice")
tab2 <- table(Boston$rad,  Boston$chas)
barchart(tab2)