library("MASS") # for Boston Housing data
library("ggplot2")
d <- ggplot(Boston, aes(x=medv, y=0)) 
d + geom_point(position=position_jitter(height=0.1))