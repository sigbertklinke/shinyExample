// read in Boston Housing data
use "Z:\daten\bostonh.dta", clear

// mosaic plot conditioned on RAD
spineplot RAD CHAS
// mosaic plot conditioned on CHAS
spineplot CHAS RAD

