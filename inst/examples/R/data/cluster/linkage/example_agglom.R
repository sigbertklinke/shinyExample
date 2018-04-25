zfaithful <- scale(faithful)
d <- dist(zfaithful)
# hclust
cl1 <- hclust(d)
memb <- cutree(cl1, 3)
plot(zfaithful, col=memb)
# agnes
library("cluster")
cl2 <- agnes(d)
memb <- cutree(cl2, 3)
plot(zfaithful, col=memb)