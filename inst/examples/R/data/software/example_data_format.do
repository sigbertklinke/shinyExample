*Data structure IV*

clear all
set more off
capture log close
cd "H:\Arbeit Statistik\Umsetzung\data"

*Matrix A mit Dimension 2*2 
matrix A=(1,2\3,4)
// oder
*mat A=(1,2\3,4)*

*Matrix B mit Dimension 2*3 
matrix B=(1,2,3\4,.,6)

*Vektor mit Dimension 3*1
matrix D=(1\2\3)

*Matrizenrechnung*
matrix C=A*B

*Matrix/Vektor illustrieren
matrix list A
matrix list B
matrix list D
matrix list C

*Kreuztabelle von 2 Variablen*
*tabulate var1 var2, row column oder im Falle einer selbst erstellten Matrix*
matrix rownames A = dog cat // siehe matrix Zeilennamen
matrix colnames A = bark meow // siehe matrix Spaltennamen
matrix list A

/*Data Structure V -*/

clear all
set more off
capture log close
cd "H:\Arbeit Statistik\Umsetzung\data"
use bostonh.dta

label var CRIM "per capita crime rate by town"
label var RM "average number of rooms per dwelling"

browse // look at data structure specifically

tab CRIM   // table of one variable

//tab var1 var2// tabe of 2 variables

describe // describes all Variables 

sum CRIM // statistics (percentiles etc.) of one variable

sum CRIM,d // more statistics 

codebook // about the propoerties of one variable
