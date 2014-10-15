#!/usr/bin/Rscript

#install.packages("ggplot2", repos="http://cran.rstudio.com/")

mydata <- read.table("agg.txt", header=TRUE, sep=" ")

args <- commandArgs(trailingOnly = TRUE)
title <- args[1]

png("ldavg.png")
plot(mydata$time,  mydata$ldavg, type="n", main=title, xlab="time", ylab="aggreagator average load")
lines(mydata$time,  mydata$ldavg, type="o", cex=.1, pch=19 )

png("responsetime.png")
plot(mydata$time, mydata$rtavg,  type="n", main=title, xlab="time", ylab="aggregator response times")
legend("topright", c("RTavg", "RTmedian", "TP75", "TP95"), lty=1, col=c("black","blue","pink","green"), cex=.65) 
lines(mydata$time, mydata$rtavg, type="o", cex=.1, pch=19 )
lines(mydata$time, mydata$rtmedian, type="o", cex=.1, pch=19, col="blue" )
lines(mydata$time, mydata$rt75, pch=19, cex=.1, type="o", col="pink", lty=2)
lines(mydata$time, mydata$rt95, pch=19, cex=.1, type="o", col="green", lty=2)

png("errors.png")
plot(mydata$time, mydata$errors, ylim=c(0,max(mydata$timeouts)), type="n", main=title, xlab="time", ylab="errors and timeouts")
legend("bottomright", c("errors", "timeouts"), lty=1, col=c("green","black"), cex=.65) 
lines(mydata$time, mydata$errors, pch=19, cex=.1, col="green", type="o")
lines(mydata$time, mydata$timeouts, pch=19, cex=.1, type="o" )

png("oldgen.png")
plot(mydata$time, mydata$oldgenheap, type="n",main=title,  xlab="time", ylab="old generation heap")
lines(mydata$time, mydata$oldgenheap, type="o", pch=19, cex=.1)

png("gctime.png")
plot(mydata$time, mydata$gctime, type="n",main=title,  xlab="time", ylab="gctime")
lines(mydata$time, mydata$gctime, type="o", pch=19, cex=.1 )





