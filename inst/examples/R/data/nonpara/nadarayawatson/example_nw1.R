library("MASS")  # for Boston Housing data
library("np")
bw <- npregbw(medv~lstat, data=Boston)
mhat <- npreg(bw)
main <- sprintf("%s with h=%.2f", mhat$pckertype, mhat$bw)
plot(Boston$lstat, Boston$medv, pch=19, cex=0.3, main=main)
ind <- order(Boston$lstat)
xs  <- cbind(Boston$lstat, fitted(mhat))[ind,]
lines(xs[,1], xs[,2], col="red", lwd=2)
rug(Boston$lstat)