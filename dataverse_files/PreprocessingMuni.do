clear all
	
set more off

cd "/path/to/replication/directory/"
	

	use AllTown2012a.dta, clear
	append using  AllTown2012b
	append using  AllTown2015a
	append using  AllTown2015b

	saveold allmuni.dta, replace

	sort township municipality perfecture year

	bysort municipality year: egen sumall=total(valid)
	bysort municipality year: egen sumgd=total(gd)
	bysort municipality year: egen sumnd=total(nd)
	bysort municipality year: egen sumsyriza=total(syriza)
	bysort municipality year: egen sumpsk=total(pasok)
	bysort municipality year: egen sumkke=total(kke)
    bysort municipality year: egen sumanel=total(anel)
    bysort municipality year: egen sumreg=total(registered)
	bysort municipality: egen weights=total(registered)

	gen gdvote=sumgd/sumall
	gen ndvote=sumnd/sumall
	gen syrizavote=sumsyriza/sumall
	gen pasokvote=sumpsk/sumall
	gen kkevote=sumkke/sumall
    gen anelvote=sumanel/sumall
	gen turnout = sumall/sumreg
	
	bysort municipality year: gen id=_n

	keep if id==1


	sort municipality year
	by municipality: gen id2=_n

	ta id2

	by municipality: egen munimax=max(id2)

	encode township, gen(town)
	encode municipality, gen(muni)
	encode perfecture, gen(district)


	saveold municipalitysall, replace 


	gen treatment=0

	replace treatment=0 if muni==3 & year==2016 /*Ag.Evstratios*/

	replace treatment=1 if muni==47 & year==2016 /*Lesvos*/

	replace treatment=0 if muni==48 & year==2016 /*Limnos*/

	replace treatment=1 if muni==91 & year==2016 /*chios*/

	replace treatment=0 if muni==61 & year==2016 /*OINOUSA*/

	replace treatment=0 if muni==95 & year==2016 /*PSARA*/

	replace treatment=0 if muni==86 & year==2016 /*FOURNOI*/

	replace treatment=0 if muni==30 & year==2016 /*IKARIA*/

	replace treatment=1 if muni==70 & year==2016 /*SAMOU*/

	replace treatment=1 if muni==5 & year==2016 /*AGATHONISI*/

	replace treatment=0 if muni==16 & year==2016 /*ASTYPALAIA*/

	replace treatment=1 if muni==90 & year==2016 /*CHALKI*/

	replace treatment=1 if muni==35 & year==2016 /*KALYMNOS*/

	replace treatment=0 if muni==37 & year==2016 /*KARPATHOS*/

	replace treatment=0 if muni==32 & year==2016 /*KASOS*/

	replace treatment=1 if muni==43 & year==2016 /*KOS*/

	replace treatment=1 if muni==49 & year==2016 /*leipsoi*/

	replace treatment=1 if muni==46 & year==2016 /*LEROS*/

	replace treatment=1 if muni==54 & year==2016 /*megisti*/

	replace treatment=0 if muni==60 & year==2016 /*nisiros*/

	replace treatment=0 if muni==64 & year==2016 /*patmos*/

	replace treatment=0 if muni==69 & year==2016 /*rhodes*/

	replace treatment=1 if muni==82 & year==2016 /*symh*/

	replace treatment=1 if muni==84 & year==2016 /*tilos*/

	replace treatment=0 if muni==73 & year==2016 /*samothraki*/

	replace treatment=0 if muni==9 & year==2016 /*amorgos*/

	replace treatment=0 if muni==10 & year==2016 /*anafi*/

	replace treatment=0 if muni==11 & year==2016 /*andros*/

	replace treatment=0 if muni==12 & year==2016 /*antiparos*/

	replace treatment=0 if muni==26 & year==2016 /*santorini*/

	replace treatment=0 if muni==28 & year==2016 /*Ios*/

	replace treatment=0 if muni==33 & year==2016 /*Keas*/

	replace treatment=0 if muni==40 & year==2016 /*kimolos*/

	replace treatment=0 if muni==44 & year==2016 /*kythnos*/

	replace treatment=0 if muni==51 & year==2016 /*milos*/

	replace treatment=0 if muni==57 & year==2016 /*mykonos*/

	replace treatment=0 if muni==59 & year==2016 /*naxos*/

	replace treatment=0 if muni==63 & year==2016 /*Paros*/

	replace treatment=0 if muni==71 & year==2016 /*Sifnos*/

	replace treatment=0 if muni==74 & year==2016 /*Serifos*/

	replace treatment=0 if muni==76 & year==2016 /*Sikinos*/

	replace treatment=0 if muni==83 & year==2016 /*Syros*/

	replace treatment=0 if muni==85 & year==2016 /*Tinos*/

	replace treatment=0 if muni==88 & year==2016 /*Folegandros*/

	replace treatment=0 if muni==25 & year==2016 /*Thasos*/

	replace treatment=0 if muni==78 & year==2016 /*Skopelos*/

	replace treatment=0 if muni==7 & year==2016 /*Alonisos*/

	replace treatment=0 if muni==77 & year==2016 /*Skiathos*/

	replace treatment=0 if muni==79 & year==2016 /*Sryros*/

	replace treatment=0 if muni==67 & year==2016 /*Poros*/

	replace treatment=0 if muni==1 & year==2016 /*Aigina*/

	replace treatment=0 if muni==72 & year==2016 /*Salamina*/

	replace treatment=0 if muni==86 & year==2016 /*Ydra*/

	replace treatment=0 if muni==80 & year==2016 /*Spetses*/














	gen trarrivals=0

	replace trarrivals=0 if muni==3 & year==2016 /*Ag.Evstratios*/

	replace trarrivals=201867 if muni==47 & year==2016 /*Lesvos*/

	replace trarrivals=0 if muni==48 & year==2016 /*Limnos*/

	replace trarrivals=47192 if muni==91 & year==2016 /*chios*/

	replace trarrivals=0 if muni==61 & year==2016 /*OINOUSA*/

	replace trarrivals=0 if muni==95 & year==2016 /*PSARA*/

	replace trarrivals=0 if muni==86 & year==2016 /*FOURNOI*/

	replace trarrivals=0 if muni==30 & year==2016 /*IKARIA*/

	replace trarrivals=42858 if muni==70 & year==2016 /*SAMOU*/

	replace trarrivals=15288 if muni==5 & year==2016 /*AGATHONISI*/

	replace trarrivals=0 if muni==16 & year==2016 /*ASTYPALAIA*/

	replace trarrivals=1247 if muni==90 & year==2016 /*CHALKI*/

	replace trarrivals=6436 if muni==35 & year==2016 /*KALYMNOS*/

	replace trarrivals=0 if muni==37 & year==2016 /*KARPATHOS*/

	replace trarrivals=0 if muni==32 & year==2016 /*KASOS*/

	replace trarrivals=40424 if muni==43 & year==2016 /*KOS*/

	replace trarrivals=. if muni==49 & year==2016 /*leipsoi*/

	replace trarrivals=10272 if muni==46 & year==2016 /*LEROS*/

	replace trarrivals=1359 if muni==54 & year==2016 /*megisti*/

	replace trarrivals=0 if muni==60 & year==2016 /*nisiros*/

	replace trarrivals=0 if muni==64 & year==2016 /*patmos*/

	replace trarrivals=0 if muni==69 & year==2016 /*rhodes*/

	replace trarrivals=3661 if muni==82 & year==2016 /*symh*/

	replace trarrivals=650 if muni==84 & year==2016 /*tilos*/

	replace trarrivals=0 if muni==73 & year==2016 /*samothraki*/

	replace trarrivals=0 if muni==9 & year==2016 /*amorgos*/

	replace trarrivals=0 if muni==10 & year==2016 /*anafi*/

	replace trarrivals=0 if muni==11 & year==2016 /*andros*/

	replace trarrivals=0 if muni==12 & year==2016 /*antiparos*/

	replace trarrivals=0 if muni==26 & year==2016 /*santorini*/

	replace trarrivals=0 if muni==28 & year==2016 /*Ios*/

	replace trarrivals=0 if muni==33 & year==2016 /*Keas*/

	replace trarrivals=0 if muni==40 & year==2016 /*kimolos*/

	replace trarrivals=0 if muni==44 & year==2016 /*kythnos*/

	replace trarrivals=0 if muni==51 & year==2016 /*milos*/

	replace trarrivals=0 if muni==57 & year==2016 /*mykonos*/

	replace trarrivals=0 if muni==59 & year==2016 /*naxos*/

	replace trarrivals=0 if muni==63 & year==2016 /*Paros*/

	replace trarrivals=0 if muni==71 & year==2016 /*Sifnos*/

	replace trarrivals=0 if muni==74 & year==2016 /*Serifos*/

	replace trarrivals=0 if muni==76 & year==2016 /*Sikinos*/

	replace trarrivals=0 if muni==83 & year==2016 /*Syros*/

	replace trarrivals=0 if muni==85 & year==2016 /*Tinos*/

	replace trarrivals=0 if muni==88 & year==2016 /*Folegandros*/

	replace trarrivals=0 if muni==25 & year==2016 /*Thasos*/

	replace trarrivals=0 if muni==78 & year==2016 /*Skopelos*/

	replace trarrivals=0 if muni==7 & year==2016 /*Alonisos*/

	replace trarrivals=0 if muni==77 & year==2016 /*Skiathos*/

	replace trarrivals=0 if muni==79 & year==2016 /*Sryros*/

	replace trarrivals=0 if muni==67 & year==2016 /*Poros*/

	replace trarrivals=0 if muni==1 & year==2016 /*Aigina*/

	replace trarrivals=0 if muni==72 & year==2016 /*Salamina*/

	replace trarrivals=0 if muni==86 & year==2016 /*Ydra*/

	replace trarrivals=0 if muni==80 & year==2016 /*Spetses*/







	gen trarrprop=0

	replace trarrprop=0 if muni==3 & year==2016 /*Ag.Evstratios*/

	replace trarrprop=4.485734 if muni==47 & year==2016 /*Lesvos*/

	replace trarrprop=0 if muni==48 & year==2016 /*Limnos*/

	replace trarrprop=1.737875 if muni==91 & year==2016 /*chios*/

	replace trarrprop=0 if muni==61 & year==2016 /*OINOUSA*/

	replace trarrprop=0 if muni==95 & year==2016 /*PSARA*/

	replace trarrprop=0 if muni==86 & year==2016 /*FOURNOI*/

	replace trarrprop=0 if muni==30 & year==2016 /*IKARIA*/

	replace trarrprop=2.492324 if muni==70 & year==2016 /*SAMOU*/

	replace trarrprop=125.3115 if muni==5 & year==2016 /*AGATHONISI*/

	replace trarrprop=0 if muni==16 & year==2016 /*ASTYPALAIA*/

	replace trarrprop=4.009646 if muni==90 & year==2016 /*CHALKI*/

	replace trarrprop=0.8710245 if muni==35 & year==2016 /*KALYMNOS*/

	replace trarrprop=0 if muni==37 & year==2016 /*KARPATHOS*/

	replace trarrprop=0 if muni==32 & year==2016 /*KASOS*/

	replace trarrprop=2.499165 if muni==43 & year==2016 /*KOS*/

	replace trarrprop=. if muni==49 & year==2016 /*leipsoi*/

	replace trarrprop=2.623085 if muni==46 & year==2016 /*LEROS*/

	replace trarrprop=3.298544 if muni==54 & year==2016 /*megisti*/

	replace trarrprop=0 if muni==60 & year==2016 /*nisiros*/

	replace trarrprop=0 if muni==64 & year==2016 /*patmos*/

	replace trarrprop=0 if muni==69 & year==2016 /*rhodes*/

	replace trarrprop=2.723958 if muni==82 & year==2016 /*symh*/

	replace trarrprop=1.597052 if muni==84 & year==2016 /*tilos*/

	replace trarrprop=0 if muni==73 & year==2016 /*samothraki*/

	replace trarrprop=0 if muni==9 & year==2016 /*amorgos*/

	replace trarrprop=0 if muni==10 & year==2016 /*anafi*/

	replace trarrprop=0 if muni==11 & year==2016 /*andros*/

	replace trarrprop=0 if muni==12 & year==2016 /*antiparos*/

	replace trarrprop=0 if muni==26 & year==2016 /*santorini*/

	replace trarrprop=0 if muni==28 & year==2016 /*Ios*/

	replace trarrprop=0 if muni==33 & year==2016 /*Keas*/

	replace trarrprop=0 if muni==40 & year==2016 /*kimolos*/

	replace trarrprop=0 if muni==44 & year==2016 /*kythnos*/

	replace trarrprop=0 if muni==51 & year==2016 /*milos*/

	replace trarrprop=0 if muni==57 & year==2016 /*mykonos*/

	replace trarrprop=0 if muni==59 & year==2016 /*naxos*/

	replace trarrprop=0 if muni==63 & year==2016 /*Paros*/

	replace trarrprop=0 if muni==71 & year==2016 /*Sifnos*/

	replace trarrprop=0 if muni==74 & year==2016 /*Serifos*/

	replace trarrprop=0 if muni==76 & year==2016 /*Sikinos*/

	replace trarrprop=0 if muni==83 & year==2016 /*Syros*/

	replace trarrprop=0 if muni==85 & year==2016 /*Tinos*/

	replace trarrprop=0 if muni==88 & year==2016 /*Folegandros*/

	replace trarrprop=0 if muni==25 & year==2016 /*Thasos*/

	replace trarrprop=0 if muni==78 & year==2016 /*Skopelos*/

	replace trarrprop=0 if muni==7 & year==2016 /*Alonisos*/

	replace trarrprop=0 if muni==77 & year==2016 /*Skiathos*/

	replace trarrprop=0 if muni==79 & year==2016 /*Sryros*/

	replace trarrprop=0 if muni==67 & year==2016 /*Poros*/

	replace trarrprop=0 if muni==1 & year==2016 /*Aigina*/

	replace trarrprop=0 if muni==72 & year==2016 /*Salamina*/

	replace trarrprop=0 if muni==86 & year==2016 /*Ydra*/

	replace trarrprop=0 if muni==80 & year==2016 /*Spetses*/




	gen distance=.

	replace distance=87.09 if muni==3  /*Ag.Evstratios*/

	replace distance=9.23 if muni==47  /*Lesvos*/

	replace distance=61.35 if muni==48  /*Limnos*/

	replace distance=6.58 if muni==91  /*chios*/

	replace distance=8.71 if muni==61  /*OINOUSA*/

	replace distance=61.46 if muni==95  /*PSARA*/

	replace distance=40.69 if muni==86  /*FOURNOI*/

	replace distance=56.42 if muni==30  /*IKARIA*/

	replace distance=1.8 if muni==70  /*SAMOU*/

	replace distance=15.58 if muni==5  /*AGATHONISI*/

	replace distance=80.22 if muni==16  /*ASTYPALAIA*/

	replace distance=47.57 if muni==90  /*CHALKI*/

	replace distance=16.54 if muni==35  /*KALYMNOS*/

	replace distance=95.13 if muni==37  /*KARPATHOS*/

	replace distance=142 if muni==32  /*KASOS*/

	replace distance=4.82 if muni==43  /*KOS*/

	replace distance=35.83 if muni==49  /*leipsoi*/

	replace distance=30.24 if muni==46  /*LEROS*/

	replace distance=2.06 if muni==54  /*megisti*/

	replace distance=17.33 if muni==60  /*nisiros*/

	replace distance=51.27 if muni==64  /*patmos*/

	replace distance=17.8 if muni==69  /*rhodes*/

	replace distance=6.67 if muni==82  /*symh*/

	replace distance=20.58 if muni==84  /*tilos*/

	replace distance=62.67 if muni==73  /*samothraki*/

	replace distance=103.47 if muni==9  /*amorgos*/

	replace distance=139.36 if muni==10  /*anafi*/

	replace distance=118.87 if muni==11  /*andros*/

	replace distance=168.65 if muni==12  /*antiparos*/

	replace distance=170.75 if muni==26  /*santorini*/

	replace distance=166.63 if muni==28  /*Ios*/

	replace distance=173.58 if muni==33  /*Keas*/

	replace distance=214.97 if muni==40  /*kimolos*/

	replace distance=179.97 if muni==44  /*kythnos*/

	replace distance=224.28 if muni==51  /*milos*/

	replace distance=111.04 if muni==57  /*mykonos*/

	replace distance=133.06 if muni==59  /*naxos*/

	replace distance=149.56 if muni==63  /*Paros*/

	replace distance=192.97 if muni==71  /*Sifnos*/

	replace distance=191.36 if muni==74  /*Serifos*/

	replace distance=185.62 if muni==76  /*Sikinos*/

	replace distance=142.33 if muni==83  /*Syros*/

	replace distance=112.62 if muni==85  /*Tinos*/

	replace distance=208.06 if muni==88  /*Folegandros*/

	replace distance=137.34 if muni==25  /*Thasos*/

	replace distance=199.31 if muni==78  /*Skopelos*/

	replace distance=180.30 if muni==7  /*Alonisos*/

	replace distance=221.72 if muni==77  /*Skiathos*/

	replace distance=140.44 if muni==79  /*Sryros*/

	replace distance=251.60 if muni==67  /*Poros*/

	replace distance=240.08 if muni==1  /*Aigina*/

	replace distance=234.72 if muni==72  /*Salamina*/

	replace distance=253.66 if muni==86  /*Ydra*/

	replace distance=291.48 if muni==80  /*Spetses*/
	


	replace distance=318.49 if muni==2 /*Agios Vasilios Rethymno*/
	
	replace distance=223.41 if muni==4 /*Agios Nikolaos Lasithi*/
	
	replace distance=254.01 if muni==6 /*Aggistri Pireaus*/
	
	replace distance=291.84 if muni==8 /*Amari Rethymno*/
	
	replace distance=273.03 if muni==13 /*Anogeia Rethymno*/
	
	replace distance=325.59 if muni==14 /*Apokoronas Chania*/
	
	replace distance=257.47 if muni==15 /*Archanes Heraklio*/
	
	replace distance=253.72 if muni==17 /*Viannos Heraklio*/
	
	replace distance=356.47 if muni==18 /*Gavdos Chania*/
	
	replace distance=286.81 if muni==19 /*Gortynas Heraklio*/
	
	replace distance=210.01 if muni==20 /*Dirfus Evoia*/
	
	replace distance=384.48 if muni==21 /*Elafonisos Lakonias*/
	
	replace distance=205.79 if muni==22 /*Eretria Evoia*/
	
	replace distance=250.38 if muni==24 /*Heraklio*/
	
	replace distance=236.24 if muni==27 /*Ierapetra*/
	
	replace distance=257.60 if muni==31 /*Istiea-Edipsos*/
	
	replace distance=364.22 if muni==36 /*Selinos Chania*/
	
	replace distance=158.62 if muni==38 /*Karystos Evoia*/
	
	replace distance=359.02 if muni==41 /*Kissamos*/
	
	replace distance=385.87 if muni==42 /*Kythira*/
	
	replace distance=190.28 if muni==45 /*Kymi Evoias*/
	
	replace distance=256.14 if muni==52 /*Malevizi Heraklio*/
	
	replace distance=246.37 if muni==53 /*Mantoudi Evoia*/
	
	replace distance=252.10 if muni==56 /*Minoa Heraklio*/
	
	replace distance=276.37 if muni==58 /*Mylopotamos*/
	
	replace distance=240.01 if muni==62 /*Oropedio Lasithiou*/
	
	replace distance=338.80 if muni==66 /*Platanias Chania*/
	
	replace distance=297.40 if muni==68 /*Rethymno*/
	
	replace distance=199.45 if muni==75 /*Siteia*/
	
	replace distance=333.13 if muni==81 /*Sfakia*/
	
	replace distance=288.35 if muni==87 /*Faistos Heraklio*/
	
	replace distance=40.68 if muni==89 /*Fournoi Samou*/
	
	replace distance=228.03 if muni==92 /*Chalkida*/
	
	replace distance=327.28 if muni==93 /*Chania*/
	
	replace distance=233.39 if muni==94 /*Chersonisos Heraklio*/
	
	replace distance=462.81 if muni==23 /*Zakynthos*/
	
	replace distance=476.14 if muni==29 /*Ithaki*/
	
	replace distance=510.32 if muni==34 /*Corfu*/
	
	replace distance=504.08 if muni==65 /*Paxoi*/
	
	replace distance=466.62 if muni==50 /*Lefkada*/
	
	replace distance=462.40 if muni==55 /*Meganisi*/
	
	replace distance=473.55 if muni==39 /*Kefalonia*/
	
	gen logdist=log(distance)


	xtset muni year

	

	ta muni,gen(isl)
	forvalues num= 1/95 {

	gen s`num'trend=isl`num'*year
	}








