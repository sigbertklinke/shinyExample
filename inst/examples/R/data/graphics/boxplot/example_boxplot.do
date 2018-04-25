// read Boston Housing data
use "bostonh.dta", clear

// box plot 
graph box MEDV
// horizontal boxplot
graph hbox LSTAT
// box plot for subgroups
graph box MEDV, over(RAD)
graph box MEDV, over(RAD) over(CHAS)
