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
plotts.wge(df$freq)
plotts.sample.wge(df$freq)

aic5.wge(df$freq)
