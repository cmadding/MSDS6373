#10_9 Seasonal Models Overfit Factor Tables
#install.packages("tswge")

library(tswge)
#Generate Seasonal data
x=gen.aruma.wge(n=48,s=4,sn=23)

#Are the sample autocorrelations large at s, 2s, 4s?
acf(x)

#Overfit Factor Table to check for seasonality in the data
est=est.ar.wge(x,p=8,type='burg')

#Coefficients of Original polynomial:  
 # -0.0716 -0.0904 -0.1688 0.9120 0.0136 0.0458 0.1348 0.0078 

#Factor                 Roots                Abs Recip    System Freq 
#1+0.0148B+0.9826B^2   -0.0075+-1.0088i      0.9912       0.2512
#1+0.9905B             -1.0096               0.9905       0.5000
#1-0.9556B              1.0465               0.9556       0.0000
#1-0.5126B+0.2985B^2    0.8585+-1.6164i      0.5464       0.1723
#1+0.4753B             -2.1041               0.4753       0.5000
#1+0.0593B             -16.8658               0.0593       0.5000

#Use artrans.wge() to get y. This is to remove the seasonality in the data.
#In this data it is quartley.
y = artrans.wge(x,phi.tr=c(0,0,0,1))

y.phi=artrans.wge(x,phi.tr=c(est$phi))

WhiteNoiseVar=sd(y)^2

#The final model:
# (1-B^4)X_t=a_t  sig_hat^2_a=1.006


