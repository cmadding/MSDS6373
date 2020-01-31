#install.packages("xts")

library(tidyverse)
library(tswge)
library(dygraphs)
library(xts)

# Read in the data
jetA = read.csv("Data/TexasJetFuel.csv",header = TRUE)

jetAPrice = rev(jetA$Price)
plotts.wge(jetAPrice)
aic5.wge(jetAPrice)
parzen.wge(jetAPrice)

#Fancey Graph DYGRAPH
#jetA$Month2 = as.Date(paste(as.character(jetA$Month),"-01",sep = ""),"%b-%y-%d") #it's tricky getting the Date conveted.
#xss = xts(jetA$Price,jetA$Month2)
#dygraph(xss) %>% dyRangeSelector(height = 100)


plotts.wge(jetA$Price)

#This is an AR(1) model
aic.wge(jetA$Price, p = 1, q = 0)$value
#The aic is -4.012713

#This is an AR(2) model
aic.wge(jetA$Price, p = 2, q = 0)$value
#The aic is -4.144347

#This is an ARMA(1,1) model
aic.wge(jetA$Price, p = 1, q = 1)$value
#The aic is -4.195998

#Gives the Five Smallest Values of  aic
aic5.wge(jetA$Price)
