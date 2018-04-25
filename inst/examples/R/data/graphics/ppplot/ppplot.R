library("qualityTools")
pdf("ppplot.pdf", bg="transparent")
ppPlot(iris$Petal.Length, main="Normal P-P Plot iris$Petal.Length", pch=19, cex=0.5)
dev.off()
