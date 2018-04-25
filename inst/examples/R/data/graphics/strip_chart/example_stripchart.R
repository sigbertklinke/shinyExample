library("MASS") # for Boston Housing data
stripchart(Boston$medv, method="j")
#
library("lattice")
stripplot(~medv, data=Boston, jitter.data=T)
#
library("ggplot2")
d <- ggplot(Boston, aes(x=medv, y=0)) 
d + geom_point(position=position_jitter(height=0.1))