#9.13 Putting It All Together: Lynx Data

library(tswge)
library(readr)

#Read in the data
data("llynx")

#Visualize/plot the data.
plotts.wge(llynx) #data read into array llynx

#Use aic.wge() or aic5.wge() to identify estimates of p and q. 
aic5.wge(llynx)
#Changing some settings
aic5.wge(llynx,p=0:15,q=0:2,type="aic")
aic5.wge(llynx,p=0:15,q=0:2,type="bic")

#Use the estimate of p and q to get estimates of the phis and thetas.
est = est.arma.wge(llynx, p = 12, q = 0)

#Use the estimated model to forecast and so on. 
phi=est$phi
theta=est$theta
fore.arma.wge(llynx, phi = est$phi, theta = est$theta, n.ahead = 24)
