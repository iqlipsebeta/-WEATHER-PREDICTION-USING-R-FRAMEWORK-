wdata<-read.csv("C:\\Users\\user\\Desktop\\spm\\VW.csv")
View(wdata)

ts.data=ts(wdata$average,frequency=4,start=c(1988,1))
plot(ts.data)
dim(as.matrix(ts.data))

data.train=window(ts.data,start=c(1988,1),end=c(2010,1))
plot(data.train)
dim(as.matrix(data.train))
data.test=window(ts.data,start=c(2011,1))
plot(data.test)
dim(as.matrix(data.test))

library(forecast)
arima1=auto.arima(data.train,trace=TRUE,test="kpss", ic="bic")
summary(arima1)
confint(arima1)

library(tseries)
jarque.bera.test(arima1$residuals)

arima1.forecast=forecast(arima1,h=27)
arima1.forecast
plot(arima1.forecast,xlab="Years",ylab="Temperature")

library(TSPred)
plotarimapred(data.test,arima1,xlim=c(2009,2012),range.percent=0.05)
accuracy(arima1.forecast,data.test)

