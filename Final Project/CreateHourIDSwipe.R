library(utils)
library(dplyr)
#Read in the data
SMU = read.csv('SMUSwipe.csv',header = TRUE)
#Look at the top of the data
head(SMU)

#Dropping some data we no longer need
drop <- c("ID.", "interval_15", "Minutes_15","Time")
SMU = SMU[,!(names(SMU) %in% drop)]

SMU$Week<-paste(SMU$Month, SMU$Day, sep=" ")

#Renaming some information for ease of use
#SMUSwipe$Temperature <- SMUSwipe$HourlyDryBulbTemperature
#SMUSwipe$Hour <- SMUSwipe$Hour.x

colnames(SMU)[2] = "Turnstile"

SMU$Date <- as.Date(SMU$LDT)

# Extract day of the week (Saturday = 6)
SMU$Week_Day <- as.numeric(format(format.Date(SMU$LDT,"%w")))

# Adjust end-of-week date (first saturday from the original Date)
SMU$End_of_Week <- SMU$Date + (6 - SMU$Week_Day)

HourSwipes = dplyr::count(SMU,Hours)
DaySwipes = dplyr::count(SMU,Date)
WeekSwipes = dplyr::count(SMU,End_of_Week)
MonthSwipes = dplyr::count(SMU,Month)

HourSwipesTemp = merge(HourSwipes,SMU, by='Hours')
HourSwipesTemp = distinct(HourSwipesTemp, Hours, .keep_all = TRUE)

DaySwipesTemp = merge(DaySwipes,SMU, by='Date')
DaySwipesTemp = distinct(DaySwipesTemp, Date, .keep_all = TRUE)
# Aggregate over Date and Temperature
DaySwipesTemp$DayTemperature = aggregate(Temperature~Date, FUN=mean, data=SMU, na.rm=TRUE)
DaySwipesTemp = DaySwipesTemp[,!(names(DaySwipesTemp) %in% 'Temperature')]

WeekSwipesTemp = merge(WeekSwipes,SMU, by='End_of_Week')
WeekSwipesTemp = distinct(DaySwipesTemp, End_of_Week, .keep_all = TRUE)
# Aggregate over week and Temperature
WeekSwipesTemp$WeekTemperature = aggregate(Temperature~End_of_Week, FUN=mean, data=SMU, na.rm=TRUE)
WeekSwipesTemp = WeekSwipesTemp[,!(names(WeekSwipesTemp) %in% 'Temperature')]

MonthSwipesTemp = merge(MonthSwipes,SMU, by='Month')
MonthSwipesTemp = distinct(MonthSwipesTemp, Month, .keep_all = TRUE)
# Aggregate over week and Temperature
MonthSwipesTemp$MonthTemperature = aggregate(Temperature~Month, FUN=mean, data=SMU, na.rm=TRUE)
MonthSwipesTemp = MonthSwipesTemp[,!(names(MonthSwipesTemp) %in% 'Temperature')]


#Change n to IDSwipes
colnames(HourSwipesTemp)[2] = "IDSwipes"
colnames(DaySwipesTemp)[2] = "IDSwipes"
colnames(WeekSwipesTemp)[2] = "IDSwipes"
colnames(MonthSwipesTemp)[2] = "IDSwipes"

#Dropping some data we no longer need
drop <- c("LDT", "Minutes", "Week", "Turnstile")
HourSwipesTemp = HourSwipesTemp[,!(names(HourSwipesTemp) %in% drop)]
DaySwipesTemp = DaySwipesTemp[,!(names(DaySwipesTemp) %in% drop)]
WeekSwipesTemp = WeekSwipesTemp[,!(names(WeekSwipesTemp) %in% drop)]
MonthSwipesTemp = MonthSwipesTemp[,!(names(MonthSwipesTemp) %in% drop)]


#Export the dataset
write.csv(HourSwipesTemp,"DedmanHourlySwipe.csv", row.names = FALSE)
write.csv(DaySwipesTemp,"DedmanDailySwipe.csv", row.names = FALSE)
write.csv(WeekSwipesTemp,"DedmanWeeklySwipe.csv", row.names = FALSE)
write.csv(MonthSwipesTemp,"DedmanMonthlySwipe.csv", row.names = FALSE)
