library("MASS")          # for Boston Housing data
par(mfrow=c(2,2))        # four plots in one
# use variables
plot(Boston$lstat, Boston$medv, pch=19, cex=0.5)
# use with
with(Boston, plot(lstat, medv, pch=19, cex=0.5, col="red"))
# use attach
attach(Boston)
plot(lstat, medv, pch=19, cex=0.5, col="green")
# use formula 
plot(medv~lstat, data=Boston, pch=19, cex=0.5, col="blue")
