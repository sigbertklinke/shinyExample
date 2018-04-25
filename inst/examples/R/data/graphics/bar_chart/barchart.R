library("MASS") # for Boston Housing data
tab <- table(Boston$rad)
pdf("barchart.pdf", width=10, height=7)
par(mfrow=c(1,2))
plot(tab, main="plot", sub="metric discrete variable")
barplot(tab, main="barplot", sub="nominal or ordinal variable")
dev.off()