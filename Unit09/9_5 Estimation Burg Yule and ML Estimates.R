#9_5 Estimation Burg Estimates
#AR Models ONLY

library(tswge)
#Generate some data
x=gen.arma.wge(n=200,phi=c(1.6,-.9),vara=2,sn=33)
plot.ts(x)

#Yule Walker Estimate
x.yw=est.ar.wge(x,p=2,type='yw')
x.yw

#Burg Estimates
x.burg=est.ar.wge(x,p=2,type='burg')

#Maximum Likelihood Estimation
x.mle=est.ar.wge(x,p=2,type='mle')

#ACF and Spectral Density
plotts.sample.wge(x)

#Con Check
#Burg Estimates
x200.burg=gen.arma.wge(n=200,phi=c(.3,-.7), vara=4,sn=27)
x200.burg=x200.burg+37
x200.burgEST=est.ar.wge(x200.burg,p=2,type='burg')

