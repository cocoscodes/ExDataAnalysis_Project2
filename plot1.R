getwd()
setwd("C:/Users/asolis/Desktop/Data_training/DataScience/ExploratoryDataAnalysis")
setwd("./ExDataAnalysis_Project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

summary(NEI$Emissions)
names(NEI)
str(NEI)
unique(NEI$year)

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system,
# make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
library(dplyr)
yearComp <- NEI %>%
    group_by(year) %>%
    summarise(Values=sum(Emissions))
plot(yearComp$Year,yearComp$Values,ylab = "PM2.5 totals", xlab = "Years",
     main = "Total emissions PM2.5 in the USA from 1999 to 2008")
segments(yearComp$Year[1],yearComp$Values[1],yearComp$Year[2],yearComp$Values[2])
segments(yearComp$Year[2],yearComp$Values[2],yearComp$Year[3],yearComp$Values[3])
segments(yearComp$Year[3],yearComp$Values[3],yearComp$Year[4],yearComp$Values[4])

dev.copy(png, file = "plot1.png",width=480, height=480)
dev.off()



