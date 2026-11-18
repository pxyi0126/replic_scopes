cd "/path/to/replication/directory/"

use datamuni,clear

sort muni
merge m:1 muni using M



foreach var of varlist area pop11  dense unempl11 forg11 tour14 gdp14 {
reg `var' logdist if year==2016,robust
}
