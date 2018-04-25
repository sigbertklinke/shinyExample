*Data structure IV*
matrix A=(1,2\3,4) //Matrix A mit Dimension 2*2
matrix B=(1,2,3\4,.,6) //Matrix B mit Dimension 2*3
matrix D=(1\2\3) //Vektor mit Dimension 3*1
matrix C=A*B //Matrizenrechnung
matrix list A //Matrix/Vektor illustrieren
*Kreuztabelle von 2 Variablen*
matrix rownames A = dog cat // siehe matrix Zeilennamen
matrix colnames A = bark meow // siehe matrix Spaltennamen
matrix list A
capture log close
cd "H:\Arbeit Statistik\Umsetzung\data"
use bostonh.dta
label var CRIM "per capita crime rate by town"
browse // look at data structure specifically
tab CRIM   // table of one variable
sum CRIM // statistics (percentiles etc.) of one variable
codebook // about the propoerties of one variable
