par(mfrow=c(1,2))
x <- seq(-4,4,by=.1)

plot(x, dnorm(x), type = "l", main = "Dichtefunktion", ylab = "f(x)", 
     yaxs = "i", ylim = c(0,1), lwd = 3)
cord.x <- c(-4,seq(-4,-1,0.01),-1) 
cord.y <- c(0,dnorm(seq(-4,-1,0.01)),0)
polygon(cord.x, cord.y, col = "skyblue")
text(x = -1.5, y = 0.05, "F(b)", cex = 0.7)
text(x = -1, y = -0.05, "b", cex = 0.9, xpd = TRUE)
text(x = 0, y = dnorm(0)+0.05, "f(x)", cex = 1.1, xpd = TRUE)

plot(x, pnorm(x), , type = "l", main = "Verteilungsfunktion", lwd = 3,ylab = "F(x)",
     yaxs = "i")
lines(c(-1, -1), c(-1, pnorm(-1)-0.02), lwd = 4, col = "skyblue")
text(x = -1, y = -0.05, "b", cex = 0.9, xpd = TRUE)
text(x = 0.5, y = pnorm(1)+0.05, "F(x)", cex = 1.1, xpd = TRUE)
text(x = -1.5, y = pnorm(-1)+0.01, "F(b)", cex = 0.8, xpd = TRUE)
