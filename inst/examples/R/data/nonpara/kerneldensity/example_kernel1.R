library("MASS")  # for Bostonh Housing data
library("np")
bw   <- npudensbw(~medv, data=Boston)
fhat <- npudens(bw)
fhat
plot(fhat, main=sprintf("%s with h=%.2f", fhat$pckertype, fhat$bw))
rug(Boston$medv)