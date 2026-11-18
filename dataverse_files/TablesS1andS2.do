cd "/path/to/replication/directory/"
set more off


use datamuni.dta, clear
sum registered valid treatment trarrprop logdist gdper ndper pasokper kkeper syrizaper anelper turnper  if year==2016 & muni!=.

sum registered valid treatment trarrprop logdist gdper ndper pasokper kkeper syrizaper anelper turnper  if year==2015 & muni!=.



use datatown.dta, clear
sum registered valid towntr gdper ndper pasokper kkeper syrizaper anelper turnper  if year==2016 & town!=.
sum registered valid towntr gdper ndper pasokper kkeper syrizaper anelper turnper  if year==2015 & town!=.