bysort muni (year): gen gdlag=gdvote[_n-1]
bysort muni (year): gen gdlag2=gdvote[_n-2]
bysort muni (year): gen gdlag3=gdvote[_n-3]
bysort muni (year): gen gdlag4=gdvote[_n-4]
bysort muni (year): gen trlead=treatment[_n+1]
bysort muni (year): gen trarrlead=trarrivals[_n+1]
bysort muni (year): gen trarrperlead=trarrprop[_n+1]

bysort muni (year): gen ndlag=ndvote[_n-1]
bysort muni (year): gen ndlag2=ndvote[_n-2]
bysort muni (year): gen ndlag3=ndvote[_n-3]
bysort muni (year): gen ndlag4=ndvote[_n-4]
bysort muni (year): gen pasoklag=pasokvote[_n-1]
bysort muni (year): gen pasoklag2=pasokvote[_n-2]
bysort muni (year): gen pasoklag3=pasokvote[_n-3]
bysort muni (year): gen pasoklag4=pasokvote[_n-4]
bysort muni (year): gen anellag=anelvote[_n-1]
bysort muni (year): gen anellag2=anelvote[_n-2]
bysort muni (year): gen anellag3=anelvote[_n-3]
bysort muni (year): gen anellag4=anelvote[_n-4]
bysort muni (year): gen syrizalag=syrizavote[_n-1]
bysort muni (year): gen syrizalag2=syrizavote[_n-2]
bysort muni (year): gen syrizalag3=syrizavote[_n-3]
bysort muni (year): gen syrizalag4=syrizavote[_n-4]
bysort muni (year): gen kkelag=kkevote[_n-1]
bysort muni (year): gen kkelag2=kkevote[_n-2]
bysort muni (year): gen kkelag3=kkevote[_n-3]
bysort muni (year): gen kkelag4=kkevote[_n-4]
bysort muni (year): gen turnlag=turnout[_n-1]
bysort muni (year): gen turnlag2=turnout[_n-2]
bysort muni (year): gen turnlag3=turnout[_n-3]
bysort muni (year): gen turnlag4=turnout[_n-4]


