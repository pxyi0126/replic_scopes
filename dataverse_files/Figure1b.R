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


rm(list = ls())




###########
#Figure 1b#
###########




# MONTHLY ARRIVALS GREECE

d <- read.dta("fig1.dta")


sp <- ggplot(d, aes(x=monthID, y=number)) 
sp + geom_area(fill="darkblue", alpha=.2) +
  geom_line()  + 
  labs(title = "Monthly Arrivals of Asylum-Seekers in Greece") +
  ylab("Monthly Arrivals") +
  scale_x_continuous(name="Month / Year",breaks = c(1,9,15,21,27), labels = c("01/14", "07/14", "01/15", "7/15", "01/16")) +
  xlab("")+
  geom_vline(xintercept = 13.83, linetype = "dashed",colour="red") +
  geom_vline(xintercept = 21.67, linetype = "dashed",colour="red") +
  annotate("text", x = 13.78, y = 100000, label = "25 Jan 2015\n Election", size=5) +
  annotate("text", x = 21.55, y = 100000, label = "20 Sep 2015\n Election", size=5) +
  theme(panel.background = element_rect(fill = "white", colour = "grey50"), 
        axis.title.x = element_text(size = 12), axis.title.y = element_text(size = 12), 
        axis.text.x = element_text(size = 10),axis.text.y = element_text(size = 10),
        legend.title = element_text(size =9), legend.text = element_text(size = 7) , 
        plot.title = element_text(face="bold", size=14, hjust = 0.5),
        axis.text=element_text(size=10,color="black"),
        axis.title=element_text(size=12,color="black")) 
ggsave("MonthlyArrivals_GreeceRD.pdf", width = 24, height = 14, units = "cm")