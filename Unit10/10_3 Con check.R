library(tswge)

X10_year_bond_rate_2010_2015 <- read.csv("10_year_bond_rate_2010-2015.csv", header = T)
#convert to a time series
X10_year_bond_rate_2010_2015 <- ts(X10_year_bond_rate_2010_2015$Adj.Close)

#Plot the data
plotts.wge(X10_year_bond_rate_2010_2015)
plotts.sample.wge(X10_year_bond_rate_2010_2015)

#Differencing the bond data
X10_year_bond_diff=artrans.wge(X10_year_bond_rate_2010_2015, phi.tr = 1)

#Using the AIC to estimate the differanced data
aic5.wge(X10_year_bond_diff)

#Using the AIC to on the original data
aic5.wge(X10_year_bond_rate_2010_2015)

est.ar.wge(X10_year_bond_rate_2010_2015)
