// read current population survey excerpt fro 78 and 85
use "Z:\daten\CPS78-85.dta", clear

// plot data points and linear regression line
twoway (scatter lwage educ if year==78) ///
  (lfit lwage educ if year==78)
