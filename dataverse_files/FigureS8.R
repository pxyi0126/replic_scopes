###############################
#Uncomment to install packages#
###############################


#install.packages("foreign")
#install.packages("ggplot2")
#install.packages("gridExtra")
#install.packages("ri")
#install.packages("lfe")
#install.packages("lmtest")
#install.packages("tidyr")
#install.packages("broom")


library(foreign)
library(ggplot2)
library(lfe)
library(plm)
library("lmtest")
library("tidyr")
library("broom")
library(gridExtra)
library(ri)

################################################################################################
#This code needs to be run in conjunction with FigureS8.do, which includes the lead code.      #
#Information about how the code needs to be run is provided in the FigureS8.do file.           #
################################################################################################


setwd("/path/to/replication/directory/")





################
#Municipalities#
################


##########################
#Part A.Rmuni begins here#
##########################

rm(list = ls())
dist <- read.dta("datamuni.dta")

cluster<-dist$muni
tr<-dist$evertr

perms <- genperms(tr,clustvar=cluster,maxiter = 2000) # all possible permutations
permut<-as.data.frame(perms)

write.dta(permut, "permsmuni.dta")

########################
#Part A.Rmuni ends here#
########################


##########################
#Part B.Rmuni starts here#
##########################

rm(list = ls())
dist2 <- read.dta("permut2.dta")

cluster<-dist2$muni
tr<-dist2$trperm

perms <- genperms(tr,clustvar=cluster,maxiter = 2000) # all possible permutations
permutcontrol<-as.data.frame(perms)

write.dta(permutcontrol, "perms2muni.dta")

########################
#Part B.Rmuni ends here#
########################



##########################
#Part C.Rmuni starts here#
##########################


rm(list = ls())
dat1 <- read.dta("riest1.dta")

permplot1<-ggplot(dat1, aes(x=estimate)) + geom_histogram(aes(y=..density..),binwidth=.15) + geom_density(alpha=.5)+    
  scale_x_continuous(name="Treatment Effect") + scale_y_continuous(name="Desnity") + 
  geom_vline(xintercept = 2.078, linetype = 2, color = "red") +
  theme(axis.title.x = element_text(size = 8), axis.title.y = element_text(size = 8), 
        axis.text.x = element_text(size = 8),axis.text.y = element_text(size = 8), 
        plot.title = element_text(face="bold", size=8,hjust = 0.5,vjust = -1),
        panel.background = element_rect(fill = "white", colour = "grey50"))  +
  ggtitle("Permutations: All Municipalities") + ggsave("permplot1.pdf", width = 22, height = 18, units = "cm")  
permplot1



dat2 <- read.dta("riest2.dta")

permplot2<-ggplot(dat2, aes(x=estimate)) + geom_histogram(aes(y=..density..),binwidth=.15) + geom_density(alpha=.5)+    
  scale_x_continuous(name="Treatment Effect") + scale_y_continuous(name="Desnity") + 
  geom_vline(xintercept = 2.078, linetype = 2, color = "red") +
  theme(axis.title.x = element_text(size = 8), axis.title.y = element_text(size = 8), 
        axis.text.x = element_text(size = 8),axis.text.y = element_text(size = 8),
        plot.title = element_text(face="bold", size=8,hjust = 0.5,vjust = -1),
        panel.background = element_rect(fill = "white", colour = "grey50"))  +
  ggtitle("Permutations: Control Municipalities") + ggsave("permplot1.pdf", width = 22, height = 18, units = "cm")  
permplot2


pdf("permutations.pdf")
grid.arrange(permplot1, permplot2,  ncol=2, nrow=2)
dev.off()



#########################
#Part C.Rmuni ends here##
#########################




################
#Township-level#
################




##########################
#Part A.Rtown starts here#
##########################








rm(list = ls())
dist2 <- read.dta("permuttown.dta")

cluster<-dist2$town
tr<-dist2$evertr

perms <- genperms(tr,clustvar=cluster,maxiter = 2000) # all possible permutations
permuttown<-as.data.frame(perms)

write.dta(permuttown, "permstown.dta")



######################
#Part A.R ends here###
######################



##########################
#Part B.Rtown starts here#
##########################



rm(list = ls())
dist3 <- read.dta("permut2town.dta")

cluster<-dist3$town
tr<-dist3$trperm

perms <- genperms(tr,clustvar=cluster,maxiter = 2000) # all possible permutations
permutcontrol<-as.data.frame(perms)

write.dta(permutcontrol, "perms2town.dta")




#########################
#Part B.Rtown ENDS here##
#########################



##########################
#Part C.Rtown starts here#
##########################



rm(list = ls())
dat1town <- read.dta("riest1town.dta")

permplot3<-ggplot(dat1town, aes(x=estimate)) + geom_histogram(aes(y=..density..),binwidth=.15) + geom_density(alpha=.5)+    
  scale_x_continuous(name="Treatment Effect") + scale_y_continuous(name="Desnity") + 
  geom_vline(xintercept = 2.272, linetype = 2, color = "red") +
  theme(axis.title.x = element_text(size = 8), axis.title.y = element_text(size = 8), 
        axis.text.x = element_text(size = 8),axis.text.y = element_text(size = 8), 
        plot.title = element_text(face="bold", size=8,hjust = 0.5,vjust = -1),
        panel.background = element_rect(fill = "white", colour = "grey50"))   +
  ggtitle("Permutations: All Townships") + ggsave("permplot3.pdf", width = 22, height = 18, units = "cm")  
permplot3



dat2town <- read.dta("riest2town.dta")

permplot4<-ggplot(dat2town, aes(x=estimate)) + geom_histogram(aes(y=..density..),binwidth=.15) + geom_density(alpha=.5)+    
  scale_x_continuous(name="Treatment Effect") + scale_y_continuous(name="Desnity") + 
  geom_vline(xintercept = 2.272, linetype = 2, color = "red") +
  theme(axis.title.x = element_text(size = 8), axis.title.y = element_text(size = 8), 
        axis.text.x = element_text(size = 8),axis.text.y = element_text(size = 8), 
        plot.title = element_text(face="bold", size=8,hjust = 0.5,vjust = -1),
        panel.background = element_rect(fill = "white", colour = "grey50"))  +
  ggtitle("Permutations: Control Townships") + ggsave("permplot4.pdf", width = 22, height = 18, units = "cm")  
permplot4


#########################
#Part C.Rtown ends here##
#########################



pdf("permutationsTown.pdf")
grid.arrange(permplot3, permplot4,  ncol=2, nrow=2)
dev.off()

