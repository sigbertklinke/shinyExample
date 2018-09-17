library("psych")
# extract first factor
bfi2 <- bfi[complete.cases(bfi[,1:25]),]
fa   <- fa(bfi2)
vars <- (abs(fa$loadings)>0.5)
# create corrected items matrix
keys  <- vars*sign(fa$loadings)
keys  <- keys[vars]
items <- reverse.code(keys, bfi2[,vars])
tail(items)
# additivity test
library("additivityTests")
tukey.test(items)