par(mfrow=c(1,2))

x <- seq(0,1,0.1)
fx <- (x/2)+(3/4)
plot(x, fx, type = "l", main="Randverteilung von X: f(x) = x/2 + 3/4", xlab="x", ylab="f(x)",
     col="darkred",xlim=c(0,1), ylim=c(0,2), lwd = 2)


y <- seq(0,1,0.1)
fy <- 3*y/2 + 1/4
plot(y, fy, type = "l", main="Randverteilung von Y: f(y) = 3y/2 + 1/4", xlab="y", ylab="f(y)",
     col="darkblue",xlim=c(0,1),ylim=c(0,2), lwd = 2)
