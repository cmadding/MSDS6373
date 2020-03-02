#9_7 Estimation Noise Variance

library(tswge)

x=gen.arma.wge(n=100,phi=c(2.195,-1.994,.796), sn=53)
#Estimation of an AR(3) using MLE
x.mle=est.ar.wge(x,p=3,type='mle')

x.mle
#White Noise Var
x.mle$avar
#The White Noise Var is the mean square of the res
mean(x.mle$res^2)
