library("MASS")  # for Boston Housing data
library("np")
bw <- npregbw(medv~lstat+rm, data=Boston)
mhat <- npreg(bw)
plot(mhat)
plot(Boston$lstat, Boston$rm, pch=19, cex=0.5)