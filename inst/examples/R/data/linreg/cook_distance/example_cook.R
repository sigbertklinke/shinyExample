data(Boston, package="MASS")
lm <- lm(medv~., data=Boston)
plot(cooks.distance(lm), pch=19, main="Cook's distances",
		 cex=0.5)
# 
n <- nrow(Boston)
p <- ncol(Boston)
abline(h=4/n, col="red")