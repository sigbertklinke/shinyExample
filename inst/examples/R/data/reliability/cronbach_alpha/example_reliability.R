library("psych")
bfi2 <- na.omit(bfi[,1:25])
# extract first factor
fa <- fa(bfi2)
vars <- abs(fa$loadings)>0.5
# Cronbachs alpha (items not reversed)
alpha(cor(bfi2[,vars]))
# Cronbachs alpha (items reversed)
alpha(cor(bfi2[,vars]), check.keys=T)
# Cronbachs alpha and sum scores
keys <- vars*sign(fa$loadings)
si   <- scoreItems(keys, bfi2)