gen gdper=gdvote*100
gen gdlagper=gdlag*100
gen gdlag2per=gdlag2*100
gen gdlag3per=gdlag3*100
gen gdlag4per=gdlag4*100

gen gddif=gdvote-gdlag

gen gdperdif=gdper-gdlagper
gen gdperdif2=gdlagper-gdlag2per
gen gdperdif3=gdlagper-gdlag3per
gen gdperdif4=gdlagper-gdlag4per


gen ndper=ndvote*100
gen ndlagper=ndlag*100
gen ndlag2per=ndlag2*100
gen ndlag3per=ndlag3*100
gen ndlag4per=ndlag4*100

gen nddif=ndvote-ndlag

gen ndperdif=ndper-ndlagper
gen ndperdif2=ndlagper-ndlag2per
gen ndperdif3=ndlagper-ndlag3per
gen ndperdif4=ndlagper-ndlag4per


gen pasokper=pasokvote*100
gen pasoklagper=pasoklag*100
gen pasoklag2per=pasoklag2*100
gen pasoklag3per=pasoklag3*100
gen pasoklag4per=pasoklag4*100

gen pasokdif=pasokvote-pasoklag

gen pasokperdif=pasokper-pasoklagper
gen pasokperdif2=pasoklagper-pasoklag2per
gen pasokperdif3=pasoklagper-pasoklag3per
gen pasokperdif4=pasoklagper-pasoklag4per


