library("MASS")
lm <- lm(medv~., data=Boston)
plot(hatvalues(lm), pch=19, main="Leverage", cex=0.5)
# 
n <- nrow(Boston)
p <- ncol(Boston)
abline(h=(1:3)*(p+1)/n, col=c("black", "darkred", "red"))