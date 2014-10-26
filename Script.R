
install.packages("XML")
library(XML)
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml "
download.file(fileUrl, destfile=tf<-tempfile(fileext="xml"))
doc<-xmlParse(tf)
zip<-xpathSApply(doc, "/response/row/row/zipcode",xmlValue)
sum(zip==21231)


install.packages("data.table")
DT<-fread("getdata-data-ss06pid.csv")

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])

add2<-function(x,y) {
  x+y
}

above10<-function (x) {
  use<-x>10
  x[use]
}

above<-function(x,n) {
  n<-100
  use<-x>n
  x[use]
}

columnmean<-function(y) {
  nc<-ncol(y)
  means<-numeric(nc)
  for(i in 1:nc) {
    means[i] <-mean(y[,i], na.rm=TRUE)
  }
  means
}

x <- 1
if(x > 0) {
  x <- 0
}

acs<-read.csv("clean.csv", header=TRUE, sep=",")


bioURL<-"http://biostat.jhsph.edu/~jleek/contact.html"
data<-readLines(bioURL)
