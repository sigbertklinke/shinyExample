library("deldir")
y  <- iris$Sepal.Width
x  <- iris$Sepal.Length
pdf('Voronoi_diagram.pdf', width=10)
plot(x,y, type="n", xlab="", ylab="", axes=F, asp=T)
cl <- kmeans(cbind(x,y), 40)
vtess <- deldir(cl$centers[,1], cl$centers[,2])
points(cl$centers[,1], cl$centers[,2], pch=19, col="red", cex=0.75)
points(x, y, pch=19, col="blue", cex=0.5)
plot(vtess, wlines="tess", wpoints="none", number=FALSE, add=TRUE, lty=1, col="grey")
box()
dev.off()