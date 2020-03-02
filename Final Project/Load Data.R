library(readxl)
library(tswge)
library(plyr)

#Read in the data
SMUSwipe <- read_excel("Journal for 'DEDM (101.2LB)' iSTAR Door.xlsx")
#SMUSwipe <- read_excel(file.choose())

#Data Cleaning
# Remove First Column
SMUSwipe = SMUSwipe[2:3]
str(SMUSwipe)
#Remove any rejected \ change state rows
SMUSwipe = SMUSwipe[SMUSwipe[,1]=="Card Admitted",]
#Create a Time column
SMUSwipe$Time <- format(SMUSwipe$`Message Date/Time`,"%H:%M:%S")
#Create a Date column
SMUSwipe$Date <- as.Date(SMUSwipe$`Message Date/Time`)

#Let's group all badge swipes by the hour
SMUSwipe$Hours <- format(SMUSwipe$`Message Date/Time`,"%Y-%m-%d-%H")
head(SMUSwipe)
df = count(SMUSwipe, "Hours")
#convert to time series
SMUturn101.2LB = ts(df$freq)

#Plot the data
plotts.wge(SMUturn101.2LB)
plotts.sample.wge(SMUturn101.2LB)

#Use aic.wge() or aic5.wge() to identify estimates of p and q. 
aic5.wge(SMUturn101.2LB)
#Changing some settings
aic5.wge(SMUturn101.2LB,p=0:11,q=0:2,type="aic")
aic5.wge(SMUturn101.2LB,p=0:11,q=0:2,type="bic")

#Use the estimate of p and q to get estimates of the phis and thetas.
est = est.arma.wge(SMUturn101.2LB, p = 4, q = 2)

#Use the estimated model to forecast and so on. 
phi=est$phi
theta=est$theta
fore.arma.wge(SMUturn101.2LB, phi = est$phi, theta = est$theta, n.ahead = 24, limits=F)
