library("MASS") # for Boston Housing data
tab <- table(Boston$rad)
pie(tab)
#
library("ggplot2")
pie <- ggplot(Boston, aes(x = factor(1), 
                          fill = factor(rad))) 
pie + geom_bar(width = 1) + coord_polar(theta = "y")