#9.13 Putting It All Together: Jet Fuel

library(tswge)
library(readr)

#Read in the data
jet = read.csv("Data/TexasJetFuel.csv",header = TRUE)

#Convert to Time Series
jet = ts(jet)

#Visualize/plot the data.
plotts.wge(jet) #data read into array jet

#Use aic.wge() or aic5.wge() to identify estimates of p and q. 
aic5.wge(jet)

#Use the estimate of p and q to get estimates of the phis and thetas.
est = est.arma.wge(jet, p = 1, q = 1)

#Use the estimated model to forecast and so on. 
fore.arma.wge(jet, phi = est$phi, theta = est$theta, n.ahead = 8)
