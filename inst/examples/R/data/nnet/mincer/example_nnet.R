library("MASS")
library("nnet")
# run several times
model <- nnet(medv~lstat+rm, data=Boston, size=5, 
							linout=T, maxit=1000) 
summary(model)
plot(Boston$lstat, residuals(model), 
		 xlab="Lstat", ylab="Residuals")