library("MASS") # for Boston Housing data
library("rpart")
model <-rpart(medv~., data=Boston, cp=0)
plot(model); text(model, cex=0.8)
printcp(model)
plotcp(model)
pmodel1 <- prune(model, cp=0.25)
pmodel1
cp      <- model$cptable[which.min(
             fit$cptable[,"xerror"]),"CP"]
pmodel2 <- prune(model, cp=cp)
pmodel2