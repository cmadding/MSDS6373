library(tswge)

# generate ARIMA(2,1,0) data
x=gen.arima.wge(n=200,phi=c(1.2,-.8),d=1,sn=56)
# Assume it will eventually make it back to a fixed 
# process mean. That is, it is attracted to a constant mean.
aic5.wge(x) # selects a p = 4, q = 0
est.arma.wge(x, p = 4, q = 0)
#phis:  2.3546329 -2.2920782  1.0456011 -0.1101713
#avar: 0.9295115
mean(x) #-21.21951
