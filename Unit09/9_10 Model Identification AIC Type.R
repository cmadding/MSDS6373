#9_10 Model Identification AIC Type
library(tswge)

x31=gen.arma.wge(n=75,phi=c(2.3,-1.92,.56),theta=-.8,sn=61)
x31=x31+30
plotts.sample.wge(x31)

#Using aic5
aic5.wge(x31,p=0:8,q=0:2)
est.arma.wge(x31,p=6,q=1)
# picks (6,1)   try BIC
aic5.wge(x31,p=0:8,q=0:2,type="bic")
#  BIC picks (3,1) decide to use it
#  showing est.arma.wge results for ARMA(3,1)
est.arma.wge(x31,p=3,q=1)
mean(x31)
#  mean is 25.74

#Con check
# Read in the data
inflation = read.csv("inflation.csv",header = TRUE)

aic5.wge(inflation$Inflation,p=0:8,q=0:2,type="aic")
aic5.wge(inflation$Inflation,p=0:8,q=0:2,type="bic")
