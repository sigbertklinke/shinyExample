s<-seq(-5,5,b=0.001)
alpha<-0.025
par(ps = 12, cex = 1, cex.main = 1)
png(file="tdist.png", width=840, height=420, bg="transparent")
plot (range(s),c(0,0.4),type="n", xlab="",ylab="density",pin=c(2,2),main="t-distribution with n degrees of freedom: densities and 97.5%-quantiles")
lines(s,dnorm(s),lwd=1.5, col="blue")
lines(s,dt(s,2), lwd=1.5, col="red" )
lines(s,dt(s,4), lwd=1.5, col="green" )
lines(s,dt(s,10), lwd=1.5, col="black" )
#points(c(qnorm(1-alpha),qnorm(1-alpha)),c(0,2), col="blue",type="o", lty=5)
points(qnorm(1-alpha),0,   col="blue",   pch=16)
points(qt(1-alpha,2),0,    col="red",   pch=16)
points(qt(1-alpha,4),0,    col="green", pch=16)
points(qt(1-alpha,10),0,    col="black", pch=16 )
legend("topleft", 
       legend=c("N(0; 1)",expression(t[4]),expression(t[2]),expression(t[1])), 
       lty=c(1,1),
       lwd=c(1.5,1.5,1.5,1.5),
       col=c("blue","black","green","red"))
legend("topright", 
       legend=sprintf("%.3f", c(qnorm(1-alpha), qt(1-alpha, 10), qt(1-alpha, 4), qt(1-alpha, 2))),
       col=c("blue","black","green","red"),
       pch=19,
       title="97.5% quantiles")
dev.off()