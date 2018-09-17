library("MASS")
q <- 0.2
# MAR
xmar <- Boston
logl <- scale(log(Boston$lstat))
p    <- 2*q*pnorm(logl)
mar  <- (p>runif(nrow(Boston)))
xmar$medv[mar] <- NA