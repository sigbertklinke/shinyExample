x <- (-300:300)/100
plot(x, dnorm(x), type="l", 
 main=expression(paste("Density function of X~N(", mu, "=0,", sigma^2, "=1)")))