gen kkeper=kkevote*100
gen kkelagper=kkelag*100
gen kkelag2per=kkelag2*100
gen kkelag3per=kkelag3*100
gen kkelag4per=kkelag4*100

gen kkedif=kkevote-kkelag

gen kkeperdif=kkeper-kkelagper
gen kkeperdif2=kkelagper-kkelag2per
gen kkeperdif3=kkelagper-kkelag3per
gen kkeperdif4=kkelagper-kkelag4per

gen syrizaper=syrizavote*100
gen syrizalagper=syrizalag*100

gen syrizalag2per=syrizalag2*100
gen syrizalag3per=syrizalag3*100
gen syrizalag4per=syrizalag4*100

gen syrizadif=syrizavote-syrizalag

gen syrizaperdif=syrizaper-syrizalagper
gen syrizaperdif2=syrizalagper-syrizalag2per
gen syrizaperdif3=syrizalagper-syrizalag3per
gen syrizaperdif4=syrizalagper-syrizalag4per

gen anelper=anelvote*100
gen anellagper=anellag*100
gen anellag2per=anellag2*100
gen anellag3per=anellag3*100
gen anellag4per=anellag4*100

gen aneldif=anelvote-anellag

gen anelperdif=anelper-anellagper
gen anelperdif2=anellagper-anellag2per
gen anelperdif3=anellagper-anellag3per
gen anelperdif4=anellagper-anellag4per


