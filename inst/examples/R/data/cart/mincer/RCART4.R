x <- read.csv2("cps78_85.csv")
# select only year=85
x <- x[x$year==85,]

lrfit <- lm (lwage~educ+exper, data=x)
summary(lrfit)

library("rpart")
fit <- rpart(lwage~educ+exper, data=x, method="anova")
pdf("RCART4a.pdf", width=10, height=5)
plot(fit, main="CART with default settings for CPS85 data (R^2=0,252)")
text(fit, cex=.8)
dev.off()

fullfit <- rpart(lwage~educ+exper, data=x, method="anova", control=rpart.control(cp=0))
pdf("RCART4b.pdf", width=10, height=5)
plot(fullfit, main="Full CART for CPS85 data (R^2=0,320)")
text(fullfit, cex=.8)
dev.off()

pdf("RCART4c.pdf", width=10, height=5)
plotcp(fullfit)
prunefit<-prune(fullfit, cp=fullfit$cptable[which.min(fullfit$cptable[,"xerror"]),"CP"])
dev.off()

pdf("RCART4d.pdf", width=10, height=5)
plot(prunefit, main="Pruned CART for CPS85 data (R^2=0,252)")
text(prunefit, use.n=TRUE, all=TRUE, cex=.8)
dev.off()

