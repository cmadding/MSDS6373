# generate ARIMA(2,2,0) data as before
x=gen.arima.wge(n=200,d=2,phi=c(1.2,-.6),sn=132)
# fit an AR(8) and AR(10) to this realization
est.ar.wge(x,p=8,type='burg')
est.ar.wge(x,p=10,type='burg')

zero_one_or_tworootsofone <- read.csv("zero_one_or_tworootsofone.csv", header = T)
zero_one_or_tworootsofone=ts(zero_one_or_tworootsofone$x)

est.ar.wge(zero_one_or_tworootsofone,p=10,type='burg')
