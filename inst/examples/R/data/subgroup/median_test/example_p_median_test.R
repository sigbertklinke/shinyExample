p.median.test <- function (x, f) {
	med <- median(x)
  lst <- tapply(x, f, function(v, med) { c(length(v), sum(v<med), sum(v>med)) }, med=median(x))
  tab <- do.call('rbind', lst)
	n0  <- tab[,1]-tab[,2]-tab[,3]
	as.table(tab[,2:3]+n0/2)
}
#
data(Boston, package="MASS")
tab <- p.median.test(Boston$medv, Boston$rad)
tab
chisq.test(tab)