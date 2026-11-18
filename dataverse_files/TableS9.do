set more off

cd "/path/to/replication/directory/"


**********
*Table S9*
**********

use datamuni.dta,clear

xtreg gdper i.year treatment,fe i(muni) vce(bootstrap, seed(1234))
xtreg gdlagper i.year treatment ,fe i(muni) vce(bootstrap, seed(1234))
xtreg gdper i.year trarrprop,fe i(muni) vce(bootstrap, seed(1234))
xtreg gdlagper i.year trarrprop,fe i(muni) vce(bootstrap, seed(1234))


use datatown.dta,clear

xtreg gdper i.year towntr,fe i(town) vce(bootstrap, seed(1234))
xtreg gdlagper i.year towntr ,fe i(town) vce(bootstrap, seed(1234))
