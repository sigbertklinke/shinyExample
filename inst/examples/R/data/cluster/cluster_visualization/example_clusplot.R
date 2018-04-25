zfaithful <- scale(faithful)
# hclust
d    <- dist(zfaithful)
cl1  <- hclust(d, method="ward.D2")
memb2 <- cutree(cl1, 2)
memb3 <- cutree(cl1, 3)
#
library("cluster")
par(mfcol=c(1,2))
clusplot(zfaithful, memb2, col.p=memb2)
clusplot(zfaithful, memb3, col.p=memb3)