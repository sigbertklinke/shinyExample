x <- 0:11
p <- dbinom(x, 11, 0.25)
col <- (cumsum(p)<0.05)+rev(cumsum(rev(p))<0.05)
pdf("quantile_conf.pdf", width=10, height=4)
bp<-barplot(p, main="B(n=11, p=0.25)", col=col, sub=expression(paste("Number of observations smaller than ", x[p])))
axis(1, at=bp, labels=sprintf("%.0f", x))
dev.off()