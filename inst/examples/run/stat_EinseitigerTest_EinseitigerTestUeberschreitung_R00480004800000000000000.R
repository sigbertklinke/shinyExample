pdf("stat_EinseitigerTest_EinseitigerTestUeberschreitung_R00480004800000000000000.pdf", width=7.0, height=7.0)
cat("<!--START-->\n")
par(mfrow=c(2,1), mar=c(4,3,1,1))
#
plot(0,0, type="n", xlim=c(-40,40), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.045), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")
xx1 <-c(15, 15:40)
yy1 <-c(0, dnorm(c(15:40), mean=0, sd=10))
polygon(xx1, yy1, col="lightgreen", border=NA)
#
xx1 <- (-40:40)
yy1 <- dnorm(xx1, mean=0, sd=10)
lines(xx1, yy1, col="red", lty=1, lwd=4)
abline(v=15, col="black", lwd=3)
text(17, 0.005, expression(alpha), col = "black", cex=1.25)
axis( side=1, at=c(15), labels=c("c"), tick=FALSE)
axis( side=2, at=c(0.039), labels=c("f(v)"), tick=FALSE)
text(+30, 0.0425, expression(paste("Ablehnungsbereich ", H[0])))
text(0, 0.0425, expression(paste("Annahmebereich ", H[0])))
#
plot(0,0, type="n", xlim=c(-40,40), xaxt="n", yaxt="n",ylab="", xlab="", col="red", ylim=c(0.0,0.045), lty=1, lwd=4, font.lab=2, "xaxs"="i" ,"yaxs"="i", bty="l")
xx1 <-c(18, 18:40)
yy1 <-c(0, dnorm(c(18:40), mean=0, sd=10))
polygon(xx1, yy1, col="aquamarine", border=NA)
#
xx1 <- (-40:40)
yy1 <- dnorm(xx1, mean=0, sd=10)
lines(xx1, yy1, col="red", lty=1, lwd=4)
abline(v=18, col="black", lwd=3, lty=2)
text(19.5, 0.002, expression(P), col = "black", cex=1.25)
axis( side=1, at=c(20), labels=c("v"), tick=FALSE)
axis( side=2, at=c(0.039), labels=c("f(v)"), tick=FALSE)
#
#<!--END-->
dev.off()
