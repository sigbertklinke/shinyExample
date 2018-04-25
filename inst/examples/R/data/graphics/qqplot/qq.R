library("MASS")

quad <- function(x, x0=mean(x)) {
  s2 <- var(x)
  cx <- cov(x, x^2)
  ba <- -cx/s2
  a  <- 1/(x0+ba)
  b  <- a*ba
  return(list(a=a, b=b))
}

pascalTriangle <- function(h) {
  lapply(0:h, function(i) choose(i, 0:i))
}

power <- function(x, p=2) {
  f <- function(z, coeff) {
    y <- 0
    for (i in seq(coeff)) {
      y <- y+coeff[i]*z^(i-1)
    }
    print(y)
    return(y)
  }
  
  pt <- pascalTriangle(p)
  coeff <- pt[[p]][1:p]
  for (i in seq(p)) coeff[i] <- coeff[i]*cov(x, x^(p-i+1))
  
  return(polyroot(coeff))
}

n <- names(Boston)
for (i in seq(n)) {
  l  <- quad(Boston[,i])
  print (sprintf("%s: %f X^2+%f X", n[i], l$a, l$b))
  plot(Boston[,i], l$a*Boston[,i]^2+l$b*Boston[,i], main=n[i])
}
n <- names(Boston)
p <- 2
for (i in seq(n)) {
  l  <- power(Boston[,i])
  print (sprintf("%s: (X-%f)^%i", n[i], l, p))
  plot(Boston[,i], (Boston[,i]-l)^p, main=n[i])
  abline(v=l, col="red")
}