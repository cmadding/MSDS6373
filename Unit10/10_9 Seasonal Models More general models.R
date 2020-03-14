#10_9 Seasonal Models more general models
#install.packages("tswge")

library(tswge)

#Model:
# (1-b)

#Generate Seasonal data
x=gen.aruma.wge(n=200,s=12,phi=c(1.5,-.8),sn=87)
#Add the mean of 50 to the data
x=x+50

plotts.sample.wge(x,lag.max=60)
d15=est.ar.wge(x,p=15, type='burg')



aic5.wge()

swadelay <- read.csv("swadelay.csv", header = T)
