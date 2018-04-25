library("mclust") # for Swiss banknote data
data(banknote)
x <-banknote[,2:7]
z <-scale(x)
# 
kx <- kmeans(x, c=2)
plot(x$Bottom, x$Diagonal, col=kx$cluster, 
     main="Unstandardized", pch=19)
kx$centers
scale(kx$centers, center=colMeans(x), scale=apply(x, 2, sd))
#
kz <- kmeans(z, c=2)
plot(x$Bottom, x$Diagonal, 
     col=kz$cluster, main="Standardized", pch=19)