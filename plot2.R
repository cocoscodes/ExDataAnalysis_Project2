library(dplyr)
balt <- subset(NEI,NEI$fips=="24510")
dbalt <- balt %>%
    group_by(Year = year) %>%
    summarise(Values=sum(Emissions))
plot(dbalt$Year,dbalt$Values,ylab = "PM2.5 totals", xlab = "Years",
     main = "Total emissions PM2.5 in Baltimore from 1999 to 2008")
segments(dbalt$Year[1],dbalt$Values[1],dbalt$Year[2],dbalt$Values[2])
segments(dbalt$Year[2],dbalt$Values[2],dbalt$Year[3],dbalt$Values[3])
segments(dbalt$Year[3],dbalt$Values[3],dbalt$Year[4],dbalt$Values[4])

dev.copy(png, file = "plot2.png",width=480, height=480)
dev.off()