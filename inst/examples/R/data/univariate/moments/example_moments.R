data(Boston, package="MASS")
# 
mean(Boston$medv)
var(Boston$medv)
#
library("moments")
all.moments(Boston$medv)
all.moments(Boston$medv, central=T)
all.moments(Boston$medv, order.max=4)