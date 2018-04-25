library("psych")
bfi2 <- na.omit(bfi[,1:25])
# various coefficients
splitHalf(bfi2)