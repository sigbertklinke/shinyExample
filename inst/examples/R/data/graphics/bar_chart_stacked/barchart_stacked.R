library("MASS") # for Boston Housing data
tab <- table(Boston$chas, Boston$rad)
pdf("barchart_stacked.pdf", width=10, height=5, bg="transparent")
barplot(tab, col=c("blue","red"),bg="transparent")
dev.off()