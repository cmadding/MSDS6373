library(tswge)

# generate data from the ARIMA(2,2,0) model
x=gen.arima.wge(n=200,d=2,phi=c(1.2,-.6),sn=132,vara=1)

# difference the data
x.d1=artrans.wge(x,phi.tr=1)
# difference the data again since the differenced data 
#    still has nonstationary ARIMA characteristics
#     (see previous slide)
x.d2=artrans.wge(x.d1,phi.tr=1)
#  x.d2 appears to be stationary (see previous slide)
aic5.wge(x.d2,p=0:5,q=0:2)
# AIC picks an AR(2)  # which seems reasonable from
est.ar.wge(x.d2,p=2)
#  $phi[1]  1.2724446 -0.6827008
#   $avar [1] 1.026015
mean(x)  # 1512

#(1_B)^2(1-1.27B+.68B^2)(Xt-1512)=at WHV=1.03