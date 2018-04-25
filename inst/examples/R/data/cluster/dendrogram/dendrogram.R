library("cluster")
pdf("dendrogram.pdf")
hc <- hclust(dist(USArrests))
plot(hc)
dev.off()

clus <- cutree(hc, 3)
col <- c('black', 'blue', 'red')
pdf("pcplot.pdf")
clusplot(USArrests, clus, col.p=col[clus], plotchar=F, pch=19, cex=0.75)
dev.off()

pdf("dendrogram2.pdf", width=10, height=6)
par(mfrow=c(1,2))
ncl <- 10
plot(hc, hang=-1, main="Cluster Dendrogram with hang=-1")
par(mar=c(6,4,3.75,2))
plot(1:ncl, rev(hc$height)[1:ncl], type="b", xlab="Number of clusters", ylab="Height", ylim=c(-110,300))
dev.off()