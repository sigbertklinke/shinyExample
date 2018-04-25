library("MASS")   # for Boston Housing data
cor <- cor(Boston[,c(-4,-9)])
pdf("heatmap1.pdf", width=6, height=6, bg="transparent")
heatmap(cor, revC=T, col=topo.colors(12))
dev.off()
#
library("plotrix")
pdf("heatmap2.pdf", width=6, height=6, bg="transparent")
color2D.matplot(cor, show.legend=T, show.values=T, axes=F)
axis(1, at=seq(nrow(cor))-0.5, labels=colnames(cor))
axis(2, at=seq(nrow(cor))-0.5, labels=rownames(cor))
dev.off()