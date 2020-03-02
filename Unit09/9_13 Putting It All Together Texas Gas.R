#9.13 Putting It All Together: Texas gas price data
#The weekly Texas gas prices since January 2015 are listed in the attached data set (TexasGasPrice.csv).  
#You work for a trucking company, and your boss has asked you to forecast the gas price for the next two months.

library(tswge)

# Read in the data
texasgasprice = read.csv("texasgasprice.csv",header = TRUE)
#Convert to Time Seres
texasgasprice = ts(texasgasprice$Price)

#Visualize/plot the data.
plotts.wge(texasgasprice) #data read into array texasgasprice

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
