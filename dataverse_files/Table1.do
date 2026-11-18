


cd "/path/to/replication/directory/"

set more off

*********
*Table 1*
*********

****************
*Municipalities*
****************


use datamuni	, clear


*********
*Model 1*
*********



xtreg gdper i.year treatment , fe vce(cl muni)
estimates store oldest
lincomest  treatment
parmest,label saving(tr1muni.dta,replace)  
estimates restore oldest



*********
*Model 2*
*********



xtreg gdper i.year treatment s2trend-s94trend, fe vce(cl muni)
estimates store oldest
lincomest  treatment
parmest,label saving(tr2muni.dta,replace)  
estimates restore oldest




*********
*Model 3*
*********


xtreg gdlagper i.year treatment , fe vce(cl muni)
estimates store oldest
lincomest  treatment
parmest,label saving(tr3muni.dta,replace)  
estimates restore oldest



*********
*Model 4*
*********


xtreg gdlagper i.year treatment s2trend-s94trend, fe vce(cl muni)
estimates store oldest
lincomest  treatment
parmest,label saving(tr4muni.dta,replace)  
estimates restore oldest



*********
*Model 9*
*********




xtreg gdper i.year trarrprop , fe vce(cl muni)
estimates store oldest
lincomest  trarrprop
parmest,label saving(tr5muni.dta,replace)  
estimates restore oldest




**********
*Model 10*
**********



xtreg gdper i.year trarrprop s2trend-s94trend , fe vce(cl muni)
estimates store oldest
lincomest  trarrprop
parmest,label saving(tr6muni.dta,replace)  
estimates restore oldest



**********
*Model 11*
**********


xtreg gdlagper i.year trarrprop, fe vce(cl muni)
estimates store oldest
lincomest  trarrprop
parmest,label saving(tr7muni.dta,replace)  
estimates restore oldest



**********
*Model 12*
**********


xtreg gdlagper i.year trarrprop s2trend-s94trend, fe vce(cl muni)
estimates store oldest
lincomest  trarrprop
parmest,label saving(tr8muni.dta,replace)  
estimates restore oldest


***********
*Townships*
***********

use datatown.dta, clear


*********
*Model 5*
*********



xtreg gdper i.year towntr, fe vce(cl town)
estimates store oldest
lincomest  towntr
parmest,label saving(tr4town.dta,replace)  
estimates restore oldest



*********
*Model 6*
*********


xtreg gdper i.year towntr s2trend-s247trend, fe vce(cl town)
estimates store oldest
lincomest  towntr
parmest,label saving(tr3town.dta,replace)  
estimates restore oldest



*********
*Model 7*
*********


xtreg gdlagper i.year towntr, fe vce(cl town)
estimates store oldest
lincomest  towntr
parmest,label saving(tr2town.dta,replace)  
estimates restore oldest



*********
*Model 8*
*********

xtreg gdlagper i.year towntr s2trend-s247trend, fe vce(cl town)
estimates store oldest
lincomest  towntr
parmest,label saving(tr1town.dta,replace)  
estimates restore oldest


************************************************************************************
*Activate code from line 193 to line 230 to obtain data frame needed for Figure S.2*
************************************************************************************






forvalues x=1/4 {
use tr`x'muni, clear
gen id1=9-`x'
gen id2=1
save tr`x'muni, replace
}


forvalues x=5/8 {
use tr`x'muni, clear
gen id1=9-`x'
gen id2=2
save tr`x'muni, replace
}


use tr1muni
forvalues x=2/8 {
append using tr`x'muni
}


recode id1 (3/4 7/8 =1 ) (1/2 5/6 = 2),into(id3)

saveold treffresults,version(12) replace




forvalues x=1/4 {
use tr`x'town, clear
gen id1=`x'
save tr`x'town, replace
}

use tr1town
forvalues x=2/4 {
append using tr`x'town
}

recode id1 (1/2 =2 ) (3/4 = 1),into(id3)

saveold treffresultstown,version(12) replace

