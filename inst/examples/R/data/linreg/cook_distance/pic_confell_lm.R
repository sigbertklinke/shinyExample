library("MASS")
library("car")
lm <- lm(medv~lstat, data=Boston)
pdf("pic_confell_lm.pdf")
confidenceEllipse(lm, col="red", center.cex=1, main="95% confidence ellipsis for regression coefficients")
index <- which.max(cooks.distance(lm))
lmi <- lm(medv~lstat, data=Boston, subset=-index)
points(lmi$coefficients[1], lmi$coefficients[2], pch=19)
#text(lmi$coefficients[1], lmi$coefficients[2], "obs. 375 deleted", pos=4)
lines(c(lm$coefficients[1], lmi$coefficients[1]),
			c(lm$coefficients[2], lmi$coefficients[2]))
text((lm$coefficients[1]+lmi$coefficients[1])/2,
		 (lm$coefficients[2]+lmi$coefficients[2])/2, expression(C[375]), pos=4)
dev.off()