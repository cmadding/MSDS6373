#6.4 ARIMA Models Differencing

# the following command differences the data in x
# y=artrans.wge(x,phi.tr=1)
# This simply means that y(i) = x(i) – x(i-1)
#computes y(t)=x(t)-phi1X(t-1)-phi2x(t-2), for t=3, ..., n
# y has length n-1 because x(1) has no x(0) before it.
# Example
x = c(1,3,6,10,25)
y = artrans.wge(x,phi.tr = 1)
y # shows the 4 differences

#Example
x = gen.arima.wge(200,phi = 0, var = 1,d = 1,sn = 31)
acf(x)

#Difference the data to "stationarize" the data
#R Code:
#Xtilda_t = a_t = whitenoise
#removes the (1-B) to look at stationary data
Xtilde = artrans.wge(x,1)
plotts.wge(Xtilde) 
acf(Xtilde)
aic5.wge(Xtilde)
#Five Smallest Values of  aic 
#     p    q     aic
#1    0    0 -0.08725030 = Whitenoise