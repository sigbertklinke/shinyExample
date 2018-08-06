
Einkommen <-c(1884.90,1915.30,2060.90,2062.15,2110.30,2126.50,2163.10,2168.50,2203.85,2241.15,2243.15,2267.75,2298.80,2317.00,2319.55,2361.25,
              2363.50,2395.25,2413.40,2415.00,2567.50,2607.25,2635.00,2659.00,2774.30)
Nr <- c(1:25)
Einkommen2 <- sample(Einkommen)
mean <- mean(Einkommen)

par(las=1)
plot(Einkommen2, Nr, pch=16, col="blue", xlab="mittleres Haushaltsnettoeinkommen", "bty"="l", font.lab=2, ylab="Nr. der Stichprobe", xaxt="n", xlim=c(1800, 2800), "xaxs"="i", ylim=c(0,26), yaxp=c(0, 26, 13), "yaxs"="i", sub="Abb. 1: Sch\u00E4tzwerte von 25 Zufallsstichproben des Stichprobenumfangs n = 20")
axis(at=c(1800, 2000, 2200, 2400, 2600, 2800), side=1, tick=TRUE, labels=TRUE, lwd.ticks=2)
abline(v=2365, lwd=6, lty=2)
