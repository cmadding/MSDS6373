library(tswge)

# generate ARIMA(2,1,0) data
xd1=gen.arima.wge(n=200,phi=c(1.2,-.8),d=1,sn=56)
# difference the data
xd1.dif=artrans.wge(xd1,phi.tr=1)
# xd1.dif is the differenced data

# the following command differences the data in x
y=artrans.wge(x,phi.tr=1)
# This simply means that y(i) = x(i) - x(i-1)
# y has length n-1 because x(1) has no x(0) before it.
# Example
x = c(1,3,6,10,25)
y = artrans.wge(x,phi.tr = 1)
y # shows the 4 differences

# generate ARIMA(2,1,0) data
xd1=gen.arima.wge(n=200,phi=c(1.2,-.8),d=1,sn=56)
# difference the data
xd1.dif=artrans.wge(xd1,phi.tr=1)
# xd1.dif is the differenced data
