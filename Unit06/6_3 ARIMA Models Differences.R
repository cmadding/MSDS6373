#6.4 ARIMA Models Differencing

# the following command differences the data in x
# y=artrans.wge(x,phi.tr=1)
# This simply means that y(i) = x(i) – x(i-1)
# y has length n-1 because x(1) has no x(0) before it.
# Example
x = c(1,3,6,10,25)
y = artrans.wge(x,phi.tr = 1)
y # shows the 4 differences

#Example
x = gen.arima.wge(200,phi = 0, var = 1,d = 1,sn = 31)
acf(x)
artrans.wge(x,1)
aic5.wge(artans.wge(x,1))

#Difference the data to "stationarize" the data
#R Code:
Xtilde = artrans.wge(x,1)
plotts.wge(Xtilde) 
acf(Xtilde)
