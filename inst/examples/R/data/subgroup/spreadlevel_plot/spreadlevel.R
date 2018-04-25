library("MASS") # for Boston Housing Data
library("car")
pdf("spreadlevel.pdf", width=10, height=6)
spreadLevelPlot(Boston$medv, Boston$rad)
dev.off()