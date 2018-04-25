library("MASS") # for Boston Housing data
library("aplpack")
zBoston = scale(Boston)
faces(zBoston[1:30,], scale=F)