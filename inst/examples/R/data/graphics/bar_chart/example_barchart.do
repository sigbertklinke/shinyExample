// read Boston Housing data
use "z:\daten\bostonh.dta", clear

// bar chart with absolute frequencies
generate freq=1
graph bar (count) freq, over(RAD) 
// bar chart with horizontal bars
graph hbar (count) freq, over(RAD) 
