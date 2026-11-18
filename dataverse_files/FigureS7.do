cd "/path/to/replication/directory/"
set more off
use datamuni.dta, clear

********************************
*Robustness Checks for Distance*
********************************

foreach num of numlist  50(50)500 {

xtreg gdper i.year treatment if distance<`num', fe vce(cl muni)
estimates store oldest
lincomest  treatment
parmest,label saving(dist`num'dd.dta,replace)  
estimates restore oldest

xtreg gdper i.year treatment s2trend-s94trend if distance<`num', fe vce(cl muni)
estimates store oldest
lincomest  treatment
parmest,label saving(dist`num'ddstr.dta,replace)  
estimates restore oldest

ivregress 2sls gdperdif (treatment=logdist)  if year==2016 & distance<`num', cluster(district) first
estimates store oldest
lincomest  treatment
parmest,label saving(dist`num'iv.dta,replace)  
estimates restore oldest

}



foreach num of numlist  50(50)500 {
use dist`num'dd.dta
gen distance=`num'
gen id=_n
save dist`num'dd.dta, replace

use dist`num'ddstr.dta
gen distance=`num'
gen id=_n
save dist`num'ddstr.dta, replace

use dist`num'iv.dta
gen distance=`num'
gen id=_n
save dist`num'iv.dta, replace

}

use dist50dd.dta
foreach num of numlist 50(50)500 {
append using dist`num'dd.dta
}
gen group=1
save distddall, replace

use dist50ddstr.dta
foreach num of numlist 50(50)500 {
append using dist`num'ddstr.dta
}
gen group=2
save distddstrall, replace

use dist50iv.dta
foreach num of numlist 50(50)500 {
append using dist`num'iv.dta
}
gen group=3
save distddivall, replace

use distddall
append using distddstrall
append using distddivall

label define gr 1 "DD" 2 "DDstr" 3 "IV"
label values group gr

drop id
gen id=_n

saveold distall, version(12) replace

