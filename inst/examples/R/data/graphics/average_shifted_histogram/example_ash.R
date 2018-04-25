library("MASS") # for Boston Housing data
library("ash")
ash <- ash1(bin1(Boston$medv))
plot(ash, type="s")