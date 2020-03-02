#9.3 Estimation: Maximum Likelihood Estimation
library(tswge)

x21=gen.arma.wge(n=100,phi=c(1.6,-.8),theta=.8,vara=5,sn=55)

# gen.arma generates data from a zero 
# mean model. We use this strategy to generate the
# AR(2) model with mean 50. 
x21=x21+50 

x21est = est.arma.wge(x21,p=2,q=1)

#phi's (AR)
x21est$phi

#White noise varance
x21est$avar

#theta one - moving average (MA) permater
x21est$theta

#mean
mean(x21)


#Estimating an AR(4)
#est.ar.wge(x, p = 2, factor = TRUE, type = "mle")

x40=gen.arma.wge(n=100,phi=c(0,-.7,.1,-.72),vara=10,sn=72)
x40=x40+20
est.ar.wge(x40,p=4,type='mle')#Using the Maximum Likelihood Estimation (MLE)
# or you could use est.arma.wge(x40,p=4)
mean(x40)

#Con Check Answer=B
x200=gen.arma.wge(n=200,phi=c(.3,-.7),theta = -.4, vara=4,sn=27)
x200=x200+37
x200e=est.arma.wge(x200,p=2,q=1)

#phi's (AR)
x200e$phi

#White noise varance
x200e$avar

#theta one - moving average (MA) permater
x200e$theta

#mean
mean(x200)
