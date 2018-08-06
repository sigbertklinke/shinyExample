x = c(3500,5000,4300,6100,1000,4800,2900,2400,5600,4100)
y = c(2000,3500,3100,3900,900,3000,2100,1900,2900,2100)

model = lm(y~x)

plot(x, y, xlab="Einkommen*E3", ylab="Konsum*E2", col="red", cex=2, pch=20, xaxt="n", yaxt="n")
axis(1, at=seq(1000,6000,by=1000), label=seq(1,6,by=1))
axis(2, at=seq(1000,4000,by=500), label=seq(10,40,by=5), las=2)

#abline(423.12969, 0.53322, lwd=2, col="black")

s=c(2000,3000,1500,300, 6000)
color=c("blue", "yellow", "green", "orange", "brown")
for (i in 1:length(s))
  abline(s[i], (mean(y)-s[i])/(mean(x)), lwd=2, col=color[i])
