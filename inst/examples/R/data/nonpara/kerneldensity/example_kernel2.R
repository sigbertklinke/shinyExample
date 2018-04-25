library("MASS")  # for Bostonh Housing data
library("np")
bw <- npudensbw(~medv+lstat, data=Boston, 
                bwmethod="normal-reference")
fhat <- npudens(bw)
plot(fhat)