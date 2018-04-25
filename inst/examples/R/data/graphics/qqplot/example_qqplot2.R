library("MASS") # for Boston Housing data
library("lattice")
qqmath(~medv, data=Boston, panel = function(x, ...) {
         panel.qqmathline(x, ...)
         panel.qqmath(x, ...)
      })
#
library("ggplot2")
d <- ggplot(Boston, aes(sample=medv)) + stat_qq() 
d + geom_abline(intercept = mean(Boston$medv), 
                slope = sd(Boston$medv))