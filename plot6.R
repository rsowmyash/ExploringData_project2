
## Read the files from the working directory ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

subsetNEI <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") &  NEI$type=="ON-ROAD",  ]

aggdata<- aggregate(subsetNEI$Emissions, by=list(year=subsetNEI$year,fips=subsetNEI$fips), FUN=sum)
library("ggplot2")

## # plot bargraph
png("C:/Users/skumar/Documents/R_working_site/exdata_data_NEI_data/plot6.png")
# plot bargraph
lp1 <- ggplot(aggdata, aes(x=year, y=Emissions, group=fips))+ geom_line(aes(x=year, y=x ,colour=fips))+
      labs(title= "Total Emissions Baltimore & LosAngeles")
lp1 + scale_colour_discrete(name  ="Cities/Counties",
                            breaks=c("06037", "24510"),
                            labels=c("Los Angeles", "Baltimore")) 

dev.off()

