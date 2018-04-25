library("MASS") # for Boston Housing data
library("plotrix")
tab <- table(Boston$rad, Boston$chas)
tab <- 100*sweep(tab, 2, colSums(tab), "/")
pyramid.plot(tab[,1], tab[,2], 
             top.labels=c("CHAS==0","RAD","CHAS==1"), 
             labels=rownames(tab), gap=2, 
             lxcol="blue", rxcol="red")