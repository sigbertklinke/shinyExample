library("lattice")
cloud(z~x*y, data=randu, perspective=F)

set.seed(0)
runif(10)
set.seed(0)
runif(10)
set.seed(1)
runif(10)