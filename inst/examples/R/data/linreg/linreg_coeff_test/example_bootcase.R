plot.confint <- function (b, b.boot, ci, main) {
	hist(b.boot, main=main); rug(b.boot)
	abline(v=b, col="red"); abline(v=ci, col="blue")
	abline(v=quantile(b.boot, c(0.025, 0.975)), col="green")
}
#
library("rio")
x  <- import("https://shinyapps.wiwi.hu-berlin.de/d/CPS78-85.tsv")
library("car")
lm <- lm (lwage~educ, data=x, subset=(year==85))
ci <- confint(lm, level=0.95)
betahat <- bootCase(lm)
plot.confint(lm$coefficients[1], betahat[,1], ci[1,], "Intercept")
plot.confint(lm$coefficients[2], betahat[,2], ci[2,], "educ")