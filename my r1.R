library(forecast)
x<- read.csv("C:\\Users\\user\\Desktop\\spm\\VWP.csv")

View(x)

print(is.ts(x$average))
x$average<-ts(x$average,start=c(1988,1),end=c(2013,4),frequency = 4)

xaverage<-diff(x$average)
plot(xaverage)

#xaverage_subset<-window(xaverage,start=c(2001,1),end=c(2012,4))

fit_diff_400<-Arima(xaverage,order=c(4,0,0))

plot(forecast(fit_diff_400,h=10))
plot(forecast(fit_diff_400,h=10),include=40)
accuracy(fit_diff_400)

#Linerar Reg

