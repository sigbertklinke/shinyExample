insheet using "z:\daten\bostonh.csv", delimiter(";") names clear
foreach var in crim zn indus noxsq rm age dis ptratio b lstat medv {
  replace `var' = subinstr(`var', ",", ".", .)
  destring `var', replace
}
