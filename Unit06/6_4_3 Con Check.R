#ARIMA(2,2,1)
#(1 -.6B +.8B2)(1 - B)2 Xt = (1 +.3B)at
a = gen.arima.wge(200,phi = c(.6,-.8), theta = .3, var = 1,d = 2,sn = 21)
factor.wge(a)
plotts.sample.wge(a)
p = parzen.wge(a, trunc = 40)

# 1. True Autocorrelation at lag = 5 (p5)
Trueacf = acf(a)
Trueacf$acf[6]
#0.9827964 = 1

# 2. System Frequency associated with the complex root from the AR factor?
ar = mult.wge(fac1 = c(.6,-.8), fac2 = 1, fac3 = 1)
factor.wge(ar$model.coef)  
#0.1956

# 3. Generate a releazation of size 500, seed 37. Where is the bigest peek in the SD?
x = gen.arima.wge(500,phi = c(.6,-.8), theta = .3, var = 1,d = 2,sn = 37)
p = parzen.wge(x, trunc = 40)
# 0