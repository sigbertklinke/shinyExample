fun <- function(x) { return ( 0.25-(x-0.5)^2); }
dfun <- function(x) { return ( 1-2*x); }


x <- (0:100)/100
y <- fun(x)
pdf("HolyTrinity.pdf", width=10, height=7)
plot(x,y, type="l", ylab="", xlab="", xaxt="n", yaxt="n", main="LogLikelihood")
pos= c(0.45, 0.5, 0.75)
abline(v=pos[2], lty="dashed")
abline(v=pos[3], lty="dashed")
abline(h=fun(pos[2]), lty="dashed")
abline(h=fun(pos[3]), lty="dashed")
arrows(0, fun(pos[2]), 0, fun(pos[3]), code=3)
text(0, mean(fun(pos[2:3])), "Likelihoodratio test", pos=4)
lines(c(pos[1], pos[1]), c(-0.05, 0.05), lty="dashed")
arrows(pos[1], 0.05, pos[3], 0.05, code=3)
text(mean(pos[1:3]), 0.05, "Wald test", pos=3)
diff <- c(-0.15, 0.15)
xp   <- pos[3]+diff
yp   <- fun(pos[3])+diff*dfun(pos[3])
lines(xp, yp)
text(pos[3], 0.01+fun(pos[3]), "Score test", pos=4)

axis(1, at=pos, labels=c(expression(theta), expression(hat(theta)[1]), expression(hat(theta)[0])))
axis(2, labels=F)
dev.off()