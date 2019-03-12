####################################################################
#
# All Code and Comments Below (except code provided by Boris Mayer) are
# Copyright Marc Schwartz
# e-mail: marc_schwartz@me.com
# This code is made available under the GNU Public License V2.0
# This is free software and comes with ABSOLUTELY NO WARRANTY.
#
####################################################################


# R Code to calculate various Measures of
# Association for m x n tables
# References include:
# 1. Agresti A. (2002): Categorical Data Analysis, Second Edition, J. Wiley and Sons
# 2. Stokes M., Davis C. & Koch G. (1997): Categorical Data Analysis Using the SAS System, SAS Institute
# 3. Liebetrau A.M. (1983): Measures of Association (Sage University Papers Series on Quantitative Applications
#    in the Social Sciences, Series no. 07-032), Sage Publications
# 4. SAS Institute (1999): SAS/STAT User's Guide V8, SAS Institute
# 5. SPSS, Inc. (2003): SPSS 11.5 Statistical Algorithms
#    (http://www.spss.com/tech/stat/Algorithms/11.5/crosstabs.pdf)
# 6. Sheskin DJ. (2004): Handbook of Parametric and Nonparametric Statistical Procedures, Chapman & Hall/CRC


# MOST MEASURES TAKE A 2 DIMENSIONAL TABLE/MATRIX "x" AS
# AN ARGUMENT

# See the 'vcd' CRAN package for some examples and code
# on calculations and p values



# Calculate CONcordant Pairs in a table
# cycle through x[r, c] and multiply by
# sum(x elements below and to the right of x[r, c])
# x = table
concordant <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  # get sum(matrix values > r AND > c)
  # for each matrix[r, c]
  mat.lr <- function(r, c)
  { 
    lr <- x[(r.x > r) & (c.x > c)]
    sum(lr)
  }
  
  # get row and column index for each
  # matrix element
  r.x <- row(x)
  c.x <- col(x)
  
  # return the sum of each matrix[r, c] * sums
  # using mapply to sequence thru each matrix[r, c]
  sum(x * mapply(mat.lr, r = r.x, c = c.x))
}

# Calculate DIScordant Pairs in a table
# cycle through x[r, c] and multiply by
# sum(x elements below and to the left of x[r, c])
# x = table
discordant <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  # get sum(matrix values > r AND < c)
  # for each matrix[r, c]
  mat.ll <- function(r, c)
  { 
    ll <- x[(r.x > r) & (c.x < c)]
    sum(ll)
  }
  
  # get row and column index for each
  # matrix element
  r.x <- row(x)
  c.x <- col(x)
  
  # return the sum of each matrix[r, c] * sums
  # using mapply to sequence thru each matrix[r, c]
  sum(x * mapply(mat.ll, r = r.x, c = c.x))
}

# Calculate Pairs tied on Rows
# cycle through each row of x and multiply by
# sum(x elements to the right of x[r, c])
# x = table
ties.row <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  total.pairs <- 0
  
  rows <- dim(x)[1]
  cols <- dim(x)[2]
  
  for (r in 1:rows)
  {
    for (c in 1:(cols - 1))
    {
      total.pairs <- total.pairs + (x[r, c] * sum(x[r, (c + 1):cols]))
    }
  }
  
  total.pairs
}

# Calculate Pairs tied on Columns
# cycle through each col of x and multiply by
# sum(x elements below x[r, c])
# x = table
ties.col <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  total.pairs <- 0
  
  rows <- dim(x)[1]
  cols <- dim(x)[2]
  
  for (c in 1:cols)
  {
    for (r in 1:(rows - 1))
    {
      total.pairs <- total.pairs + (x[r, c] * sum(x[(r + 1):rows, c]))
    }
  }
  
  total.pairs
}

# Calculate Phi Coefficient
# x = table
calc.phi <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  phi <- sqrt(chisq.test(x, correct = FALSE)$statistic / sum(x))
  as.numeric(phi)
}

