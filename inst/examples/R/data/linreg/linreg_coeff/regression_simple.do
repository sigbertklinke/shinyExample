// read current population survey excerpt for 78 and 85
use "Z:\daten\CPS78-85.dta", clear

// do linear regression
regress lwage educ if year==78
