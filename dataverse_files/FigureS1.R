###############################
#Uncomment to install packages#
###############################


#install.packages("foreign")
#install.packages("ggplot2")
#install.packages("gridExtra")

library(foreign)
library(ggplot2)
library(gridExtra)



setwd("/path/to/replication/directory/")

#############
#Figure S.1##
#############

rm(list = ls())


data1 <- read.dta("notopcoding.dta")
data2 <- read.dta("datamuni.dta")

agatho <- data1[data1$year==2016 & data1$trarrprop>0 ,] 
noagatho <- data2[data2$year==2016 & data2$trarrprop>0,] 


aga<-ggplot(agatho, aes(x = trarrprop)) +
  geom_histogram(color = "white", binwidth = 1.40)  +
  xlab("Refugeee Arrivals (per capita)") + ggtitle("No Top-Coding") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) 
aga

noaga<-ggplot(noagatho, aes(x = trarrprop)) +
  geom_histogram(color = "white", binwidth = 0.60)  +
  xlab("Refugeee Arrivals (per capita)") + ggtitle("Top-Coding") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) 
noaga

pdf("topcoding.pdf")
grid.arrange(aga, noaga, ncol=2, nrow=2)
dev.off()
