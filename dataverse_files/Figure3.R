###############################
#Uncomment to install packages#
###############################


#install.packages("foreign")
#install.packages("ggplot2")
#install.packages("gridExtra")

##########
#Figure 3#
##########


library(foreign)
library(ggplot2)
library(gridExtra)

setwd("/path/to/replication/directory/")




rm(list = ls())



first <- read.dta("datamuni.dta")
firstred<-first[first$year==2016,]



first1=ggplot(firstred, aes(x = distance, y = treatment)) + 
  geom_point(shape=1)  + ylim(-.3,1.2) + xlim(0,550) 
first2=first1 + stat_smooth(method = "loess",span=.5,color="blue", fill="royalblue1") + 
  stat_smooth(method="lm",formula=y~log(x),color="red",fill="orangered1") +
  xlab("Distance to Turkish coast (in Klm.)") +
  ylab("Probability of Receiving Refugees")  + 
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) +
  ggtitle("Binary Treatment") + theme(plot.title = element_text(face="bold"))
first2
ggsave("firststagebinary.pdf", width = 22, height = 18, units = "cm")  



first3=ggplot(firstred, aes(x = distance, y = trarrprop)) + 
  geom_point(shape=1)  + ylim(-1,5.5) + xlim(0,550) 
first4=first3 + stat_smooth(method = "loess",span=.5,color="blue", fill="royalblue1") + 
  stat_smooth(method="lm",formula=y~log(x),color="red",fill="orangered1") +
  xlab("Distance to Turkish coast (in Klm.)") +
  ylab("Number of per capita arrivals")  + 
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) +
  ggtitle("Continuous Treatment") + theme(plot.title = element_text(face="bold"))
first4
ggsave("firststagecont.pdf", width = 22, height = 18, units = "cm")  

pdf("fsboth.pdf")
grid.arrange(first2,first4,ncol=2, nrow=2)
dev.off()