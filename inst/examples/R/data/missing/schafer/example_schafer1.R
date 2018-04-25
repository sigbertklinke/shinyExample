library("MASS")
sig <- matrix(c(625,375,375,625), ncol=2)
n   <- 50
x   <- mvrnorm(n, mu=c(125,125), Sigma=sig)
plot(x)
#na <- runif(n)<0.6                                # MCAR
na <- (x[,1]<140)                                 # MAR
#na <- (x[,2]<140)                                 # MNAR
#x <- x[!na,]                             # case deletion
#x[na,2] <- sample(x[!na,2], sum(na), r=T)     # hot deck
#x[na,2] <- mean(x[!na,2])            # mean substitution
lm <- lm(V2~V1, data=as.data.frame(x[!na,]))
b <- coefficients(lm) 
x[na,2] <- b[1]+b[2]*x[na,1]                 # cond. mean
r <- residuals(lm)
x[na,2] <- x[na,2]+sample(r, sum(na), r=T)   # pred. dist
points(x, col="red", pch=19, cex=0.75)