NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
mobile <- SCC[grepl("^Mobile - On-Road",SCC$EI.Sector),]
idx <- as.character(mobile[,1])
BAlTmobile <- subset(NEI,NEI$SCC %in% idx & NEI$fips=="24510") %>%
  group_by(Year = year) %>%
  summarise(Values=sum(Emissions))
BAlTmobile$City <- rep("Baltimore",4)
LAmobile <- subset(NEI,NEI$SCC %in% idx & NEI$fips=="06037") %>%
  group_by(Year = year) %>%
  summarise(Values=sum(Emissions))
LAmobile$City <- rep("LA",4)

FData <- rbind(BAlTmobile,LAmobile)

ggplot(FData,aes(FData$Year,FData$Values,color=FData$City))+geom_line()+
  labs(title = "Compare emissions from motor vehicle sources Baltimore vs LA",
       y="PM2.5 Emissions",x="Year",color="City")

dev.copy(png, file = "plot6.png",width=480, height=480)
dev.off()