###############################
#Uncomment to install packages#
###############################


#install.packages("foreign")
#install.packages("ggplot2")
#install.packages("gridExtra")

library(foreign)
library(ggplot2)
library(gridExtra)


##########
#Figure 4#
##########

setwd("/path/to/replication/directory/")

rm(list = ls())

first <- read.dta("datamuni.dta")
red<-first[first$year==2016,]



first7=ggplot(red, aes(x = logdist, y = gdperdif)) + 
  geom_point(shape = 1)  + ylim(-5,5) + xlim(0.2,6.3)
first8=first7 + stat_smooth(method = "lm") +
  xlab("Logged Distance  in Klm.") +
  ylab("Change in GD vote: Jan-Sep 2015")  + theme(legend.position="none") +
  ggtitle("Reduced Form") + theme(plot.title = element_text(face="bold", size=8))+
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) 
first8
ggsave("reduced1.pdf", width = 22, height = 18, units = "cm")  


first9=ggplot(red, aes(x = logdist, y = gdperdif3)) + 
  geom_point(shape = 1)  + ylim(-13,7) + xlim(0.2,6.3)
first10=first9 + stat_smooth(method = "lm") +  
  xlab("Logged Distance  in Klm.") +
  ylab("Change in GD vote: May 2012-Jan 2015")  + 
  ggtitle("Placebo") + theme(plot.title = element_text(face="bold", size=8)) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) 
first10
ggsave("reduced2.pdf", width = 22, height = 18, units = "cm")  


pdf("reduced.pdf")
grid.arrange(first8, first10, ncol=2, nrow=2)
dev.off()

