library(tswge)
library(tseries)

data(noctula)
plot(noctula)
length(noctula)
#ACF
acf(noctula, main="ACF of noctula")
acf(noctula[1:48],plot=TRUE, main="ACF of noctula 1st Half")
acf(noctula[48:96],plot=TRUE, main="ACF of noctula 2nd Half")
adf.test(noctula)

data(lavon)
plot(lavon)
length(lavon)
#ACF
acf(lavon, main="ACF of lavon")
acf(lavon[1:56],plot=TRUE, main="ACF of lavon 1st Half")
acf(lavon[57:112],plot=TRUE, main="ACF of lavon 2nd Half")
adf.test(lavon)

data(whale)
plot(whale)
length(whale)
#ACF
acf(whale, main="ACF of whale")
acf(whale[1:143],plot=TRUE, main="ACF of whale 1st Half")
acf(whale[144:286],plot=TRUE, main="ACF of whale 2nd Half")
plot.ts(whale, col = "blue",lwd=2,lty=1, main="TIME SERIES PLOT OF whale",cex.main=1)
adf.test(whale)
