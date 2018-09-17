library("MASS")
q <- 0.2
# MAR
xmar <- Boston
logl <- scale(log(Boston$lstat))
p    <- 2*q*pnorm(logl)
mar  <- (p>runif(nrow(Boston)))
cdplot(Boston$lstat, factor(mar))
plot(Boston$lstat, Boston$medv, pch=19, col=1+mar, cex=0.5)
xmar$medv[mar] <- NA