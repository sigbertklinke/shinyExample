tit  <- as.data.frame(Titanic)
ind  <- rep(seq(nrow(tit)), tit$Freq) 
x    <- tit[ind,]
#
fit <- rpart(Survived~Class+Sex+Age, data=x)
fit
#
fit <- rpart(Survived~Class+Sex+Age, data=x, 
             method="class", 
             parms=list(split="information"))
fit
plot(fit); text(fit)