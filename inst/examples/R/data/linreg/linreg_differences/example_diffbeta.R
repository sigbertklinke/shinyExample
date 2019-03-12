data(Boston, package="MASS")
lm <- lm(medv~., data=Boston)
n <- nrow(Boston)
p <- ncol(Boston)
# SDBETA
SDBETA <- dfbetas(lm)
plot(SDBETA[, 'lstat'], main="lstat", pch=19)
abline(h=c(-2,2)/sqrt(n), col="red")
# SDFITS
SDFITS <- dffits(lm)
plot(SDFITS, pch=19)
abline(h=c(-1,1), col="red")
abline(h=c(-2,2)*sqrt(p/n), col="darkred")