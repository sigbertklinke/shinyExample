zfaithful <- apply(faithful, 2, scale)
mcolor    <- colorRamp(c("red", "blue"))
# fuzzy c-means 1
library("e1071")
cl1 <- cmeans(zfaithful, 2)
col <- rgb(mcolor(cl1$membership[,1]), max=255)
plot(zfaithful, pch=19, col=col)
# fuzzy c-means 2
library("cluster")
cl2 <- fanny(zfaithful, 2)
col <- rgb(mcolor(cl2$membership[,1]), max=255)
plot(zfaithful, pch=19, col=col)
# compare membership values
plot(cl1$membership[,1], cl2$membership[,2])