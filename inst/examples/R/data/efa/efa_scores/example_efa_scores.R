library("psych")
bfi2 <- na.omit(bfi[,1:25])
# ML with Kaiser normalization
fa1 <-factanal(bfi2, factors=5, scores="regression")
head(fa1$scores)
# oblimin rotation without Kaiser normalization
fa2 <- fa(bfi2, nfactors=5)
head(fa2$scores)
# compare scores
cor(fa1$scores, fa2$scores)