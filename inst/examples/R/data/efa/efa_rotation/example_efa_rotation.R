library("psych")
bfi2 <- na.omit(bfi[,1:25])
# ML with Kaiser normalization
factanal(bfi2, factors=5)
# oblimin rotation without Kaiser normalization
fa1 <- fa(bfi2, nfactors=5)
fa1
# apply Kaiser normalization 
fa2 <- fa(bfi2, nfactors=5, rotate="none")
fa2 <- kaiser(fa2)
fa2
# compare loading sets (vector cosines)
factor.congruence(fa1, fa2)