# Calculate Contingency Coefficient (Pearson's C)
# and Sakoda's Adjusted Pearson's C
# x = table
calc.cc <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  # CC - Pearson's C
  chisq <- chisq.test(x, correct = FALSE)$statistic
  C <- sqrt(chisq / (chisq + sum(x)))
  
  # Sakoda's adjusted Pearson's C
  k <- min(dim(x))
  SC <- C / sqrt((k - 1) / k)
  
  CClist <- list(as.numeric(C), as.numeric(SC))
  names(CClist) <- c("Pearson.C", "Sakoda.C")
  
  CClist
}

# Calculate Tshuprow's T
# Not meaningful for non-square tables
# For 2 x 2 tables T = Phi
# x = table
calc.TT <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  TT <- sqrt(chisq.test(x, correct = FALSE)$statistic /
               (sum(x) * sqrt((dim(x)[1] - 1) * (dim(x)[2] - 1))))
  
  as.numeric(TT)
}

# Calculate Cramer's V
# For 2 x 2 tables V = Phi
# x = table
calc.CV <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  CV <- sqrt(chisq.test(x, correct = FALSE)$statistic /
               (sum(x) * min(dim(x) - 1)))
  
  as.numeric(CV)
}

# Calculate Lambda
# Return 3 values:
# 1. Lambda C~R
# 2. Lambda R~C
# 3. Lambda Symmetric (Mean of above)
# x = table
calc.lambda <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  SumRmax <- sum(apply(x, 1, max))
  SumCmax <- sum(apply(x, 2, max))
  MaxCSum <- max(colSums(x))
  MaxRSum <- max(rowSums(x))
  n <- sum(x)
  
  L.CR <- (SumRmax - MaxCSum) / (n - MaxCSum)
  L.RC <- (SumCmax - max(rowSums(x))) / (n - MaxRSum)
  L.S <- (SumRmax + SumCmax - MaxCSum - MaxRSum) /
    ((2 * n) - MaxCSum - MaxRSum)
  
  Llist <- list(L.CR, L.RC, L.S)
  names(Llist) <- c("L.CR", "L.RC", "L.S")
  
  Llist
}

# Calculate The Uncertainty Coefficient
# "Theil's U"
# Return 3 values:
# 1. UC C~R
# 2. UC R~C
# 3. UC Symmetric (Mean of above)
# x = table
# Note: Asymmetric formulae denomiators corrected on May 4, 2007
# thanks to Antti Arppe

calc.UC <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  SumR <- rowSums(x)
  SumC <- colSums(x)
  n <- sum(x)
  
  HY <- -sum((SumC / n) * log(SumC / n))
  HX <- -sum((SumR / n) * log(SumR / n))
  HXY <- -sum((x / n) * log(x / n))
  
  UC.RC <- (HX + HY - HXY) / HX
  UC.CR <- (HY + HX - HXY) / HY
  UC.S <- 2 * (HX + HY - HXY) / (HX + HY)
  
  UClist <- list(UC.RC, UC.CR, UC.S)
  names(UClist) <- c("UC.RC", "UC.CR", "UC.S")
  
  UClist
}

# Calculate Goodman-Kruskal gamma
# x = table
calc.gamma <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  c <- concordant(x)
  d <- discordant(x)
  
  gamma <- (c - d) / (c + d)
  
  gamma
}

# Calculate Kendall's Tau-b
# x = table
calc.KTb <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  c <- concordant(x)
  d <- discordant(x)
  
  # An alternative computation is:
  #Tr <- ties.row(x)
  #Tc <- ties.col(x)
  #KTb <- (c - d) / sqrt((c + d + Tc) * (c + d + Tr))
  
  # The "preferred" computation is:
  n <- sum(x)
  SumR <- rowSums(x)
  SumC <- colSums(x)
  
  KTb <- (2 * (c - d)) / sqrt(((n ^ 2) - (sum(SumR ^ 2))) * ((n ^ 2) - (sum(SumC ^ 2))))
  
  KTb
}

