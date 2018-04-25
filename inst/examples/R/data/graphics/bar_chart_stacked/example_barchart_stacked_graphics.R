library("MASS") # for Boston Housing data
tab <- table(Boston$chas, Boston$rad)
barplot(tab)