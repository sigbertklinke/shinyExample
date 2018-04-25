*Install Packages - http://repec.org*

clear all
set more off
capture log close
cd "H:\Arbeit Statistik\Umsetzung\data"
use bostonh.dta

ssc describe ptrend //Chi-Quadrat 

ssc install ptrend //from the Boston College Statistical Software Components (SSC) archive
net install ptrend // from description you have to type net

* Help for some topics - help [command_or_topic_name]*

help ssc
help save
help ttest

