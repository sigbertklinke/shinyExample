library("MASS") # for Boston Housing data
nx <- Boston[-506,]  # without obs. 506
dim(nx)
mx <- Boston[,-c(4,8,14)] # without CHAS, RAD and MEDV
dim(mx)
head(Boston)
tail(Boston)