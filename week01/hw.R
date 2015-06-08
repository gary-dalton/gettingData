##
##
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, "housing.csv", method="curl")
dateDownloaded <- date()  ## "Sat Jun  6 16:47:42 2015"
housing<-read.csv("housing.csv")
fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(fileURL, "housing.pdf", method="curl")
u<- subset(housing, VAL==24, select= c("ST","VAL"))
ans1<-nrow(u)
ans1    ## 53

##
##
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, "gas.xlsx", method="curl", mode='wb')
## SWITCH TO CLI
library(xlsx)
dat<-read.xlsx("gas.xlsx", sheetIndex=1,header=TRUE)
dat<- read.xlsx("gas.xlsx", sheetIndex=1, rowIndex=c(18:23), colIndex=c(7:15), header=TRUE)
write.csv(dat, "gas.csv")
## DONE WITH CLI
dat<- read.csv
ans<-sum(dat$Zip*dat$Ext,na.rm=T)
ans    ## 36534720
##
##

##
##
fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileURL, "restaurants.xml", method="curl")
doc <- xmlTreeParse("restaurants.xml",useInternal=TRUE)
rootNode <- xmlRoot(doc)
rootNode[[1]]
zips<-xpathSApply(rootNode,"//zipcode",xmlValue)
a <- table(zips)
ans<-a[names(a)=="21231"]
ans   ## 21231    127
##
##

##
##
fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, "housing2.csv", method="curl")
library(data.table)
DT<- fread("housing2.csv")
system.time(for(i in 1:1000) DT[,mean(pwgtp15),by=SEX])
## 1.663
system.time(for(i in 1:1000) sapply(split(DT$pwgtp15,DT$SEX),mean))
## 1.512
mean(DT$pwgtp15,by=DT$SEX)
## Wrong answer
system.time(for(i in 1:100) mean(DT[DT$SEX==1,]$pwgtp15) )
## 15.314
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
## error
system.time(for(i in 1:1000) tapply(DT$pwgtp15,DT$SEX,mean) )
## 2.643







