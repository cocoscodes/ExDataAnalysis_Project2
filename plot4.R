NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(ggplot2)
coal <- SCC[grepl("Coal$",SCC$EI.Sector),]
idx <- as.character(coal[,1])
UScoal<- subset(NEI,NEI$SCC %in% idx) %>%
  group_by(Year=year) %>%
  summarise(Value=sum(Emissions))

ggplot(UScoal,aes(UScoal$Year,UScoal$Value))+geom_line()+
  labs(title = "US coal combustion-related sources changed from 1999–2008",
       y="PM2.5 Emissions", x="Year")

dev.copy(png, file = "plot4.png",width=480, height=480)
dev.off()