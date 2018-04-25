id <- function(x) { return(x); }
#
library("MASS") # for Boston Housing data
library("vioplot")
args <- tapply(Boston$medv, Boston$rad, FUN=id)
args$names <- names(args)
names(args)[1] <- 'x'
do.call("vioplot", args)
title(main="Violin plot", xlab="rad", ylab="medv")