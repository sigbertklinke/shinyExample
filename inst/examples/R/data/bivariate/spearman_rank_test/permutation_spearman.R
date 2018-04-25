fn_perm_list <- function (n, r, v = 1:n) {
  if (r == 1)
    matrix(v, n, 1)
  else if (n == 1)
    matrix(v, 1, r)
  else {
    X <- NULL
    for (i in 1:n) X <- rbind(X, cbind(v[i], fn_perm_list(n -1, r - 1, v[-i])))
    X
  }
}

spearman <- function(v) {
  cor(seq(v), v)
}

pdf("permutation_spearman.pdf", width=10, height=6)
par(mfrow=c(2,3))
for (n in 3:8) {
  mat <- fn_perm_list(n,n)
  rs  <- apply(mat, 1, spearman)
  tab <- table(rs)/nrow(mat)
  col <- (cumsum(tab)<0.025) 
  col <- col | rev(col)
  plot(tab, col=ifelse(col, "red", "black"), main=bquote("Distribution of " * r[s] * " under " * H[0] * " (n" == .(n) * ")"), 
       sub=bquote("red: " * alpha <= "5%"), xlab="Spearman's rank correlation", ylab="Probability")
  cbind(mat, rs)
}
dev.off()