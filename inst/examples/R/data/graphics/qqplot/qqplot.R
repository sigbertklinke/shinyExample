pdf("qqplot.pdf", bg="transparent")
qqnorm(iris$Petal.Length, main="Normal Q-Q Plot iris$Petal.Length", pch=19, cex=0.5)
qqline(iris$Petal.Length, lwd=2)
dev.off()
