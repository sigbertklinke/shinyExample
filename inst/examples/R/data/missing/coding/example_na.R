# NA - datum not available
class(NA)
y <- c(1, 2, 3, NA)
is.na(y)
is.nan(y)
mean(y)
mean(y, na.rm=T)
# NaN - invalid operation
class(0/0)
y <- c(1, 2, 3, 0/0)
is.na(y)
is.nan(y)
mean(y)
mean(y, na.rm=T)