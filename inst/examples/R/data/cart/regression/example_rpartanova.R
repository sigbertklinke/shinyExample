library("MASS") # for Boston Housing data
library("rpart")
model <-rpart(medv~., data=Boston)
print(model)
plot(model); text(model, cex=0.8)