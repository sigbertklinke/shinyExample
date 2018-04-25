library("MASS") # for Boston Housing data
smedv <- sort(Boston$medv)
smedv
smedv <- sort(Boston$medv, index.return=T)
smedv$x
smedv$ix
order(Boston$medv) # does the same as smedv$ix