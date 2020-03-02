#Unit 9 Home Work
library(tswge)

data("sunspot.classic")
#Convert to a more readable time series
sunspot.classic = ts(sunspot.classic, start = 1749, end = 1924, frequency = 1)
#Visualize with a title
plot(sunspot.classic, type="o", main="Classic Sunspot Data: 1749-1924")
#TSWGE plot
plotts.wge(sunspot.classic)

sunspot.est.yw2 = est.ar.wge(sunspot.classic,p=2,type='yw')
sunspot.est.yw8 = est.ar.wge(sunspot.classic,p=8,type='yw')
sunspot.est.burg2 = est.ar.wge(sunspot.classic,p=2,type='burg')
sunspot.est.burg8 = est.ar.wge(sunspot.classic,p=8,type='burg')
sunspot.est.mle2 = est.ar.wge(sunspot.classic,p=2,type='mle')
sunspot.est.mle8 = est.ar.wge(sunspot.classic,p=8,type='mle')

sunspot.mean = mean(sunspot.classic)
#[1] 44.78409