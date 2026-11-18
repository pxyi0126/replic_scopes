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
#Figure S.7#
############



rm(list = ls())
dist <- read.dta("distall.dta")


p1<-ggplot(dist, aes(x=distance, y = estimate,color=group)) + 
  geom_point(size = 2,position=position_dodge(24)) +
  scale_color_manual(name="Estimation\nMethod",labels=c("DD Estimates", "DD with s-trends\nEstimates", "IV Estimates"),values=c("red","blue","brown")) + 
  geom_errorbar(aes(ymax = max95, ymin = min95),width=.3, position=position_dodge(width=24)) +
  scale_x_continuous(name="Maximum Distance from Turkish Coast in Klm.",limits = c(40, 520), breaks = c(50,100,150,200,250,300,350,400,450,500,550,600)) +
  scale_y_continuous(limits = c(-3.5, 12.8), "Treatment Effect")+ ggtitle("Varying Distance to Turkish Coast") +
  geom_hline(yintercept = 0, 
             linetype = 2, color = "black") + guides(fill=guide_legend(reverse=TRUE), 
                                                     colour=guide_legend(reverse=TRUE)) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), legend.justification = c(.01, .01), legend.position = c(0.8, 0.8),
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),legend.title = element_text(size =10), legend.text = element_text(size = 8) , plot.title = element_text(face="bold", size=10,hjust = 0.5)) 
ggsave("DistanceRobustness.pdf", width = 22, height = 18, units = "cm")
p1

