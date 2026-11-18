cd "/path/to/replication/directory/"

set more off

use datamuni.dta,clear

**************
*Permutations*
**************

**************************
*Municipal-level analysis*
**************************


****************************************************************************************************
*Instructions about the code: The code needs to be run in conjunction with R code in FigureS8.R    *
*It needs to be run according to the following the sequence:                                       * 
*Step 1: Run Part A.statamuni           ************************************************************
*Step 2: Run Part A.Rmuni               * 
*Step 3: Run Part B.statamuni           * 
*Step 4: Run Part B.Rmuni               * 
*Step 5: Run Part C.statamuni           *
*Step 6: Run Part C.Rmuni               *
*****************************************

*FigureS8.R and FigureS8.do denote the designated parts of the code

******************
******************
*Part A.statamuni*
******************
******************

drop if muni==.
sort muni year
gen idperm=_n
sort idperm
keep muni year gdper treatment idperm
save permut, replace

*************************
*End of part A.statamuni*
*************************


******************
******************
*Part B.statamuni*
******************
******************

use permsmuni.dta, clear
	gen idperm=_n
	drop if idperm>380
	sort idperm
	save perms.dta, replace

use permut, clear
merge 1:1 idperm using perms, nogenerate 	

forvalues x=1/2000 {
replace V`x'=0 if V`x'==1 & year<2016
}
	
