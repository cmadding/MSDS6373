library(tswge)

#Result (Tiao/Tsay) (loosely stated):
#If a high order AR(p) model is fit to a realization from a nonstationary model with roots on the unit circle,
#then factors associated with these roots will "show up" in the factor table.

# generate ARIMA(2,1,0) data as before
xd1=gen.arima.wge(n=200,phi=c(1.2,-.8),d=1,sn=56)
# fit an AR(6) and AR(8) to this realization
est.ar.wge(xd1,p=6,type='burg')
est.ar.wge(xd1,p=8,type='burg')

#Coefficients of Original polynomial:  
 # 2.3515 -2.2580 0.9502 0.0147 -0.0801 0.0191 

#Factor                 Roots                Abs Recip    System Freq 
#1-0.9944B (1-B)        1.0056               0.9944       0.0000
#1-1.1978B+0.7584B^2    0.7897+-0.8337i      0.8708       0.1293
#1-0.4472B+0.0881B^2    2.5391+-2.2157i      0.2967       0.1142
#1+0.2879B             -3.4738               0.2879       0.5000


X10_year_bond_rate_2010_2015 <- read.csv("10_year_bond_rate_2010-2015.csv", header = T)
#convert to a time series
X10_year_bond_rate_2010_2015 <- ts(X10_year_bond_rate_2010_2015$Adj.Close)

# fit an AR(6) and AR(8) to this realization
est.ar.wge(X10_year_bond_rate_2010_2015,p=6,type='burg')
