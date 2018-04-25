data <- read.csv("1000 songs.csv", as.is=c(FALSE, TRUE, FALSE, TRUE, TRUE))

data$DECADE <- floor(as.numeric(data$YEAR)/10) * 10
data$BAND <- paste(data$DECADE, "s", sep="")
data$BAND[data$DECADE < 1960] <- "1910s-50s"

pdf("mosaic1.pdf", bg="transparent")
plot(table(data$BAND, data$THEME), col=rainbow(7), las=1, main="", bg="transparent")
dev.off()

pdf("mosaic2.pdf", bg="transparent")
plot(table(data$THEME, data$BAND), col=rainbow(7), las=1, main="", bg="transparent")
dev.off()

tab <- table(data$BAND, data$THEME)
tab2 <- outer(apply(tab,1,sum), apply(tab,2,sum))/sum(tab)
pdf("mosaic3.pdf", bg="transparent")
plot(as.table(tab2), col=rainbow(7), las=1, main="",, bg="transparent")
dev.off()

m <- matrix(c(6,4,-10,-2, -2, 4, -4, -2, 6), nrow=3)
tab2[4:6,1:3] <- tab2[4:6,1:3]+m
tab2[1:3,5:7] <- tab2[1:3,5:7]+m
pdf("mosaic4.pdf", bg="transparent")
plot(as.table(tab2), col=rainbow(7), las=1, main="", bg="transparent")
dev.off()