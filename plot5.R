## Read the files from the working directory ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

## Subset the data for  emissions from motor vehicle sources##
subsetNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
## Aggregate the dataset##
aggdata<- aggregate(subsetNEI$Emissions, by=list(year=subsetNEI$year,type=subsetNEI$type), FUN=sum)

# set options scipen to force Y labels out of scientific notation
options("scipen"=100)
library(ggplot2)
png("C:/Users/skumar/Documents/R_working_site/exdata_data_NEI_data/plot5.png", width=480, height=640)

###  set device to png and Plot the graph by year and Emissions ##
ggplot(data=aggdata, aes(x=year, y=x)) +
  geom_bar(colour= 'red', fill="#DD8888", stat="identity")+
  xlab("Year")+ 
  ylab(expression("Total Emissions"))+
  ggtitle('Total Emissions from motor vehicle in Balitmore city')+guides(fill= TRUE)
dev.off()