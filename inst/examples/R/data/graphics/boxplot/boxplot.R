library("MASS") # for Boston Housing data
pdf("boxplot.pdf", bg="transparent", width=10, height=6)
par(mfrow=c(1,2))
boxplot(medv~rad, data=Boston, main="Boxplot")
boxplot(medv~rad, data=Boston, notch=T, main="Notched boxplot")
dev.off()