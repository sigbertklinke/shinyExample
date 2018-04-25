library("psych")
library("lattice")
# bfi: 25 personality self report items taken from 
# the International Personality Item Pool
names(bfi)
bfi2 <- na.omit(bfi[,1:25])
# inverse and partial correlations
p  <- solve(cor(bfi2, use="complete.obs"))
print(levelplot(p, main="Inverse & partial correlations"), split=c(1,1,2,1), more=TRUE)
# anti-image
pr <- -p/sqrt(outer(diag(p), diag(p)))
print(levelplot(pr, main="Anti-Image correlation"), split=c(2,1,2,1), more=FALSE)
# Kaiser-Meyer-Olkin & MSA
KMO(bfi2)
# Bartlett test of sphericity
cortest.bartlett(bfi2)