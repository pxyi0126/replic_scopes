Included file:


## Data files
AllTown2012a.dta  ** election results per polling station for the May 2012 election
AllTown2012b.dta  ** election results per polling station for the June 2012 election AllTown2015b.dta  ** election results per polling station for the January 2015 election AllTown2015a.dta  ** election results per polling station for the September 2015 election M.dta             ** demographic indicators 
eterodimotes.dta  ** election results per polling station for non-resident island voters   
eterodimotes3.dta ** election results per polling station for non-island voters  
fig1.dta          ** refugee arrival data

## Data recodePreprocessingMuni.do  ** generates new datasets with variables needed for the municipal-level analysis
PreprocessingTown.do  ** generates new datasets with variables needed for the township-level analysis

## Analysis


#R packages needed for the analysis are indicated in the scripts. A stata ado file is also needed: "lincomest.ado"

--Stata dofilesFigure2.do
Table1.do
TablesS1andS2TablesS3andS4TablesS6andS7
Estimates.FiguresS5andS6
TableS8
FigureS7TableS9TableS10FigureS8Estimates.Figure4
--R filesFigure1b.RFigure2.RFigure3.RFigure4.RFigureS1.RFigureS3.RFigureS4.RFiguresS5andS6.RFigureS7.RFigureS8.RTo replicate results (except from the maps): 
1. Run PreprocessingMuni.do and PreprocessingTown.do
	--This will compute recodes and construct the two main datasets needed for most analyses. The files 
	include code that prepares the two datasets used for the placebo analysis. 

2. For each piece of analysis run the corresponding code. For example, to replicate Table 1, run dofile Table1.do. 
	--All graphs have been made in R. Thus, to replicate a graph you first run the PreprocessingMuni/Town.do. 
	--Then, you run the analysis in stata, if needed, using the corresponding dofile. 
	--Finally, run the code in R to generate the graph.

3. For Figures S5 and S6, things are slightly different, in that replication needs the following steps:
	--Start by running PreprocessingMuni.do. 
	--Then, run Estimates.FiguresS5andS6.do.
	--Then, run FiguresS5andS6.R.

4. For Figure S8, things are more complicated. More detailed instructions are shown in FigureS8.do. The main difference is that now we use R not only for the graph but also for the permutations:
	-- Open both FigureS8.do and FigureS8.R
	--Start by running the first part (A) of FigureS8.R
	--Follow the instructions shown in this do file:
		--Run the corresponding part for R.
		--Go back and forth between the stata and R files, as instructed in FigureS8.do.


To replicate the maps:
**All maps were implemented by the interface module of QGIS, hence no code has been used. We provide the shapefiles for the graphs:
1. Figure 1A
--lemnos
--lesvos
--oria_dhmwn_kallikraths.shp
--NUTS_RG_10M_2006.shp


2. Figure S2
--treatment.shp
--NUTS_RG_10M_2006.shp


