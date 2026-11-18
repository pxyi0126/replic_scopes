set more off

cd "/path/to/replication/directory/"


use datamuni.dta,clear

**********
*Table S5*
**********

xi:regress gdper y2-y4 logdist y2dist y3dist y4dist, cluster(muni) 

**************************
*Preparation for Figure S4 *
**************************

xi:regress gdper y2-y4 logdist y2dist y3dist y4dist, cluster(muni) 
estimates store oldest
lincomest  logdist
parmest,label saving(itt4.dta,replace)  
estimates restore oldest


xi:regress gdper y2-y4 logdist y2dist y3dist y4dist, cluster(muni) 
estimates store oldest
lincomest  logdist+y2dist
parmest,label saving(itt3.dta,replace)  
estimates restore oldest

xi:regress gdper y2-y4 logdist y2dist y3dist y4dist, cluster(muni) 
estimates store oldest
lincomest  logdist+y3dist
parmest,label saving(itt2.dta,replace)  
estimates restore oldest

xi:regress gdper y2-y4 logdist y2dist y3dist y4dist, cluster(muni) 
estimates store oldest
lincomest  logdist+y4dist
parmest,label saving(itt1.dta,replace)  
estimates restore oldest

**************************************************************
*Line 39 to line 51 generate data frame needed for Figure S.4*
**************************************************************




forvalues x=1/4 {
use itt`x'.dta, clear
gen id1=`x'
save ittnew`x'.dta, replace
}

use ittnew1.dta
forvalues x=2/4 {
append using ittnew`x'.dta
}


recode id1 (2/4 =2), into(id3)

gen id2=5-id1

saveold itt.dta, replace version(12)



