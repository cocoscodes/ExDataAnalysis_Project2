NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
mobile <- SCC[grepl("^Mobile - On-Road",SCC$EI.Sector),]
idx <- as.character(mobile[,1])
BAlTmobile <- subset(NEI,NEI$SCC %in% idx & NEI$fips=="24510") %>%
  group_by(Year = year) %>%
  summarise(Values=sum(Emissions))

ggplot(BAlTmobile,aes(BAlTmobile$Year,BAlTmobile$Values))+geom_line()+
  labs(title = "Motor vehicle sources changed from 1999–2008 in Baltimore",
       y="PM2.5 Emissions",x="Year")

dev.copy(png, file = "plot5.png",width=480, height=480)
dev.off()