forvalues x=1/2000 {
	
xtreg gdper i.year V`x', fe vce(cl muni)
estimates store oldest
lincomest  V`x'
parmest,label saving(ri`x'.dta,replace)  
estimates restore oldest
}
	
use ri1.dta, clear
forvalues x=1/2000 {
append using ri`x'.dta	
}
saveold riest1.dta, version(12) replace

use datamuni.dta, clear

drop if evertr==1
drop if year<2016
sort muni year
set seed 838
gen rand_num = uniform()
egen ordering = rank(rand_num)
gen trperm=0 
replace trperm=1 if ordering<=12

sort muni year
keep trperm muni
save riperm1.dta, replace
 	
use datamuni	
merge  m:1 muni using riperm1, nogenerate
drop if muni==. | trperm==.
saveold permut2,version(12) replace


*************************
*End of part B.statamuni*
*************************



******************
******************
*Part C.statamuni*
******************
******************


use datamuni, clear


drop if muni==.
drop if evertr==1
sort muni year
gen idperm=_n
sort idperm
keep muni year gdper treatment idperm
save permutcontrol, replace

use perms2muni.dta, clear
	gen idperm=_n
	drop if idperm>332
	sort idperm
	save perms2.dta, replace

use permutcontrol, clear
merge 1:1 idperm using perms2, nogenerate 	

forvalues x=1/2000 {
replace V`x'=0 if V`x'==1 & year<2016
}
	
forvalues x=1/2000 {
	
xtreg gdper i.year V`x', fe vce(cl muni)
estimates store oldest
lincomest  V`x'
parmest,label saving(ri`x'.dta,replace)  
estimates restore oldest
}
	
use ri1.dta, clear
forvalues x=1/2000 {
append using ri`x'.dta	
}
saveold riest2.dta, version(12) replace

*************************
*End of part C.statamuni*
*************************









****************
*Township-level*
****************




************************************************************************************************
*Instructions about the code: The code needs to be run according to the following the sequence:* 
*Step 1: Run Part A.statatown           ************************************************************
*Step 2: Run Part A.Rtown               * 
*Step 3: Run Part B.statatown           * 
*Step 4: Run Part B.Rtown               * 
*Step 5: Run Part C.statatown           *
*Step 6: Run Part C.Rtown               *
*****************************************

******************
******************
*Part A.statatown*
******************
******************

use datatown.dta,clear

gen evertr=0
replace evertr=1 if town==10 
replace evertr=1 if town==4 
replace evertr=1 if town==8 
replace evertr=1 if town==50 
replace evertr=1 if town==62 
replace evertr=1 if town==82 
replace evertr=1 if town==101
replace evertr=1 if town==107
replace evertr=1 if town==109
replace evertr=1 if town==135
replace evertr=1 if town==144
replace evertr=1 if town==140
replace evertr=1 if town==151
replace evertr=1 if town==157
replace evertr=1 if town==161
replace evertr=1 if town==152
replace evertr=1 if town==170
replace evertr=1 if town==192
replace evertr=1 if town==205
replace evertr=1 if town==229
replace evertr=1 if town==230
replace evertr=1 if town==242

drop if town==.
sort town year
gen idperm=_n
sort idperm
keep town year gdper towntr evertr idperm
saveold permuttown, replace version(12)

*************************
*End of part A.statatown*
*************************


******************
******************
*Part B.statatown*
******************
******************

use permstown.dta, clear
	gen idperm=_n
	sort idperm
	save permstownnew.dta, replace

use permuttown, clear
merge 1:1 idperm using permstownnew, nogenerate 	

forvalues x=1/2000 {
replace V`x'=0 if V`x'==1 & year<2016
}
	
forvalues x=1/2000 {
	
xtreg gdper i.year V`x', fe vce(cl town)
estimates store oldest
lincomest  V`x'
parmest,label saving(ri`x'town.dta,replace)  
estimates restore oldest
}
	
use ri1town.dta, clear
forvalues x=1/2000 {
append using ri`x'town.dta	
}
saveold riest1town.dta, version(12) replace







use datatown.dta, clear

gen evertr=0
replace evertr=1 if town==10 
replace evertr=1 if town==4 
replace evertr=1 if town==8 
replace evertr=1 if town==50 
replace evertr=1 if town==62 
replace evertr=1 if town==82 
replace evertr=1 if town==101
replace evertr=1 if town==107
replace evertr=1 if town==109
replace evertr=1 if town==135
replace evertr=1 if town==144
replace evertr=1 if town==140
replace evertr=1 if town==151
replace evertr=1 if town==157
replace evertr=1 if town==161
replace evertr=1 if town==152
replace evertr=1 if town==170
replace evertr=1 if town==192
replace evertr=1 if town==205
replace evertr=1 if town==229
replace evertr=1 if town==230
replace evertr=1 if town==242

drop if evertr==1
drop if year<2016
sort muni year
set seed 838
gen rand_num = uniform()
egen ordering = rank(rand_num)
gen trperm=0 
replace trperm=1 if ordering<=88

sort town year
keep trperm town
save riperm2.dta, replace
 	
use datatown	
merge  m:1 town using riperm2, nogenerate
drop if town==. | trperm==.
saveold permut2town,version(12) replace

*************************
*End of part B.statatown*
*************************


******************
******************
*Part c.statatown*
******************
******************


use datatown	, clear

gen evertr=0
replace evertr=1 if town==10 
replace evertr=1 if town==4 
replace evertr=1 if town==8 
replace evertr=1 if town==50 
replace evertr=1 if town==62 
replace evertr=1 if town==82 
replace evertr=1 if town==101
replace evertr=1 if town==107
replace evertr=1 if town==109
replace evertr=1 if town==135
replace evertr=1 if town==144
replace evertr=1 if town==140
replace evertr=1 if town==151
replace evertr=1 if town==157
replace evertr=1 if town==161
replace evertr=1 if town==152
replace evertr=1 if town==170
replace evertr=1 if town==192
replace evertr=1 if town==205
replace evertr=1 if town==229
replace evertr=1 if town==230
replace evertr=1 if town==242


drop if town==.
drop if evertr==1
sort town year
gen idperm=_n
sort idperm
keep town year gdper towntr idperm
save permutcontroltown, replace



use perms2town.dta, clear
	gen idperm=_n
	drop if idperm>332
	sort idperm
	save perms2town2.dta, replace

use permutcontroltown, clear
merge 1:1 idperm using perms2town2, nogenerate 	

forvalues x=1/2000 {
replace V`x'=0 if V`x'==1 & year<2016
}
	
forvalues x=1/2000 {
	
xtreg gdper i.year V`x', fe vce(cl town)
estimates store oldest
lincomest  V`x'
parmest,label saving(ri`x'town.dta,replace)  
estimates restore oldest
}
	
use ri1.dta, clear
forvalues x=1/2000 {
append using ri`x'town.dta	
}
saveold riest2town.dta, version(12) replace

*************************
*End of part C.statatown*
*************************
