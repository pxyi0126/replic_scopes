

clear all

set more off

cd "/path/to/replication/directory/"


use AllTown2012a.dta, clear
append using  AllTown2012b
append using  AllTown2015a
append using  AllTown2015b



saveold alltown.dta, replace 


sort township municipality perfecture year

bysort township year: egen sumall=total(valid)
bysort township year: egen sumgd=total(gd)
bysort township year: egen sumnd=total(nd)
bysort township year: egen sumsyriza=total(syriza)
bysort township year: egen sumpsk=total(pasok)
bysort township year: egen sumkke=total(kke)
bysort township year: egen sumanel=total(anel)
bysort township year: egen sumreg=total(registered)
bysort municipality: egen weights=total(registered)


gen gdvote=sumgd/sumall
gen ndvote=sumnd/sumall
gen syrizavote=sumsyriza/sumall
gen pasokvote=sumpsk/sumall
gen kkevote=sumkke/sumall
gen anelvote=sumanel/sumall
gen turnout = sumall/sumreg

bysort township year: gen id=_n

keep if id==1


sort township year
by township: gen id2=_n

ta id2

by township: egen munimax=max(id2)

encode township, gen(town)
encode municipality, gen(muni)
encode perfecture, gen(district)



gen towntr=0
replace towntr=1 if town==10 /*agathonisi*/ & year==2016
replace towntr=1 if town==4 /*agai paraskeyi*/ & year==2016
replace towntr=1 if town==8 /*agiou mina, xiou*/ & year==2016
replace towntr=1 if town==50 /*vatheas, samou*/ & year==2016
replace towntr=1 if town==62 /*dikaioy, ko*/ & year==2016
replace towntr=1 if town==82 /*evergetoyla, lesvou*/ & year==2016
replace towntr=1 if town==101 /*ionias, xiou*/ & year==2016
replace towntr=1 if town==107 /*kalymony*/ & year==2016
replace towntr=1 if town==109 /*kaboxoron, xiou*/ & year==2016
replace towntr=1 if town==135 /*ko, ko*/ & year==2016
replace towntr=1 if town==144 /*leipson*/ & year==2016
replace towntr=1 if town==140 /*lerou*/ & year==2016
replace towntr=1 if town==151 /*loutropoleos*/ & year==2016
replace towntr=1 if town==157 /*mantamadou*/ & year==2016
replace towntr=1 if town==161 /*megistis*/ & year==2016
replace towntr=1 if town==152 /*mithimnas*/ & year==2016
replace towntr=1 if town==170 /*mytilinis*/ & year==2016
replace towntr=1 if town==192 /*petras*/ & year==2016
replace towntr=1 if town==205 /*pythagoreiou*/ & year==2016
replace towntr=1 if town==229 /*symhs*/ & year==2016
replace towntr=1 if town==230 /*tiloy*/ & year==2016
replace towntr=1 if town==242 /*xalkis*/ & year==2016



xtset town year




ta town,gen(tn)
forvalues num= 1/248 {

gen s`num'trend=tn`num'*year
}


saveold townshipsall,replace 



bysort town (year): gen gdlag=gdvote[_n-1]
bysort town (year): gen ndlag=ndvote[_n-1]
bysort town (year): gen pasoklag=pasokvote[_n-1]
bysort town (year): gen anellag=anelvote[_n-1]
bysort town (year): gen syrizalag=syrizavote[_n-1]
bysort town (year): gen kkelag=kkevote[_n-1]
bysort town (year): gen turnlag=turnout[_n-1]


gen gdper=gdvote*100
gen gdlagper=gdlag*100


gen ndper=ndvote*100
gen ndlagper=ndlag*100

gen pasokper=pasokvote*100
gen pasoklagper=pasoklag*100

gen kkeper=kkevote*100
gen kkelagper=kkelag*100

gen syrizaper=syrizavote*100
gen syrizalagper=syrizalag*100

gen anelper=anelvote*100
gen anellagper=anellag*100

gen turnper=turnout*100
gen turnlagper=turnlag*100


gen gddif=gdper-gdlagper


*************End Of Data Management********************************************

saveold datatown.dta, version(12) replace
