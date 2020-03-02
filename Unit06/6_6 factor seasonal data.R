library(tswge)

#create a factor table
factor.wge(phi=c(rep(0,11),1))

#Sample factor tables
factor.wge(c(1)) #(1-B^1)
factor.wge(c(0,1)) #(1-B^2)
factor.wge(c(0,0,1)) #(1-B^3)
factor.wge(c(0,0,0,1)) #(1-B^4)
factor.wge(c(0,0,0,0,0,1)) #(1-B^5)
factor.wge(c(0,0,0,0,0,0,0,0,0,0,0,1)) #(1-B^12)
factor.wge(c(rep(0,3),1)) #(1-B^4)
factor.wge(c(rep(0,11),1)) #(1-B^12)
factor.wge(c(rep(0,4),1)) #(1-B^5)
factor.wge(c(rep(0,6),1)) #(1-B^6)
factor.wge(c(rep(0,14),1)) #(1-B^15)

#Factor 15 looks almost the same as factor 12
factor.wge(c(0.6996, 0.2599, 0.0079, -0.0646, 0.1381, -0.0953, 0.0235, -0.0969, 0.1770, -0.1191, 0.1030, 0.7754, -0.4590, -0.4099, 0.0501))

# Factor the model below and show that it is a monthly seasonal model:
# (.2B - .4B2 - .49B3 - 1B12 - .2B13 + .4B14 + .4B14 + .49B15) Xt = (1 + .92B)at
#when looking for the season info we can ingorne the MA side
factor.wge(c(-0.20, 0.40, 0.49, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 0.20, -0.40, -0.49)) 
# Looking at the factor table there are 2 extra numbers, thoses become the leftover factors
# (1-0.88B)(1+1.08B+.55B^2)(1-B^12)Xt=(1+.29B)at

# 5-Month seasonal model
#(.3B - .8B2 - 1B5 - .3B6 + .8B7) Xt = (1 + .29B)at
factor.wge(c(-0.30, 0.80, 0.00, 0.00, 1.00, 0.30, -0.80))
# (1 + .3B - .8B2)(1 - B5) Xt = (1 + .29B)at

#Use factor.wge to use the factor table to match the closest-fitting model. 
factor.wge(c(-0.50, 0.20, 0.00, -1.00, 0.50, -0.20))
#Quarterly seasonality model

factor.wge(c(0.30, 1.20, 0.40, 0.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, -1.00, 0.30, -1.20, -0.40))
#Monthly seasonality model