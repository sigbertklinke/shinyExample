// read Boston Housing data
use "Z:\daten\bostonh.dta", clear

// scatterplot matrix
parplot CRIM ZN INDUS NOXSQ RM AGE DIS TAX PTRATIO B LSTAT MEDV
