zfaithful <- scale(faithful)
# hclust
d <- dist(zfaithful)
cl1  <- hclust(d, method="ward.D2")
memb <- cutree(cl1, 3)
# kmeans
groupm  <- aggregate(zfaithful, list(memb), mean)
centers <- cbind(groupm$eruptions, groupm$waiting)
cl2 <- kmeans(zfaithful, centers = centers)
# compare results (matching matrix)
library("xtable")
tab  <- table(ward=memb, kmeans=cl2$cluster)
xtab <- xtable(tab, caption="rows: ward, cols: kmeans")
print(xtab, file="matching_matrix.tex")