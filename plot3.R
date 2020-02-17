library(dplyr)
library(ggplot2)
balt <- subset(NEI,NEI$fips=="24510")
dbalt <- balt %>%
    group_by(Year = year,Type=type) %>%
    summarise(Values=sum(Emissions))
ggplot(dbalt,aes(dbalt$Year,dbalt$Values))+ 
    geom_line(aes(color=dbalt$Type)) + 
    labs(title = "Emissions from 1999–2008 for Baltimore City",y="PM2.5 Emissions",x="Year",color="Type")
