library("MASS") # for Boston Housing datadensity
library("ggplot2")
ggplot(Boston, aes(x=medv)) + geom_density(bw=0.7)