# Calculate Kendall-Stuart Tau-c
# x = table
calc.KSTc <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  c <- concordant(x)
  d <- discordant(x)
  m <- min(dim(x))
  n <- sum(x)
  
  KSTc <- (m * 2 * (c - d)) / ((n ^ 2) * (m - 1))
  
  KSTc
}

# Calculate Somers' d
# Return 3 values:
# 1. Sd C~R
# 2. Sd R~C
# 3. Sd Symmetric
# x = table
calc.Sd <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  c <- concordant(x)
  d <- discordant(x)
  n <- sum(x)
  SumR <- rowSums(x)
  SumC <- colSums(x)
  
  Sd.CR <- (2 * (c - d)) / ((n ^ 2) - (sum(SumR ^ 2)))
  Sd.RC <- (2 * (c - d)) / ((n ^ 2) - (sum(SumC ^ 2)))
  Sd.S <- (2 * (c - d)) / ((n ^ 2) - (((sum(SumR ^ 2)) + (sum(SumC ^ 2))) / 2))
  
  Sdlist <- list(Sd.CR, Sd.RC, Sd.S)
  names(Sdlist) <- c("Sd.CR", "Sd.RC", "Sd.S")
  
  Sdlist
}



# Calculate Cochran's Q
# Test for proportions in dependent samples
# a k > 2 generalization of the mcnemar test
# 'mat' is a matrix, where:
# each row is a subject
# each column is the 0/1 result of a test condition
cochranq.test <- function(mat)
{
  k <- ncol(mat)
  
  C <- sum(colSums(mat) ^ 2)
  R <- sum(rowSums(mat) ^ 2)
  T <- sum(rowSums(mat))
  
  num <- (k - 1) * ((k * C) - (T ^ 2))
  den <- (k * T) - R
  
  Q <- num / den
  
  df <- k - 1
  names(df) <- "df"
  names(Q) <- "Cochran's Q"
  
  p.val <- pchisq(Q, df, lower = FALSE)
  
  QVAL <- list(statistic = Q, parameter = df, p.value = p.val,
               method = "Cochran's Q Test for Dependent Samples",
               data.name = deparse(substitute(mat)))
  class(QVAL) <- "htest"
  return(QVAL)
}




# Functions calc.WeP and calc.WeA to calculate Wilson's e
# Code kindly provided and copyrighted by Boris Mayer
# June 19, 2015
# boris.mayer@psy.unibe.ch
# This code utilizes functions above


# Calculate Wilsons's e (based on "Preferred computation")
# x = table
calc.WeP <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  c <- concordant(x)
  d <- discordant(x)
  
  # An alternative computation is:
  #Tr <- ties.row(x)
  #Tc <- ties.col(x)
  #We <- (c - d) / (c + d + Tc + Tr)
  
  # The "preferred" computation is:
  n <- sum(x)
  SumR <- rowSums(x)
  SumC <- colSums(x)
  
  We <- (2 *(c - d)) / ((n^2 - (sum(SumR ^ 2))) + (n^2 - (sum(SumC ^ 2))) - (2*(c+d)))
  
  We
}


# Calculate Wilsons's e (based on "Alternative computation")
# x = table
calc.WeA <- function(x)
{
  x <- matrix(as.numeric(x), dim(x))
  
  c <- concordant(x)
  d <- discordant(x)
  
  # An alternative computation is:
  Tr <- ties.row(x)
  Tc <- ties.col(x)
  We <- (c - d) / (c + d + Tc + Tr)
  
  # The "preferred" computation is:
  #n <- sum(x)
  #SumR <- rowSums(x)
  #SumC <- colSums(x)
  
  #We <- (2 *(c - d)) / ((n^2 - (sum(SumR ^ 2))) + (n^2 - (sum(SumC ^ 2))) - (2*(c+d)))
  
  We
}
