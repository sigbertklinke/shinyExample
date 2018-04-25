library("MASS") # for Boston Housing data
pdf("stripchart.pdf", width=10, height=7)
par(mfrow=c(3,1))
stripchart(Boston$medv, main="overplot")
stripchart(Boston$medv, method="stack", main="stack")
stripchart(Boston$medv, method="jitter", main="jitter")
dev.off()