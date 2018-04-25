library("QuantPsyc")

x <- read.csv2("cps78_85.csv")
# select only year=85
x <- x[x$year==85,]


pdf("predictor2.pdf", width=10, height=5)
plot(x$educ, type="b", main="Sequence plot of education", ylab="Education (in years)", pch=19)
dev.off()

pdf("predictor1.pdf", width=10, height=3)
par(mfrow=c(1,2))
stripchart(x$educ, method="jitter", jitter=1, ylim=c(1,2),  main="Strip plot of education", xlab="Education (in years)")
boxplot(x$educ, horizontal=T,  main="Boxplot of education", xlab="Education (in years)")
dev.off()

pdf("mincer_exploratory.pdf", width=10, height=6)
par(mfrow=c(1,2))
plot(x$educ, x$lwage, pch=19, cex=0.5, xlab="Education (in years)", ylab="log(hourly wage)")
lm1 <- lm(lwage~educ, data=x)
abline(lm1, col="red", lwd=2)
plot(x$exper, x$lwage, pch=19, cex=0.5, xlab="Experience (in years)",  ylab="log(hourly wage)")
lm1 <- lm(lwage~exper, data=x)
abline(lm1, col="red", lwd=2)
dev.off()

lm2 <- lm(lwage~educ+exper, data=x)
summary(lm2)
lm.beta(lm2)
pdf("mincer_residuals.pdf", width=10, height=6)
par(mfrow=c(2,2))
plot(lm2, pch=19, cex=0.5, lwd=2)
dev.off()
