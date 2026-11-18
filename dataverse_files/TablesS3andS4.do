
set more off

cd "/path/to/replication/directory/"


**********
*Table S3*
**********


use datamuni.dta,clear



***************
*Columns 1 & 2*
***************


ivregress 2sls gdperdif (treatment=logdist)  if year==2016, cluster(district) first



***************
*Columns 3 & 4*
***************


ivregress 2sls gdperdif (trarrprop=logdist)  if year==2016, cluster(district) first



**********
*Column 5*
**********

xi:regress gdper y2-y4 logdist y2dist y3dist y4dist, cluster(muni) 

**********
*Table S4*
**********


ivregress 2sls gdperdif (treatment=logdist)  if year==2016, first vce(bootstrap, reps(300) seed(123))
ivregress 2sls gdperdif (trarrprop=logdist)  if year==2016, first vce(bootstrap, reps(300) seed(123))



