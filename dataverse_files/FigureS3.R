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
#Figure S.2#
############

rm(list = ls())



treff <- read.dta("treffresults.dta")
trefftown <- read.dta("treffresultstown.dta")

treff1 <- treff[treff$id2==1,] 
treff2 <- treff[treff$id2==2,] 


treff1$group1<-as.factor(treff1$id3)
treff2$group2<-as.factor(treff2$id3)
trefftown$group1<-as.factor(trefftown$id3)
  
resultsdd1<-ggplot(treff1, aes(x=estimate, y = id1)) +
  geom_errorbarh(aes(xmax = max95, xmin = min95), height=.3) +
  geom_point(aes(color=group1),size=2.5) +
  scale_color_manual(values=c("red","blue"),guide="none") +
  scale_x_continuous(limits = c(-4, 4))+
  geom_vline(xintercept = 0, 
             linetype = 2, color = "black")+ xlab("Treatment Effect") + ylab("") + 
  scale_y_continuous(breaks = c(5,6,7,8), labels = c("Placebo & s-trends", "Placebo", "Treatment & s-trends", "Treatment")) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) +
  ggtitle("Binary Treatment")
resultsdd1
ggsave("resultsdd1.pdf", width = 22, height = 18, units = "cm")  




resultsdd2<-ggplot(treff2, aes(x=estimate, y = id1)) +
  geom_errorbarh(aes(xmax = max95, xmin = min95), height=.3) +
  geom_point(aes(color=group2),size=2.5) +
  scale_color_manual(values=c("red","blue"),guide="none") +
  scale_x_continuous(limits = c(-2, 2))+
  geom_vline(xintercept = 0, 
             linetype = 2, color = "black")+ xlab("Treatment Effect") + ylab("") + 
  scale_y_continuous(breaks = c(1,2,3,4), labels = c("Placebo & s-trends", "Placebo", "Treatment & s-trends", "Treatment")) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) +
  ggtitle("Raw Arrivals")
resultsdd2
ggsave("resultsdd2.pdf", width = 22, height = 18, units = "cm")  




resultsdd3<-ggplot(trefftown, aes(x=estimate, y = id1)) +
  geom_errorbarh(aes(xmax = max95, xmin = min95), height=.3) +
  geom_point(aes(color=group1),size=2.5) +
  scale_color_manual(values=c("red","blue"),guide="none") +
  scale_x_continuous(limits = c(-4, 4))+
  geom_vline(xintercept = 0, 
             linetype = 2, color = "black")+ xlab("Treatment Effect") + ylab("") + 
  scale_y_continuous(breaks = c(1,2,3,4), labels = c("Placebo & s-trends", "Placebo", "Treatment & s-trends", "Treatment")) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) +
  ggtitle("Binary Treatment, Town")
resultsdd3
ggsave("resultsdd3.pdf", width = 22, height = 18, units = "cm")  


resultsdd1<-ggplot(treff1, aes(x=estimate, y = id1)) +
  geom_errorbarh(aes(xmax = max95, xmin = min95), height=.09) +
  geom_point(aes(color=group1),size=2.5) +
  scale_color_manual(values=c("red","blue"),guide="none") +
  scale_x_continuous(limits = c(-4, 4))+
  geom_vline(xintercept = 0, 
             linetype = 2, color = "black")+ xlab("Treatment Effect") + ylab("") + 
  scale_y_continuous(breaks = c(5,6,7,8), labels = c(expression(atop(Model~'4',
                                                                     "("*GD[`t-1`]*")"~'&'~s-trends)),expression(atop(Model~'3',
                                                                                                                      "("*GD[`t-1`]*")")),expression(atop(Model~'2',
                                                                                                                                                          "("*GD[`t`]*")"~'&'~s-trends)),expression(atop(Model~'1',"("*GD[`t`]*")")))) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 7), axis.title.y = element_text(size = 7), 
        axis.text.x = element_text(size = 5),axis.text.y = element_text(size = 5),
        legend.title = element_text(size =5), legend.text = element_text(size = 5) , 
        plot.title = element_text(face="bold", size=7, hjust = 0.5),
        axis.text=element_text(size=5,color="black"),
        axis.title=element_text(size=7,color="black")) +
  ggtitle("Binary Treatment \n (Municipalities)")
resultsdd1
ggsave("resultsdd1.pdf", width = 22, height = 18, units = "cm")  



resultsdd2<-ggplot(treff2, aes(x=estimate, y = id1)) +
  geom_errorbarh(aes(xmax = max95, xmin = min95), height=.09) +
  geom_point(aes(color=group2),size=2.5) +
  scale_color_manual(values=c("red","blue"),guide="none") +
  scale_x_continuous(limits = c(-2, 2))+
  geom_vline(xintercept = 0, 
             linetype = 2, color = "black")+ xlab("Treatment Effect") + ylab("") + 
  scale_y_continuous(breaks = c(1,2,3,4), labels = c(expression(atop(Model~'12',
                                                                     "("*GD[`t-1`]*")"~'&'~s-trends)),expression(atop(Model~'11',
                                                                                                                      "("*GD[`t-1`]*")")),expression(atop(Model~'10',
                                                                                                                                                          "("*GD[`t`]*")"~'&'~s-trends)),expression(atop(Model~'9',"("*GD[`t`]*")")))) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 7), axis.title.y = element_text(size = 7), 
        axis.text.x = element_text(size = 5),axis.text.y = element_text(size = 5),
        legend.title = element_text(size =5), legend.text = element_text(size = 5) , 
        plot.title = element_text(face="bold", size=7, hjust = 0.5),
        axis.text=element_text(size=5,color="black"),
        axis.title=element_text(size=7,color="black")) +
  ggtitle("Number of Arrivals \n (per capita)")
resultsdd2
ggsave("resultsdd2.pdf", width = 22, height = 18, units = "cm")  


resultsddtown<-ggplot(trefftown, aes(x=estimate, y = id1)) +
  geom_errorbarh(aes(xmax = max95, xmin = min95), height=.09) +
  geom_point(aes(color=group1),size=2.5) +
  scale_color_manual(values=c("red","blue"),guide="none") +
  scale_x_continuous(limits = c(-4, 4))+
  geom_vline(xintercept = 0, 
             linetype = 2, color = "black")+ xlab("Treatment Effect") + ylab("") +   
  scale_y_continuous(breaks = c(1,2,3,4), labels = c(expression(atop(Model~'8',
                                                                     "("*GD[`t-1`]*")"~'&'~s-trends)),expression(atop(Model~'7',
                                                                                                                      "("*GD[`t-1`]*")")),expression(atop(Model~'6',
                                                                                                                                                          "("*GD[`t`]*")"~'&'~s-trends)),expression(atop(Model~'5',"("*GD[`t`]*")")))) +
  
  
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 7), axis.title.y = element_text(size = 7), 
        axis.text.x = element_text(size = 5),axis.text.y = element_text(size = 5),
        legend.title = element_text(size =5), legend.text = element_text(size = 5) , 
        plot.title = element_text(face="bold", size=7, hjust = 0.5),
        axis.text=element_text(size=5,color="black"),
        axis.title=element_text(size=7,color="black")) +  ggtitle("Binary Treatment \n (Townships)")
resultsddtown
ggsave("resultsddtown.pdf", width = 22, height = 18, units = "cm")  


pdf("MainResults.pdf")
grid.arrange(resultsdd1, resultsddtown,resultsdd2, ncol=3, nrow=2)
dev.off()

pdf("MainResults2.pdf")
grid.arrange(resultsdd1, resultsddtown,resultsdd2, ncol=3, nrow=1)
dev.off()