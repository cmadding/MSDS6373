#Walmart Analysis

library(tidyverse) # needs to be run every time you start R and want to use %>%
library(tswge)

#Use Aic5 to assess the use of ARMA models for your time series.
#Add this to the Google doc.
aic5.wge(nottem)


#Find the lowest AIC in the Walmart data
Walmart = read.csv("Data/Walmart.csv",header = TRUE)

Store9Item50 = Walmart %>% dplyr::filter(store == 9 & item == 50)
plotts.wge(Store9Item50$sales)
plotts.sample.wge(Store9Item50$sales)
parzen.wge(na.omit(Store9Item50$sales))
parzen.wge(na.omit(Store9Item50$sales), trunc = 500)

aic5.wge(Store9Item50$sales)

#Find p1 for the following model by hand.
#MA(2) Model
#Xt = at-.8at-1 + .5at-2.
(-.8+.8*-.5)/(1+.8^2+((-.5)^2))
#[1] -0.6349206
p1=plotts.true.wge(theta=c(.8,-.5))
#p1 in r using tswge
p1$aut1[1:5]
#[1]  1.0000000 -0.6349206  0.2645503  0.0000000  0.0000000
p1$aut1[2]
#[1] -0.6349206

#Generate a realizations from an ARMA model.
#You pick p and q.
#Include the ACF and spectral density.
#ARMA(4,3)
plotts.true.wge(250, phi = c(.3,.9,.1,-.8075), theta = c(-.9, -.8,-.72))


#Use AIC5 to identify the top five quality models with respect to AIC for the
#cancelled flight data from the SWADelay.csv data set (column: arr_cancelled).
#Comment on which are AR, MA, and ARMA.
# Read in the data
SWA = read.csv("Data/swadelay.csv",header = TRUE)
plotts.wge(SWA$arr_cancelled)
plotts.sample.wge(SWA$arr_cancelled)
aic5.wge(SWA$arr_cancelled)

