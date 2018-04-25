library("rpart")
library("MASS")  # for Boston Housing data
model <- rpart(medv~lstat+rm, data=Boston)
summary(model)
plot(model)
text(model)