Einkommen <- rnorm(100, 2362, 150)
Nr <- c(1:100)

par(las=1)
plot(Einkommen, Nr, pch=16, col="blue", xlab="mittleres Haushaltsnettoeinkommen", font.lab=2, bty="l", ylab="Nr. der Stichprobe", xaxt="n", xlim=c(1, 5000), "xaxs"="i", ylim=c(0,110), yaxp=c(0, 110, 11), "yaxs"="i", sub="Abb. 4: Sch\u00E4tzwerte von 100 Zufallsstichproben des Stichprobenumfangs n = 100")
axis(at=seq(500,5000,500), side=1, tick=TRUE, labels=TRUE, lwd.ticks=2)
abline(v=2362, lwd=6, lty=2)
