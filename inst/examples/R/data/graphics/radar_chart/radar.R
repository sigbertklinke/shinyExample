library("MASS") # for Boston Housing data
bmin <- apply(Boston, 2, min)
bmax <- apply(Boston, 2, max)
sBoston <- scale(Boston, center=bmin, scale=bmax-bmin)
pdf("radar.pdf", width=10, height=6)
stars(sBoston[1:25,], scale=F, lwd=2)
dev.off()