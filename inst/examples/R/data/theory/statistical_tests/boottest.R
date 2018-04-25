dop <- T
set.seed(0)
x <- rchisq(500, 3)
v <- ceiling(qchisq(0.95, 3))
h <- hist(x, breaks=50)
bin <- cut(v, h$breaks, labels=FALSE)
clr <- rep("white", length(h$counts))
clr[(bin+1):length(h$counts)] <- "red"
if (dop) { pdf("boottest.pdf") }
plot(h, col=clr, main="Empirical distribution of V under H0", xlab=expression(v^i), ylab="")
lines(c(v,v), c(0,50), col="blue")
text(v, 50, expression("v=V("* x[1]* ",...,"*x[n]* ")"), col="blue", pos=4)
text(10, 20, "p-value=P(V>v)", col="red", pos=4)
for (i in 1:length(x)) { lines(c(x[i],x[i]), c(0,-5))}
if (dop) { dev.off() }




