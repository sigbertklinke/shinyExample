zfaithful <- scale(faithful)
d <- dist(zfaithful)
# hclust
cl1 <- hclust(d)
plot(cl1)
# agnes
library("cluster")
cl2 <- agnes(d)
plot(as.dendrogram(cl2))