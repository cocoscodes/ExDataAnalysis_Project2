NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
dbalt <- subset(NEI,NEI$fips=="24510") %>%
    group_by(Year = year,Type=type) %>%
    summarise(Values=sum(Emissions))
ggplot(dbalt,aes(dbalt$Year,dbalt$Values))+ 
    geom_line(aes(color=dbalt$Type)) + 
    labs(title = "Emissions from 1999–2008 for Baltimore City",y="PM2.5 Emissions",
         x="Year",color="Type")

dev.copy(png, file = "plot3.png",width=480, height=480)
dev.off()