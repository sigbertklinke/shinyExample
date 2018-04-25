library("MASS") # for Boston Housing data
library("randomForest")
model <-randomForest(medv~., data=Boston)
summary(model)
imp <- importance(model)
ind <- order(imp, decreasing=T)
imp[ind,]