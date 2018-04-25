// read in Boston Housing data
use "Z:\daten\bostonh.dta", clear

// check if MEDV is uniform distributed
quantile MEDV
// check if MEDV is normal distributed
qnorm MEDV
// check if MEDV is chi^2 distributed
qchi MEDV
