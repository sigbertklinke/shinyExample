tables <- function(tab) {
  rs   <- rowSums(tab)
  cs   <- colSums(tab)
  n    <- sum(tab)
  tabs <- list()
  tab  <- matrix(NA, ncol=2, nrow=2)
  for(i in 0:min(n,rs[1],cs[1])) {
    tab[1,1] <- i
    tab[1,2] <- rs[1]-tab[1,1]
    tab[2,] <- cs-tab[1,]
    tabs[[i+1]] <- tab
  }
  tabs
}

chisquare <- function (tab) {
  lf <- function(n) { if (n<2) return(0); return(sum(log(1:n))) }
  
  rs <- rowSums(tab)
  cs <- colSums(tab)
  lp <- lf(rs[1])+lf(rs[2])+lf(cs[1])+lf(cs[2])-lf(sum(tab))-lf(tab[1,1])-lf(tab[1,2])-lf(tab[2,1])-lf(tab[2,2])
  c(chisq.test(tab, correct=F)$statistic, exp(lp))
}

wtd.ecdf <- function(x, weight) {
  browser()
  ecdf <- wtd.Ecdf(x, weight)
  rval <- approxfun(ecdf$x, ecdf$ecdf, 
                    method = "constant", yleft = 0, yright = 1, f = 0, ties = "ordered")
  class(rval) <- c("ecdf", "stepfun", class(rval))
#  assign("nobs", n, envir = environment(rval))
  attr(rval, "call") <- sys.call()
  rval 
}

pdf("exacttest.pdf", width=10, height=7)
par(mfcol=c(2,2))
library("Hmisc")
tab  <- matrix(c(3,2,2,3),ncol=2, nrow=2) 
tabs <- tables(tab)
chi2 <- lapply(tabs, chisquare)
tabc <- wtd.table(sapply(chi2, "[[", 1), sapply(chi2, "[[", 2))
names(tabc) <- c("x", "y")
plot(tabc, xlab="Chi^2 test statistic", ylab="Probability", xlim=c(0,max(tabc$x)), type="h", lwd=2)
usr <- par("usr")
d   <- c(diff(usr[1:2]), diff(usr[3:4]))
text(x=usr[2]-d[1]*c(0.2, 0.1, 0.2, 0.1), y=usr[4]-d[2]*c(0.1, 0.1, 0.2, 0.2), labels=as.vector(tab), pos=4)
abline(v=qchisq(0.95, 1), col="red", lwd=2)
plot(wtd.ecdf(sapply(chi2, "[[", 1), sapply(chi2, "[[", 2)), main="Cumulative distribution function")
abline(h=0.95, col="red", lwd=2)

tab  <- matrix(c(35,25,25,35),ncol=2, nrow=2) 
tabs <- tables(tab)
chi2 <- lapply(tabs, chisquare)
tabc <- wtd.table(sapply(chi2, "[[", 1), sapply(chi2, "[[", 2))
names(tabc) <- c("x", "y")
plot(tabc, xlab="Chi^2 test statistic", ylab="Probability", xlim=c(0,max(tabc$x)), type="h", lwd=2)
usr <- par("usr")
d   <- c(diff(usr[1:2]), diff(usr[3:4]))
text(x=usr[2]-d[1]*c(0.2, 0.1, 0.2, 0.1), y=usr[4]-d[2]*c(0.1, 0.1, 0.2, 0.2), labels=as.vector(tab), pos=4)
abline(v=qchisq(0.95, 1), col="red", lwd=2)
abline(v=qchisq(0.95, 1), col="red", lwd=2)
plot(wtd.ecdf(sapply(chi2, "[[", 1), sapply(chi2, "[[", 2)), main="Cumulative distribution function")
abline(h=0.95, col="red", lwd=2)
dev.off()