gen turnper=turnout*100
gen turnlagper=turnlag*100
gen turnlag2per=turnlag2*100
gen turnlag3per=turnlag3*100
gen turnlag4per=turnlag4*100

gen turndif=turnout-turnlag

gen turnperdif=turnper-turnlagper
gen turnperdif2=turnlagper-turnlag2per
gen turnperdif3=turnlagper-turnlag3per
gen turnperdif4=turnlagper-turnlag4per




gen post=0
replace post=1 if year==2016
gen logdistpost=logdist*post
gen distpost=distance*post


ta year,gen(y)

gen y1dist=y1*logdist
gen y2dist=y2*logdist
gen y3dist=y3*logdist
gen y4dist=y4*logdist



gen evertr=0
replace evertr=1 if muni==47
replace evertr=1 if muni==91
replace evertr=1 if muni==70
replace evertr=1 if muni==5
replace evertr=1 if muni==90
replace evertr=1 if muni==43
replace evertr=1 if muni==35
replace evertr=1 if muni==49
replace evertr=1 if muni==46
replace evertr=1 if muni==54
replace evertr=1 if muni==82
replace evertr=1 if muni==84


************
*Top Coding*
************




saveold notopcoding.dta,  version(12) replace
replace trarrprop=5 if trarrprop>10 & trarrprop!=.
saveold datamuni.dta,  version(12) replace


