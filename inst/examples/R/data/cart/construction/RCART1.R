dop <- T
x <- read.csv2("cps78_85.csv")
# select only year=85
x <- x[x$year==85,]

library("rpart")
fit<-rpart(lwage~educ+exper, data=x)
if (dop) { pdf("RCART1a.pdf", width=5, height=10) }
plot(fit)
text(fit, use.n=TRUE, all=TRUE, cex=0.8)
if (dop) { dev.off() }

library("RColorBrewer")
leafnodes  <- as.numeric(rownames(fit$frame)[fit$frame[,1]=="<leaf>"])
leafindex  <- (1:nrow(fit$frame))[fit$frame[,1]=="<leaf>"]
leafpathes <- path.rpart(fit, leafnodes)
if (dop) { pdf("RCART1b.pdf", width=10, height=7) }
colors  <- brewer.pal(9,"RdYlBu")
colwage <- 1+ceiling(9*(x$lwage-min(x$lwage))/diff(range(x$lwage)))
colwage[colwage>9] <- 9
plot(jitter(x$exper, amount=0.3), jitter(x$educ, amount=0.3), col=colors[colwage], pch=19, xlab="Experience (jittered)", ylab="Education (jittered)", main="CPS85 data with rpart defaults")
for (i in 1:length(leafnodes)) {
  educ  <- range(x$educ)
  exper <- range(x$exper)
  path <- leafpathes[[i]]
  for (j in 2:length(path)) {
    split <- strsplit(path[j], "< ")[[1]]
    if (length(split)==2) { # smaller
      val <- as.numeric(split[2])
      if (split[1]=="educ") {
        lines(exper, c(val, val))
        educ[2] <- val
      } else {
        lines(c(val, val), educ)
        exper[2] <- val
      }
    }
    split <- strsplit(path[j], ">=")[[1]]
    if (length(split)==2) { # greater equal
      val <- as.numeric(split[2])
      if (split[1]=="educ") {
        lines(exper, c(val, val))
        educ[1] <- val
      } else {
        lines(c(val, val), educ)
        exper[1] <- val
      }
    }
  }
  text(mean(exper), mean(educ), sprintf("lwage=%.3f", fit$frame[leafindex[i],5]))
}

if (dop) { dev.off() }
