library("mlbench") # for Boston Housing data
data(BostonHousing2)
# prepare data
x <- BostonHousing2[,-c(1:5,10,15)]
x <- scale(x)
#
cl <- kmeans(x, 2)
par(mfrow=c(1,1))
main <- sprintf("Total variance explained %.0f%%", 
                100*cl$betweenss/cl$totss)
plot(BostonHousing2$lon, BostonHousing2$lat, col=cl$cluster, 
     main=main, pch=19, cex=0.5)