*********************************************************************************************
*********************************************************************************************
*********************************************************************************************
**Constructing dataset for the placebo analysis with non-registered voters (Figures S5, S6)**
*********************************************************************************************
*********************************************************************************************
*********************************************************************************************

**********************************************************************************************************************
**********************************************************************************************************************
*Placebo 1: Constructing dataset for comparison between residents of treated islands and residents of control islands*
**********************************************************************************************************************
**********************************************************************************************************************

****************************************************************************
*first step: generate variables of interest from the non-registered dataset*
****************************************************************************






use eterodimotes.dta, clear

drop if registered==0
rename district perfecture
	bysort perfecture year: egen sumall=total(valid)
	bysort perfecture year: egen sumgd=total(gd)
	bysort perfecture year: egen sumnd=total(nd)
	bysort perfecture year: egen sumsyriza=total(syriza)
	bysort perfecture year: egen sumpsk=total(pasok)
	bysort perfecture year: egen sumkke=total(kke)
    bysort perfecture year: egen sumanel=total(anel)

	
	gen gdvote=sumgd/sumall
	gen ndvote=sumnd/sumall
	gen syrizavote=sumsyriza/sumall
	gen pasokvote=sumpsk/sumall
	gen kkevote=sumkke/sumall
    gen anelvote=sumanel/sumall

	bysort perfecture year: gen id=_n

	keep if id==1

	
	gen district=3 if perfecture=="Δωδεκανήσου"
	replace district=12 if perfecture=="Λέσβου"
	replace district=19 if perfecture=="Χίου"
	replace district=18 if perfecture=="Σάμου"

