library("MASS") # for Boston Housing data
library("vioplot")
pdf("violin.pdf", bg="transparent", width=10, height=6)
par(mfrow=c(2,1))
vioplot(Boston$medv, horizontal=TRUE)
title(main="medv (default h)")
vioplot(Boston$medv, h=1, horizontal=TRUE)
title(main="medv (h=1)")
dev.off()