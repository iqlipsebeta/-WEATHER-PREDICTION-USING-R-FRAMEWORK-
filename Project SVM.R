library(rpart)
library(e1071)
library(caret)
input = read.csv("C:\\Users\\user\\Desktop\\spm\\VW.csv")

practice = sample(2,nrow(input),replace=TRUE, prob=c(0.7,0.3))
train = input[practice==1,]
test = input[practice==2,]
fit = svm(average~., data=train)
plot(input)
plot(fit)
summary(fit)

pdata = predict(fit, test)

###Confusion Matrix
confMat = table(pdata = as.numeric(pdata>.5), reference=test$average)
confMat


#Accuracy
accuracy = sum(diag(confMat))/sum(confMat)
accuracy

