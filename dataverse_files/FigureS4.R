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

############
#Figure S.4#
############



rm(list = ls())

itt <- read.dta("itt.dta")
itt$group<-as.factor(itt$id3)

ittsi<-ggplot(itt, aes(x=estimate, y = id2)) +
  geom_errorbarh(aes(xmax = max95, xmin = min95), height=.1) +
  geom_point(aes(color=group),size=2.5) +
  scale_color_manual(values=c("red","blue"),guide="none") +
  scale_x_continuous(limits = c(-2, 2))+
  geom_vline(xintercept = 0, 
             linetype = 2, color = "black")+ xlab("Treatment Effect") + ylab("") + 
  scale_y_continuous(breaks = c(1,2,3,4), labels = c("2012 May", "2012 June", "2015 January", "2015 September")) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 14), axis.title.y = element_text(size = 14), 
        axis.text.x = element_text(size =12),axis.text.y = element_text(size = 12),
        legend.title = element_text(size =9), legend.text = element_text(size = 9) , 
        plot.title = element_text(face="bold", size=14, hjust = 0.5),
        axis.text=element_text(size=10,color="black")) +  ggtitle("Intent-To-Treat Effect")
ittsi
ggsave("ittsi1.pdf", width = 22, height = 18, units = "cm")  
