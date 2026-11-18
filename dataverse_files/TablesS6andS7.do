set more off


cd "/path/to/replication/directory/"


***********
*Table S.3*
***********


****************
*Municipalities*
****************


use datamuni	, clear


***************
*New Democracy*
***************



**************
*Models 1 & 2*
**************

xtreg ndper i.year treatment , fe vce(cl muni)
xtreg ndper i.year treatment s2trend-s94trend, fe vce(cl muni)


**************
*Models 3 & 4*
**************


xtreg ndlagper i.year treatment , fe vce(cl muni)
xtreg ndlagper i.year treatment s2trend-s94trend, fe vce(cl muni)


***************
*Models 9 & 10*
***************


xtreg ndper i.year trarrprop , fe vce(cl muni)
xtreg ndper i.year trarrprop s2trend-s94trend, fe vce(cl muni)

****************
*Models 11 & 12*
****************


xtreg ndlagper i.year trarrprop , fe vce(cl muni)
xtreg ndlagper i.year trarrprop s2trend-s94trend, fe vce(cl muni)



********
*SYRIZA*
********

**************
*Models 1 & 2*
**************


xtreg syrizaper i.year treatment , fe vce(cl muni)
xtreg syrizaper i.year treatment s2trend-s94trend, fe vce(cl muni)


**************
*Models 3 & 4*
**************


xtreg syrizalagper i.year treatment , fe vce(cl muni)
xtreg syrizalagper i.year treatment s2trend-s94trend, fe vce(cl muni)


***************
*Models 9 & 10*
***************


xtreg syrizaper i.year trarrprop , fe vce(cl muni)
xtreg syrizaper i.year trarrprop s2trend-s94trend, fe vce(cl muni)

****************
*Models 11 & 12*
****************



xtreg syrizalagper i.year trarrprop , fe vce(cl muni)
xtreg syrizalagper i.year trarrprop s2trend-s94trend, fe vce(cl muni)



*******
*PASOK*
*******

**************
*Models 1 & 2*
**************



xtreg pasokper i.year treatment , fe vce(cl muni)
xtreg pasokper i.year treatment s2trend-s94trend, fe vce(cl muni)


**************
*Models 3 & 4*
**************

xtreg pasoklagper i.year treatment , fe vce(cl muni)
xtreg pasoklagper i.year treatment s2trend-s94trend, fe vce(cl muni)


***************
*Models 9 & 10*
***************


xtreg pasokper i.year trarrprop , fe vce(cl muni)
xtreg pasokper i.year trarrprop s2trend-s94trend, fe vce(cl muni)

****************
*Models 11 & 12*
****************


xtreg pasoklagper i.year trarrprop , fe vce(cl muni)
xtreg pasoklagper i.year trarrprop s2trend-s94trend, fe vce(cl muni)



******
*ANEL*
******

**************
*Models 1 & 2*
**************


xtreg anelper i.year treatment , fe vce(cl muni)
xtreg anelper i.year treatment s2trend-s94trend, fe vce(cl muni)

**************
*Models 3 & 4*
**************



xtreg anellagper i.year treatment , fe vce(cl muni)
xtreg anellagper i.year treatment s2trend-s94trend, fe vce(cl muni)


***************
*Models 9 & 10*
***************


xtreg anelper i.year trarrprop , fe vce(cl muni)
xtreg anelper i.year trarrprop s2trend-s94trend, fe vce(cl muni)


****************
*Models 11 & 12*
****************


xtreg anellagper i.year trarrprop , fe vce(cl muni)
xtreg anellagper i.year trarrprop s2trend-s94trend, fe vce(cl muni)



*****
*KKE*
*****

**************
*Models 1 & 2*
**************


xtreg kkeper i.year treatment , fe vce(cl muni)
xtreg kkeper i.year treatment s2trend-s94trend, fe vce(cl muni)

**************
*Models 3 & 4*
**************


xtreg kkelagper i.year treatment , fe vce(cl muni)
xtreg kkelagper i.year treatment s2trend-s94trend, fe vce(cl muni)

***************
*Models 9 & 10*
***************


xtreg kkeper i.year trarrprop , fe vce(cl muni)
xtreg kkeper i.year trarrprop s2trend-s94trend, fe vce(cl muni)

****************
*Models 11 & 12*
****************


xtreg kkelagper i.year trarrprop , fe vce(cl muni)
xtreg kkelagper i.year trarrprop s2trend-s94trend, fe vce(cl muni)




*********
*turnout*
*********

**************
*Models 1 & 2*
**************



xtreg turnper i.year treatment , fe vce(cl muni)
xtreg turnper i.year treatment s2trend-s94trend, fe vce(cl muni)

