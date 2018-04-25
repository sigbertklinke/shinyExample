library("MASS") # for Boston Housing data
qqnorm(Boston$medv, pch=19, cex=0.5)
qqline(Boston$medv)
#
library("lattice")
qqmath(~medv, data=Boston,
       panel = function(x, ...) {
         panel.qqmathline(x, ...)
         panel.qqmath(x, ...)
      })
#
library("ggplot2")
d <- ggplot(Boston, aes(sample=medv)) + stat_qq() 
d + geom_abline(intercept = mean(Boston$medv), 
                slope = sd(Boston$medv))