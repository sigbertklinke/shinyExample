
curve(from=0, to=10, dexp(x, rate=1), ylab="f(x)", col="red", ylim=c(0.0,1.0), lty=1, lwd=4, font.lab=2, xaxp = c(0, 10, 10), yaxp=c(0.0, 1.0, 10), "yaxs"="i")
par(new=TRUE)
curve(from=0, to=10, dexp(x, rate=0.5), ylab="f(x)", col="blue", ylim=c(0.0,1.0), lty=1, lwd=4, font.lab=2, yaxp=c(0.0, 1.0, 10), "yaxs"="i")
par(new=TRUE)
curve(from=0, to=10, dexp(x, rate=0.2), ylab="f(x)", col="green", ylim=c(0.0,1.0), lty=1, lwd=4, font.lab=2, yaxp=c(0.0, 1.0, 10), "yaxs"="i")

text(2, 0.5, "lambda=1", col="red")
text(2.5, 0.3, "lambda=0.5", col="blue")
text(7, 0.12, "lambda=0.2", col="green")

title(main="Dichtefunktion (Exponentialverteilung)")
box(which="outer")