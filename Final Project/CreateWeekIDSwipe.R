#Read in the data
SMU = read.csv('SMU.csv',header = TRUE)
#Look at the top of the data
head(SMU)

SMU$Week<-paste(SMU$Month, SMU$Day, sep=" ")

#Renaming some information for ease of use
#SMU$Temperature <- SMU$HourlyDryBulbTemperature
#SMU$Hour <- SMU$Hour.x

#Dropping some data we no longer need
drop <- c("ID.", "interval_15", "Minutes_15")
SMU = SMU[,!(names(SMU) %in% drop)]

colnames(SMU)[2] = "Turnstile"

SMU$Date <- as.Date(SMU$LDT)

# Extract day of the week (Saturday = 6)
SMU$Week_Day <- as.numeric(format(format.Date(SMU$LDT,"%w")))

# Adjust end-of-week date (first saturday from the original Date)
SMU$End_of_Week <- SMU$Date + (6 - SMU$Week_Day)

# Aggregate over week and climate division
SMU$WeeklyTemperature = aggregate(Temperature~End_of_Week, FUN=mean, data=SMU, na.rm=TRUE)


