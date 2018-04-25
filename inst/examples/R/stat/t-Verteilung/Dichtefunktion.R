curve(from=-3, to=3, dt(x, df=1), ylab="f(x)", col="red", ylim=c(0.0,0.45), lty=1, lwd=4, font.lab=2, xaxp = c(-3, 3, 6), yaxp=c(0.0, 0.4, 4), "yaxs"="i")
par(new=TRUE)
curve(from=-3, to=3, dt(x, df=5), ylab="f(x)", col="blue", ylim=c(0.0,0.45), lty=1, lwd=4, font.lab=2, xaxp = c(-3, 3, 6), yaxp=c(0.0, 0.4, 4), "yaxs"="i")
par(new=TRUE)
curve(from=-3, to=3, dt(x, df=99999999), ylab="f(x)", col="green", ylim=c(0.0,0.45), lty=1, lwd=4, font.lab=2, xaxp = c(-3, 3, 6), yaxp=c(0.0, 0.4, 4), "yaxs"="i")

text(0, 0.29, "t=1", col="red", cex=1.5)
text(0, 0.34, "t=5", col="blue", cex=1.5)
text(0.12, 0.42, labels=expression(infinity), col="green", cex=1.5)
text(-0.12, 0.42, labels="t=", col="green", cex=1.5)

title(main="Dichtefunktion (t-Verteilung)")
box(which="outer")