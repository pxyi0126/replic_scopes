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
#Figure S.5#
############




rm(list = ls())



parallelpl1 <- read.dta("partrends1.dta")
cbPalette <- c("red","blue")
trpl<-factor(parallelpl1$trpl, exclude = NA)
partrends1pl=ggplot(parallelpl1, aes(x = id4, y = gdper, colour=trpl)) +  
  geom_line(aes(linetype = trpl,colour = trpl),position=position_dodge(0.125)) + 
  geom_point(position=position_dodge(0.125)) +
  scale_y_continuous(limits=c(0,10)) + 
  ylab("Golden Dawn vote share (in %)") +
  scale_color_manual(name="Municipalities",values=cbPalette,labels=c("Control", "Treated"),guide="none") +
  scale_linetype_manual(name="Municipalities", values=c(2,1),guide="none")+
  scale_x_continuous(name=" ",breaks = c(1,2,3,4), labels = c("2012 May", "2012 June", "2015 Jan.", "2015 Sep.   ")) +
  geom_errorbar(aes(ymin=gdcilo,ymax=gdcihi),width=0.2, position=position_dodge(0.125)) +  
  labs(fill = "") +
  # theme_bw() +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size =9),axis.text.y = element_text(size = 9),
        legend.title = element_text(size =9), legend.text = element_text(size = 9) , 
        plot.title = element_text(face="bold", size=9, hjust = 0.5),
        axis.text=element_text(size=8,color="black"),
        axis.title=element_text(size=10,color="black")) + 
  ggtitle("Parallel Trends 2:\nNon-Resident Treated Vs Resident Control") +
  annotate("text", x = 3.74, y = 6.8, label = "Control", size=3) +
  annotate("text", x = 3.88, y = 2.9, label = "Treated", size=3) 
partrends1pl




parallelpl2 <- read.dta("parallelplall.dta")
cbPalette <- c("red","blue")
trpl<-factor(parallelpl2$trpl, exclude = NA)

partrends2pl=ggplot(parallelpl2, aes(x = id4, y = gdper, colour=trpl)) +  
  geom_line(aes(linetype = trpl,colour = trpl),position=position_dodge(0.125)) + 
  geom_point(position=position_dodge(0.125)) +
  scale_y_continuous(limits=c(0,10)) + 
  ylab("Golden Dawn vote share (in %)") +
  scale_color_manual(name="Municipalities",values=cbPalette,labels=c("Control", "Treated"),guide="none") +
  scale_linetype_manual(name="Municipalities", values=c(2,1),guide="none")+
  scale_x_continuous(name=" ",breaks = c(1,2,3,4), labels = c("2012 May", "2012 June", "2015 Jan.", "2015 Sep.   ")) +
  geom_errorbar(aes(ymin=gdcilo,ymax=gdcihi),width=0.2, position=position_dodge(0.125)) +  
  labs(fill = "") + 
  # theme_bw() +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size =9),axis.text.y = element_text(size = 9),
        legend.title = element_text(size =9), legend.text = element_text(size = 9) , 
        plot.title = element_text(face="bold", size=9, hjust = 0.5),
        axis.text=element_text(size=8,color="black"),
        axis.title=element_text(size=10,color="black")) + 
  ggtitle("Parallel Trends 1:\nNon-Resident Treated Vs Non-Resident Control") +
  annotate("text", x = 3.74, y = 6.6, label = "Control", size=3) +
  annotate("text", x = 3.88, y = 2.9, label = "Treated", size=3) 
partrends2pl

pdf("prtrendseter.pdf")
grid.arrange(partrends2pl,partrends1pl, ncol=2, nrow=2)
dev.off()




############
#Figures S6#
############


treff <- read.dta("tret.dta")


resultseter1<-ggplot(treff, aes(x=estimate, y = id3)) +
  geom_point(size = 2) +
  geom_errorbarh(aes(xmax = max95, xmin = min95), height=.1) +
  scale_x_continuous(limits = c(-4, 4))+
  geom_vline(xintercept = 0, 
             linetype = 2, color = "black")+ xlab("Treatment Effect") + ylab("") + 
  scale_y_continuous(breaks = c(1,2), limits = c(0.5, 2.5), labels = c("s-trends","Treatment")) +
  ggtitle("Placebo 2:\nNon-Resident Treated Voters Vs Resident Control") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 9),axis.text.y = element_text(size = 9),
        legend.title = element_text(size =9), legend.text = element_text(size = 9) , 
        plot.title = element_text(face="bold", size=8, hjust = 0.5),
        axis.text=element_text(size=8,color="black"),
        axis.title=element_text(size=10,color="black"))
resultseter1
ggsave("resultseter1.pdf", width = 22, height = 18, units = "cm")  



treff2 <- read.dta("tret2.dta")


resultseter2<-ggplot(treff2, aes(x=estimate, y = id3)) +
  geom_point(size = 2) +
  geom_errorbarh(aes(xmax = max95, xmin = min95), height=.1) +
  scale_x_continuous(limits = c(-4, 4))+
  geom_vline(xintercept = 0, 
             linetype = 2, color = "black")+ xlab("Treatment Effect") + ylab("") + 
  scale_y_continuous(breaks = c(1,2),limits = c(0.5, 2.5), labels = c( "s-trends","Treatment")) +
  ggtitle("Placebo 1:\nNon-Resident Treated Vs Non-Resident Control") +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 9),axis.text.y = element_text(size = 9),
        legend.title = element_text(size =9), legend.text = element_text(size = 9) , 
        plot.title = element_text(face="bold", size=8, hjust = 0.5),
        axis.text=element_text(size=8,color="black"),
        axis.title=element_text(size=10,color="black"))
resultseter2
ggsave("resultseter.pdf", width = 22, height = 18, units = "cm")  


pdf("treteral.pdf")
grid.arrange(resultseter2, resultseter1,  ncol=2, nrow=2)
dev.off()


