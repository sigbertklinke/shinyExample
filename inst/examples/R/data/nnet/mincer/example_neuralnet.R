library("MASS")
library("neuralnet")
model <- neuralnet(medv~lstat+rm, data=Boston, 
									 hidden=c(3,2))
plot(Boston$lstat, residuals(model), 
		 xlab="Lstat", ylab="Residuals")
plot(model)