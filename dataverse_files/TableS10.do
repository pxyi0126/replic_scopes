set more off

cd "/path/to/replication/directory/"


use datamuni.dta,clear



bysort municipality post: egen sumgdnwtot=total(gdper) 
gen gdpernew=sumgdnwtot/3 if post==0
replace gdpernew=gdper if post==1

*********
*Model 1*
*********

xtreg gdpernew i.year treatment if year>2013, fe vce(cl muni)

*********
*Model 3*
*********


xtreg gdpernew i.year trarrprop if year>2013, fe vce(cl muni)


*********
*Model 4*
*********


xtreg gdper i.year treatment if year>2013, fe vce(cl muni)

*********
*Model 6*
*********

xtreg gdper i.year trarrprop if year>2013, fe vce(cl muni)



use datatown.dta,clear
gen post=0
replace post=1 if year==2016

bysort town post: egen sumgdnwtot=total(gdper) 
gen gdpernew=sumgdnwtot/3 if post==0
replace gdpernew=gdper if post==1

*********
*Model 2*
*********

xtreg gdper i.year towntr, fe vce(cl town)


*********
*Model 5*
*********


xtreg gdper i.year towntr if year>2013, fe vce(cl town)


