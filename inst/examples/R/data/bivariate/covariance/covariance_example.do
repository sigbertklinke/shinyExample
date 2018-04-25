use "Z:\daten\bostonh.dta", clear

// covariance
correlate RM LSTAT MEDV, covariance
return list
