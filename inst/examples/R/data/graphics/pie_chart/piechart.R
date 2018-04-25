library("MASS") # for Boston Housing data
tab <- table(Boston$rad)
pdf("piechart.pdf", width=10, height=7)
par(mfrow=c(1,2))
pie(tab, col=rainbow(length(tab)), main="pie")
library("plotrix")
pie3D (tab, labels=names(tab), explode=0.1, main="pie3D")
dev.off()