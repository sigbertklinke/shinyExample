library("MASS")   # for Boston Housing data
x  <- Boston[,-c(1,4,9)]
dm <- sqrt(mahalanobis(x, colMeans(x), cov(x)))
sort(dm)
hist(dm)
rug(dm)