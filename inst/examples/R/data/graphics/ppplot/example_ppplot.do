// read in Boston Housing data
use "Z:\daten\bostonh.dta", clear

// check if MEDV is normal distributed
pnorm MEDV
// check if MEDV is chi^2 distributed
pchi MEDV
