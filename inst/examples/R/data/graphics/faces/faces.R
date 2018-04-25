library("MASS") # for Boston Housing data
library("aplpack")
pdf("faces.pdf", width=10, height=6, bg="transparent")
par(mar=c(0,0,0,0))
zBoston = scale(Boston)
faces(zBoston[1:30,], scale=F)
dev.off()