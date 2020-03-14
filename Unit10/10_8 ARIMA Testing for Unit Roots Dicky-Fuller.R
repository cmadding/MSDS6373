#10_8 ARIMA Testing for Unit Roots Dicky-Fuller
library(tseries)
library(tswge)

#Augmented Dickey–Fuller Test
#Computes the Augmented Dickey-Fuller test for the null that x has a unit root.
#adf.test(x, alternative = c("stationary", "explosive"),k = trunc((length(x)-1)^(1/3)))

x = gen.arma.wge(200,phi = c(.9), sn = 5)

adf.test(x)
#   Augmented Dickey-Fuller Test

#data:  x
#Dickey-Fuller = -3.1162, Lag order = 5, p-value = 0.1086
#alternative hypothesis: stationary

#Run the code without the seed:
x = gen.arma.wge(200,phi = c(.9))

adf.test(x)

