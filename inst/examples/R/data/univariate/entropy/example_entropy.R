data(Boston, package="MASS")
library("entropy")
ftab <- table(Boston[,9])
entropy(ftab)               # estimates the entropy from data
entropy(ftab)/length(ftab)  # estimates the normalized entropy from data