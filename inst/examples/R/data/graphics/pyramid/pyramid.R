library("MASS") # for Boston Housing data
#install.packages("plotrix")
library("plotrix")
tab <- table(Boston$rad, Boston$chas)
tab <- 100*sweep(tab, 2, colSums(tab), "/")
pdf("pyramid.pdf", width=10, height=5, bg="transparent")
pyramid.plot(tab[,1], tab[,2], top.labels=c("CHAS==0","RAD","CHAS==1"), labels=rownames(tab), gap=2, lxcol="blue", rxcol="red")
dev.off()