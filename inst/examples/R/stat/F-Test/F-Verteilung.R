curve(from=0, to=6, df(x, df1=10, df2=10), ylab="f(x)", col="black", ylim=c(0.0,1.0), lty=1, lwd=4, font.lab=2, xaxp = c(0, 6, 6), yaxp=c(0.0, 1, 5), "yaxs"="i")
par(new=TRUE)
curve(from=0, to=6, df(x, df1=10, df2=50), ylab="f(x)", col="red", ylim=c(0.0,1.0), lty=1, lwd=4, font.lab=2, xaxp = c(0, 6, 6), yaxp=c(0.0, 1, 5), "yaxs"="i")
par(new=TRUE)
curve(from=0, to=6, df(x, df1=3, df2=5), ylab="f(x)", col="blue", ylim=c(0.0,1.0), lty=1, lwd=4, font.lab=2, xaxp = c(0, 6, 6), yaxp=c(0.0, 1, 5), "yaxs"="i")
par(new=TRUE)
curve(from=0, to=6, df(x, df1=5, df2=3), ylab="f(x)", col="green", ylim=c(0.0,1.0), lty=1, lwd=4, font.lab=2, xaxp = c(0, 6, 6), yaxp=c(0.0, 1, 5), "yaxs"="i")

text(2.8, 0.2, "f1=10, f2=10", col="black", cex=1.2)
text(2.3, 0.4, "f1=10, f2=50", col="red", cex=1.2)
text(0.85, 0.20, "f1=3, f2=5", col="blue", cex=1.2)
text(0.85, 0.1, "f1=5, f2=3", col="green", cex=1.2)

title(main="Dichtefunktion (F-Verteilung)")
box(which="outer")

