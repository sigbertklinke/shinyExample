library("MASS") # for Boston Housing data
library("lattice")
qqmath(~medv, data=Boston, panel = function(x, ...) {
         panel.qqmathline(x, ...)
         panel.qqmath(x, ...)
      })