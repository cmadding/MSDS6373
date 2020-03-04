#9_12 Model Identification Box-Jenkins

library(tswge)
library(readr)

data("LakeHuron")
Unit9_2 <- read.csv("Unit9_2.csv", header = T)
Unit9_1 <- read.csv("Unit9_1.csv", header = T)

#Convert
Unit9_2 = ts(Unit9_2$x)
Unit9_1 = ts(Unit9_1$x)

plotts.sample.wge(Unit9_1)


#9.12.2
#Sample Partial Autocorrelations
pacf=pacf(Unit9_2)
#Sample Autocorrelations
acf(Unit9_1)

#9.12.3
aic5.wge(Unit9_1,p=0:10,q=0:3,type="aic")
aic5.wge(Unit9_1,p=0:10,q=0:3,type="bic")

aic5.wge(LakeHuron,p=0:10,q=0:3,type="aic")
aic5.wge(LakeHuron,p=0:10,q=0:3,type="bic")

#The actual model was an ARMA(3,1).
#Although we don't usually know the actual model in practice,
#we can in this setting because it was generated.

LakeH_est=est.arma.wge(LakeHuron,p=1,q=1)
est=est.arma.wge(Unit9_1,p=5,q=3)
#p = 1.2511 -1.2682 0.5231 -0.3188 0.2602

factor.wge(est$theta)
#q = 1.5396 -1.5071 0.4804

#9.12.4
inflation = read.csv("inflation.csv",header = TRUE)
pacf(inflation$Inflation)
