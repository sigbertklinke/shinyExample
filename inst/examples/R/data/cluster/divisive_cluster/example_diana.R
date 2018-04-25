library("cluster")
library("mlbench") # for Boston Housing data
data(BostonHousing2)
# prepare data
x <- BostonHousing2[,-c(1:5,10,15)]
x <- scale(x)
#
cl  <- diana(x)
hcl <- cutree(as.hclust(cl), k = 2)
par(mfrow=c(1,1))
plot(BostonHousing2$lon, BostonHousing2$lat, col=hcl, 
    pch=19, cex=0.5)