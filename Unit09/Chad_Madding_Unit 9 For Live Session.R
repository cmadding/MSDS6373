#The weekly Texas gas prices since January 2015 are listed in the attached data set (TexasGasPrice.csv).  
#You work for a trucking company, and your boss has asked you to forecast the gas price for the next 24 weeks.

library(tswge)
library(tswgewrapped)

# Read in the data
texasgasprice = read.csv("texasgasprice.csv",header = TRUE)
#Convert to Time Seres
texasgasprice = ts(texasgasprice$Price, start = c(2015,1), end = c(2018,49), frequency = 52)

#Visualize/plot the data.
plotts.wge(texasgasprice) #data read into array texasgasprice
plot(texasgasprice, type="l", main="Texas Gas Prices Jan 2015 - Dec 2018")

#1. Fit an AR(2) to the data using the maximum likelihood estimates (mle) like you did in the Concept Check question.
texasgasprice.mle=est.ar.wge(texasgasprice,p=2,type='mle')
texasgasprice.mle

#2. Fit and AR(2) to the data using the Burg (burg) estimates. Display and describe.
texasgasprice.burg=est.ar.wge(texasgasprice,p=2,type='burg')
texasgasprice.burg

#3. Find the ASE for the maximum likelihood fit by forecasting the last 24 weeks of the series.
texasgasprice.mle.est = fore.arma.wge(texasgasprice, phi = texasgasprice.mle$phi, theta = 0,lastn = T, n.ahead = 24)
texasgasprice.mle.ase = mean((texasgasprice[(205-24+1):205] - texasgasprice.mle.est$f)^2)

#4. Find the ASE for the Burg fit by forecasting the last 24 weeks of the series.
texasgasprice.burg.est = fore.arma.wge(texasgasprice, phi = texasgasprice.burg$phi, theta = 0,lastn = T, n.ahead = 24)
texasgasprice.burg.ase = mean((texasgasprice[(205-24+1):205] - texasgasprice.burg.est$f)^2)

#5. Which model would you choose?
#Looking at the ASE for both the maximum likelihood estimates and the Burg estimates, the Burg would be the one to choose based strictly on the AIC.
texasgasprice.mle.ase
#[1] 0.01461187
texasgasprice.burg.ase
#[1] 0.01309828

#Use aic.wge() or aic5.wge() to identify estimates of p and q. 
aic5.wge(texasgasprice)
#Changing some settings to check other options
aic5.wge(texasgasprice,p=0:15,q=0:2,type="aic")
aic5.wge(texasgasprice,p=0:15,q=0:2,type="bic")

#Use the estimate of p and q to get estimates of the phis and thetas.
est = est.arma.wge(texasgasprice, p = 2, q = 0)

#Use the estimated model to forecast and so on. 
phi=est$phi
theta=est$theta
texasgasprice.est = fore.arma.wge(texasgasprice, phi = est$phi, theta = est$theta, n.ahead = 8)

#First week's est:
texasgasprice.est$f[1]
#Eighth week est:
texasgasprice.est$f[8]
