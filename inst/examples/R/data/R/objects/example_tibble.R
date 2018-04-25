library("MASS")
# data frame
class(Boston)
head(Boston)
Boston$z
class(Boston$z)
Boston[506,]
# tibble
library("tibble")
nx <- as_tibble(Boston)
nx
dim(nx)
nx[506,]
head(nx)