gen eter=1	
	
gen muni=district+500
gen gdper=gdvote*100



	
save eteroapp,replace


**********************************************************
*2nd step: append non-registered data on the main dataset*
**********************************************************




use datamuni	, clear

gen eter=0
drop evertr
gen evertr=0
replace evertr=1 if muni==47
replace evertr=1 if muni==91
replace evertr=1 if muni==70
replace evertr=1 if muni==5
replace evertr=1 if muni==90
replace evertr=1 if muni==43
replace evertr=1 if muni==35
replace evertr=1 if muni==49
replace evertr=1 if muni==46
replace evertr=1 if muni==54
replace evertr=1 if muni==82
replace evertr=1 if muni==84


append using eteroapp

gen trplacebo=0
replace trplacebo=1 if eter==1 & year==2016
*replace trplacebo=1 if (muni==512 & year==2016) | (muni==519 & year==2016)
replace trplacebo=. if evertr==1


xtset muni year

save ddplacebo1, replace



***********************************************************
*What follows is code needed to prepare data for Figure S5*
***********************************************************


collapse (mean) gdper  (semean) segdper=gdper if eter==1,by(year)
sort year

saveold partrends1half, version(12) replace

use ddplacebo1, clear
collapse (mean) gdper  (semean) segdper=gdper if eter==0,by(year)
sort year

