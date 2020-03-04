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

#Let's group all badge swipes by 15 minutes (quarter hour)
SMUSwipe$Minutes <- format(SMUSwipe$`Message Date/Time`,"%M")
SMUSwipe$interval_15 <-ifelse(SMUSwipe$Minutes <= 15, 1, ifelse(SMUSwipe$Minutes <= 30, 2, ifelse(SMUSwipe$Minutes <= 45, 3, ifelse(SMUSwipe$Minutes <= 60, 4))))
SMUSwipe$Minutes_15<-paste(SMUSwipe$Hours, SMUSwipe$interval_15, sep=" ")
head(SMUSwipe)
df15 = count(SMUSwipe, "Minutes_15")

#convert to time series
SMUturn101.2LB = ts(df$freq)
SMUturn101.2LB_15 = ts(df15$freq)

#Plot the hourly data
plotts.wge(SMUturn101.2LB)
plotts.sample.wge(SMUturn101.2LB)
#Plot the 15 minute data
plotts.wge(SMUturn101.2LB_15)
plotts.sample.wge(SMUturn101.2LB_15)

#Use aic.wge() or aic5.wge() to identify estimates of p and q. 
aic5.wge(SMUturn101.2LB_15)
#Changing some settings
aic5.wge(SMUturn101.2LB_15,p=0:11,q=0:5,type="aic")
aic5.wge(SMUturn101.2LB_15,p=0:11,q=0:5,type="bic")

#Use the estimate of p and q to get estimates of the phis and thetas.
est = est.arma.wge(SMUturn101.2LB_15, p = 2, q = 4)

#Use the estimated model to forecast and so on. 
phi=est$phi
theta=est$theta
fore.arma.wge(SMUturn101.2LB, phi = est$phi, theta = est$theta, n.ahead = 24, limits=F)

fore.aruma.wge(SMUturn101.2LB, phi = est$phi, theta = est$theta, n.ahead = 24, limits=F)
