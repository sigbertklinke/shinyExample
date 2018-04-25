library("MASS")   # for Boston Housing data
cor <- cor(Boston[,c(-4,-9)])
heatmap(cor, revC=T, col=topo.colors(12))
#
library("lattice")
levelplot(cor, at=(-10:10)/10)