**************
*Models 3 & 4*
**************


xtreg turnlagper i.year treatment , fe vce(cl muni)
xtreg turnlagper i.year treatment s2trend-s94trend, fe vce(cl muni)


***************
*Models 9 & 10*
***************


xtreg turnper i.year trarrprop , fe vce(cl muni)
xtreg turnper i.year trarrprop s2trend-s94trend, fe vce(cl muni)

****************
*Models 11 & 12*
****************



xtreg turnlagper i.year trarrprop , fe vce(cl muni)
xtreg turnlagper i.year trarrprop s2trend-s94trend, fe vce(cl muni)


***********
*Townships*
***********

set more off
use datatown.dta, clear


***************
*New Democracy*
***************

**************
*Models 5 & 6*
**************



xtreg ndper i.year towntr, fe vce(cl town)
xtreg ndper i.year towntr s2trend-s247trend, fe vce(cl town)


**************
*Models 7 & 8*
**************


xtreg ndlagper i.year towntr, fe vce(cl town)
xtreg ndlagper i.year towntr s2trend-s247trend, fe vce(cl town)



********
*Syriza*
********

**************
*Models 5 & 6*
**************



xtreg syrizaper i.year towntr, fe vce(cl town)
xtreg syrizaper i.year towntr s2trend-s247trend, fe vce(cl town)


**************
*Models 7 & 8*
**************


xtreg syrizalagper i.year towntr, fe vce(cl town)
xtreg syrizalagper i.year towntr s2trend-s247trend, fe vce(cl town)


*******
*PASOK*
*******




**************
*Models 5 & 6*
**************



xtreg pasokper i.year towntr, fe vce(cl town)
xtreg pasokper i.year towntr s2trend-s247trend, fe vce(cl town)


**************
*Models 7 & 8*
**************


xtreg pasoklagper i.year towntr, fe vce(cl town)
xtreg pasoklagper i.year towntr s2trend-s247trend, fe vce(cl town)


*****
*KKE*
*****


**************
*Models 5 & 6*
**************



xtreg kkeper i.year towntr, fe vce(cl town)
xtreg kkeper i.year towntr s2trend-s247trend, fe vce(cl town)


**************
*Models 7 & 8*
**************


xtreg kkelagper i.year towntr, fe vce(cl town)
xtreg kkelagper i.year towntr s2trend-s247trend, fe vce(cl town)


******
*ANEL*
******



**************
*Models 5 & 6*
**************



xtreg anelper i.year towntr, fe vce(cl town)
xtreg anelper i.year towntr s2trend-s247trend, fe vce(cl town)


**************
*Models 7 & 8*
**************


xtreg anellagper i.year towntr, fe vce(cl town)
xtreg anellagper i.year towntr s2trend-s247trend, fe vce(cl town)


*********
*Turnout*
*********

**************
*Models 5 & 6*
**************



xtreg turnper i.year towntr, fe vce(cl town)
xtreg turnper i.year towntr s2trend-s247trend, fe vce(cl town)


**************
*Models 7 & 8*
**************


xtreg turnlagper i.year towntr, fe vce(cl town)
xtreg turnlagper i.year towntr s2trend-s247trend, fe vce(cl town)







set more off


***********
*Table S.4*
***********


use datamuni	, clear

***************
*New Democracy*
***************



ivregress 2sls ndperdif (treatment=logdist)  if year==2016, cluster(district) first
ivregress 2sls ndperdif (trarrprop=logdist)  if year==2016, cluster(district) first


********
*Syriza*
********



ivregress 2sls syrizaperdif (treatment=logdist)  if year==2016, cluster(district) first
ivregress 2sls syrizaperdif (trarrprop=logdist)  if year==2016, cluster(district) first


*******
*PASOK*
*******


ivregress 2sls anelperdif (treatment=logdist)  if year==2016, cluster(district) first
ivregress 2sls anelperdif (trarrprop=logdist)  if year==2016, cluster(district) first


******
*ANEL*
******


ivregress 2sls pasokperdif (treatment=logdist)  if year==2016, cluster(district) first
ivregress 2sls pasokperdif (trarrprop=logdist)  if year==2016, cluster(district) first


*****
*KKE*
*****


ivregress 2sls kkeperdif (treatment=logdist)  if year==2016, cluster(district) first
ivregress 2sls kkeperdif (trarrprop=logdist)  if year==2016, cluster(district) first


*********
*Turnout*
*********


ivregress 2sls turnperdif (treatment=logdist)  if year==2016, cluster(district) first
ivregress 2sls turnperdif (trarrprop=logdist)  if year==2016, cluster(district) first

