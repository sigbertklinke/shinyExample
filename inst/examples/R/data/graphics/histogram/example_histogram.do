// read Boston Housing data
use "z:\daten\bostonh.dta", clear

// histogram 
histogram MEDV

// histogram with discrete values (one bin per value)
histogram RAD, discrete