saveold partrends2half, version(12) replace

use partrends1half.dta
append using partrends2half.dta

gen id=_n

gen trpl=1 if id<5
replace trpl=0 if id>4



gen gdcilo=gdper-1.96 * segdper
gen gdcihi=gdper+1.96 * segdper
*label define yr 2012 "2012a" 2013 "2012b" 2015 "2015a" 2016 "2015b"
*label values year yr
*bysort evertr: gen id=5-_n



bysort trpl (year): gen id4=_n

label define nn 0 "Control" 1 "Treated"
label values trpl nn

saveold partrends1, version(12) replace





































**************************************************************************************************************************
**************************************************************************************************************************
*Placebo 2: Constructing dataset for comparison between residents of treated islands and non-residents of control islands*
**************************************************************************************************************************
**************************************************************************************************************************

****************************************************************************
*first step: generate variables of interest from the non-registered dataset*
****************************************************************************



use eterodimotes3.dta, clear

encode district, gen(nuts3)
tab nuts3

replace year=2013 if year==2012.5
replace year=2016 if year==2015.5

sort station nuts3 year

bysort nuts3 year: egen sumregistered = total(registered)
bysort nuts3 year: egen sumall=total(valid)
bysort nuts3 year: egen sumgd=total(gd)
bysort nuts3 year: egen sumnd=total(nd)
bysort nuts3 year: egen sumsyriza=total(syriza)
bysort nuts3 year: egen sumpsk=total(pasok)
bysort nuts3 year: egen sumkke=total(kke)
bysort nuts3 year: egen sumanel=total(anel)
bysort nuts3 year: egen sumpotami=total(potami)

gen gdvote=sumgd/sumall
gen ndvote=sumnd/sumall
gen syrizavote=sumsyriza/sumall
gen pasokvote=sumpsk/sumall
gen kkevote=sumkke/sumall
gen anelvote=sumanel/sumall
gen potamivote=sumpotami/sumall

bysort nuts3 year: gen id=_n

keep if id==1


sort nuts3 year


gen treat=1 if nuts3==3
replace treat=1 if nuts3==9
replace treat=1 if nuts3==13
replace treat=1 if nuts3==14 
replace treat=0 if treat==.

gen post=1 if year==2016


replace post=0 if year<=2015

gen treat_post = treat*post 

xtset nuts3 year

**** DiD graph ***

bysort year: egen treatavg=mean(gdvote) if treat==1
bysort year: egen controlavg=mean(gdvote) if treat==0

sum treatavg controlavg


gen trtrend=treat*year


tab nuts3,gen(nt)
forvalues num= 1/15 {

gen nuts`num'trend=nt`num'*year
}



gen gdper=gdvote*100

save ddplacebo2.dta, replace





	#################
	#parallel trends#
	#################



	use ddplacebo2.dta, clear

	gen treatavgper=treatavg*100
	gen controlavgper=controlavg*100


	*collapse gdper treatavgper controlavgper if treat==0, by(year)
	*sort year

	collapse (mean) gdper treatavgper controlavgper (semean) segdper=gdper if treat==0, by(year)
	sort year

	save parallelpl1.dta, replace

	use ddplacebo2.dta, clear

	gen treatavgper=treatavg*100
	gen controlavgper=controlavg*100


	collapse gdper treatavgper controlavgper  (semean) segdper=gdper if treat==1, by(year)
	sort year

	save parallelpl2.dta, replace

	use parallelpl1.dta
	append using parallelpl2.dta


	gen trpl=0 if controlavgper!=.
	replace trpl=1 if treatavgper!=.


	gen gdcilo=gdper-1.96 * segdper
	gen gdcihi=gdper+1.96 * segdper
	*label define yr 2012 "2012a" 2013 "2012b" 2015 "2015a" 2016 "2015b"
	*label values year yr
	*bysort evertr: gen id=5-_n



	bysort trpl (year): gen id4=_n


	label define nn 0 "Control" 1 "Treated"
	label values trpl nn



	saveold parallelplall,replace version(12)




