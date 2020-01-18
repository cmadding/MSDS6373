#install.packages("tidyverse")
library(tidyverse) # needs to be run every time you start R and want to use %>%
library(tswge)
library(tseries)
library(stats)

#Walmart Store 8Item 1 Filtering / spectral analysis / AR(3)
# Read in the data
Walmart = read.csv("Data/Walmart.csv",header = TRUE)

# Load the Data
Stor8Item1 = Walmart %>% dplyr::filter(item == 1 & store == 8)

#Look at and Visualize the data
head(Stor8Item1)
plotts.wge(Stor8Item1$sales)

#Break into month day and year.
Stor8Item1 = separate(Stor8Item1,col = date,into = c("month","day","year"), sep = "/")

#Change to dataframe
Stor8Item1 = data.frame(Stor8Item1)

#Look at Spectral density... evidence of yearly, monthly and weekly trend?  
#Yearly and Monthly are going to be tough with daily data. 
parzen.wge(Stor8Item1$sales, trunc= 500)

# Change to integers for easier sorting later.... could use other package to handle dates. 
Stor8Item1$month = as.integer(Stor8Item1$month)
Stor8Item1$year = as.integer(Stor8Item1$year)

# Aggregate to get monthly sales
Stor8Item1_grouped = Stor8Item1 %>% group_by(year,month) %>% summarise(mean_sales = mean(sales))

#Note data is out of order and that is a big deal.
head(Stor8Item1_grouped)

#Order by year and month
Stor8Item1_grouped = Stor8Item1_grouped[order(Stor8Item1_grouped$year,Stor8Item1_grouped$month),]

# Evidence of yearly trend?  Montly trend is still tough since there are differnt number of days in a month.
parzen.wge(Stor8Item1_grouped$mean_sales)

# to more clearly see the annual trend
parzen.wge(Stor8Item1_grouped$mean_sales,trunc = 30)

# Shows combo of pseudo cyclic and wandering behavior.
acf(Stor8Item1_grouped$mean_sales,lag = 30)

#ACF
acf(Stor8Item1_grouped$mean_sales[1:60], main="ACF of Wal Mart")
acf(Stor8Item1_grouped$mean_sales[1:30],plot=TRUE, main="ACF of Wal Mart 1st Half")
acf(Stor8Item1_grouped$mean_sales[31:60],plot=TRUE, main="ACF of Wal Mart 2nd Half")

plotts.sample.wge(Stor8Item1_grouped$mean_sales)

#Setup a 5 Point Moving Average Filter
ma5 = stats::filter(Stor8Item1_grouped$mean_sales,rep(1,5))/5
ma5 = na.remove(ma5)

#Plot the Low Pass 5 Point Moving Average
plot(ma5,type = 'l')
parzen.wge(ma5)
plotts.sample.wge(ma5)

#Setup a 51 Point Moving Average Filter
ma51 = stats::filter(Stor8Item1_grouped$mean_sales,rep(1,51))/51
ma51 = na.remove(ma51)

#Plot the Low Pass 51 Point Moving Average
plot(ma51,type = 'l')
parzen.wge(ma51)
plotts.sample.wge(ma51)

#Create a test set
Stor8Item1_season = ts(Stor8Item1_grouped$mean_sales,  frequency = 12)

plotts.sample.wge(Stor8Item1_season)

#Ljung-Box test for independence
#stationary data will have a high p-value
#a non-stationary signal will have a low p-value
lag.length = 30
Box.test(Stor8Item1_season, lag=lag.length, type="Ljung-Box") # test stationary signal

#Augmented Dickey-Fuller (ADF) t-statistic test for unit root
#t-statistic test to find if the series has a unit root
#(a series with a trend line will have a unit root and result in a large p-value).
#install.packages("fUnitRoots")
library(fUnitRoots)
adfTest(Stor8Item1_season, lags = 2, type = "c", title = "Augmented Dickey-Fuller - Wal-Mart Data", description = NULL)

#Kwiatkowski-Phillips-Schmidt-Shin (KPSS) for level or trend stationarity
#We can test if the time series is level or trend stationary using the Kwiatkowski-Phillips-Schmidt-Shin (KPSS) test.
#Here we will test the null hypothesis of trend stationarity
#(a low p-value will indicate a signal that is not trend stationary, has a unit root):
#(a high p-value will indicate a signal that is trend stationary)
kpss.test(Stor8Item1_season, null="Trend")
