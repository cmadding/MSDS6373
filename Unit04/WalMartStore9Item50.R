#Walmart Analysis

library(tidyverse) # needs to be run every time you start R and want to use %>%
library(tswge)


Walmart = read.csv("Data/Walmart.csv",header = TRUE)

Store9Item50 = Walmart %>% dplyr::filter(store == 9 & item == 50)
plotts.wge(Store9Item50$sales)
parzen.wge(na.omit(Store9Item50$sales))
parzen.wge(na.omit(Store9Item50$sales), trunc = 500)

Store9Item50_MA_5 = stats::filter(Store9Item50$sales,rep(1,5)/5)
Store9Item50_MA_51 = stats::filter(Store9Item50$sales,rep(1,51)/51)
plotts.sample.wge(na.omit(Store9Item50_MA_5))
plotts.sample.wge(na.omit(Store9Item50_MA_51))

Store9Item50_Diff_1 = diff(Store9Item50$sales,lag = 1)
plotts.sample.wge(na.omit(Store9Item50_Diff_1))
parzen.wge(na.omit(Store9Item50_Diff_1), trunc = 500)

#Walmart Butterworth

BWPass = butterworth.wge(Store9Item50$sales,order = 10,type = "pass",cutoff = c(.1,.2))
plotts.wge(BWPass$x.filt)
parzen.wge(BWPass$x.filt,trunc = 70)

BWLow = butterworth.wge(Store9Item50$sales,order = 10,type = "low",cutoff = c(.01))
plotts.wge(BWLow$x.filt)
parzen.wge(BWLow$x.filt,trunc = 70)
parzen.wge(BWLow$x.filt,trunc = 300)
