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

##########
#Figure 2#
##########

#############################################################################################
#datasets needed: parallelmuni.dta & paralleltown.dta, both constucted using Figure2.do file#
#############################################################################################


##########
#Figure 5#
##########

rm(list = ls())

parallel <- read.dta("parallelmuni.dta")
cbPalette <- c("blue","red")
trmuni<-factor(parallel$evertr, exclude = NA)
partrends1=ggplot(parallel, aes(x = id, y = gdper, colour=trmuni)) +  
  geom_line(aes(linetype = trmuni,color=trmuni),position=position_dodge(0.125)) + 
  geom_point(position=position_dodge(0.125)) +
  scale_y_continuous(limits=c(1,11))  + 
  ylab("Golden Dawn vote share (in %)") +
  scale_color_manual(name="Municipalities",values=cbPalette,labels=c("Control", "Treated"),guide="none") +
  scale_linetype_manual(name="Municipalities", values=c(1,2),guide="none")+
  scale_x_continuous(name=" ",breaks = c(1,2,3,4), labels = c("2012 May", "2012 June", "2015 Jan.", "2015 Sep.   ")) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) +
  geom_errorbar(aes(ymin=gdcilo,ymax=gdcihi),width=0.2, position=position_dodge(0.125)) +  
  labs(fill = "") +
  ggtitle("Muncipalities")+
  #theme(legend.justification = c(.01, .01), legend.position = c(.01, .01))
  annotate("text", x = 3.74, y = 8.4, label = "Treated", size=3) +
  annotate("text", x = 3.88, y = 5, label = "Control", size=3) 

partrends1

ggsave("Parallelmunici.pdf", width = 16, height = 14, units = "cm")  



parallel <- read.dta("paralleltown.dta")

trtown<-factor(parallel$evertr, exclude = NA)

partrends2=ggplot(parallel, aes(x = id, y = gdper, colour=trtown)) +  
  geom_line(aes(group = trtown,linetype=trtown),position=position_dodge(0.125)) + 
  geom_point(position=position_dodge(0.125)) +
  scale_y_continuous(limits=c(1,11))  + 
  ylab("Golden Dawn vote share (in %)") +
  scale_color_manual(name="Townships",values=c("blue", "red"),labels=c("Control", "Treated"),guide="none") +
  scale_linetype_manual(name="Municipalities", values=c(1,2),guide="none")+
  scale_x_continuous(name=" ",breaks = c(1,2,3,4), labels = c("2012 May", "2012 June", "2015 Jan.", "2015 Sep.   ")) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 10), axis.title.y = element_text(size = 10), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=10, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) +
  geom_errorbar(aes(ymin=gdcilo,ymax=gdcihi,group = trtown),width=0.2, position=position_dodge(0.125)) +  
  labs(fill = "") +
  ggtitle("Townships")+
  annotate("text", x = 3.74, y = 8.6, label = "Treated", size=3) +
  annotate("text", x = 3.88, y = 5.3, label = "Control", size=3) 



# theme_bw() +
#theme(legend.justification = c(.01, .01), legend.position = c(.01, .01))

partrends2

ggsave("Paralleltownci.pdf", width = 22, height = 18, units = "cm")  

pdf("ParallelBothci2.pdf")
grid.arrange(partrends1, partrends2, ncol=2, nrow=2)
dev.off()
