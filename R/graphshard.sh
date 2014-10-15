#!/usr/bin/Rscript

args <- commandArgs(trailingOnly = TRUE)
title <- args[1]

mydata <- read.table("shard.txt", header=TRUE, sep=" ")
ipgroup <- unique(mydata$ip)
plotdata = subset(mydata, ip==ipgroup[1])

png("ldavg-shard.png")
plot(plotdata$time, plotdata$ldavg, type="n",main=title,  xlab="time", ylab="shard load avg")
legend("topright", legend=ipgroup, lty=1, col=c("black","blue","pink","green"), cex=.65)
for (i in 1:length(ipgroup)){
  newdata = subset(mydata, ip==ipgroup[i])
  lines(newdata$time, newdata$ldavg, type="o", pch=19, cex=.1, col=i)
}

png("rtmedian-shard.png")
plot(plotdata$time, plotdata$rtmedian, type="n",main=title,  xlab="time", ylab="median response time")
legend("topright", legend=ipgroup, lty=1, col=c("black","blue","pink","green"), cex=.65)
for (i in 1:length(ipgroup)){
  newdata = subset(mydata, ip==ipgroup[i])
  lines(newdata$time, newdata$rtmedian, type="o", pch=19, cex=.1, col=i)
}

png("rt95-shard.png")
plot(plotdata$time, plotdata$rt95, type="n",main=title,  xlab="time", ylab="median response time")
legend("topright", legend=ipgroup, lty=1, col=c("black","blue","pink","green"), cex=.65)
for (i in 1:length(ipgroup)){
  newdata = subset(mydata, ip==ipgroup[i])
  lines(newdata$time, newdata$rt95, type="o", pch=19, cex=.1, col=i)
}

png("oldgen-shard.png")
plot(plotdata$time, plotdata$oldgenheap, type="n",main=title,  xlab="time", ylab="old generation heap")
legend("topright", legend=ipgroup, lty=1, col=c("black","blue","pink","green"), cex=.65)
for (i in 1:length(ipgroup)){
  newdata = subset(mydata, ip==ipgroup[i])
  lines(newdata$time, newdata$oldgenheap, type="o", pch=19, cex=.1, col=i)
}

png("gctime-shard.png")
plot(plotdata$time, plotdata$gctime, type="n",main=title,  xlab="time", ylab="gctime")
legend("topright", legend=ipgroup, lty=1, col=c("black","blue","pink","green"), cex=.65)
for (i in 1:length(ipgroup)){
  newdata = subset(mydata, ip==ipgroup[i])
  lines(newdata$time, newdata$gctime, type="o", pch=19, cex=.1, col=i)
}

png("errors-shard.png")
plot(plotdata$time, plotdata$errors, type="n",main=title,  xlab="time", ylab="errors and timeouts")
legend("topright", legend=ipgroup, lty=1, col=c("black","blue","pink","green"), cex=.65)
for (i in 1:length(ipgroup)){
  newdata = subset(mydata, ip==ipgroup[i])
  lines(newdata$time, newdata$errors, type="o", pch=19, cex=.1, col=i)
}

png("timeouts-shard.png")
plot(plotdata$time, plotdata$timeouts, type="n",main=title,  xlab="time", ylab="errors and timeouts")
legend("topright", legend=ipgroup, lty=1, col=c("black","blue","pink","green"), cex=.65)
for (i in 1:length(ipgroup)){
  newdata = subset(mydata, ip==ipgroup[i])
  lines(newdata$time, newdata$timeouts, type="o", pch=19, cex=.1, col=i)
}





