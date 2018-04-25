library("MASS") # for Boston Housing data
library("rpart")
ctrl  <- rpart.control(maxdepth=1)
model <- rpart(medv~., data=Boston, control=ctrl)
print(model)
plot(model) 
text(model)
summary(model)