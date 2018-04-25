// read Boston Housing data
use "z:\daten\bostonh.dta", clear

// kernel density estimate
kdensity MEDV

// with given bandwidth
kdensity MEDV, bwidth(5)
