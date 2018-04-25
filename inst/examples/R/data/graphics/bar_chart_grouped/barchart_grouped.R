library("MASS") # for Boston Housing data
tab <- table(Boston$chas, Boston$rad)
pdf("barchart_grouped.pdf", width=10, height=5)
barplot(tab, col=c("blue","red"), beside=T)
dev.off()