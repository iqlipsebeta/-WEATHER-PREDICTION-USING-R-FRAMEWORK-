library(caret)
library(randomForest)
data = read.csv("C:/Users/DELL/Desktop/weather/VWP.csv")
#view(data)
head(data)

data$V1 <- ifelse(data$V1 == 1, 'Increasing ','Decreasing')

data$V1<- as.factor(data$V1)


table(data$V1)


set.seed(25)
#Sampling 75% of the data
samp  <- sample(nrow(data),0.75* nrow(data))
train <- data[samp, ]
test  <- data[-samp, ]

#library(randomForest)
model <- randomForest(V1 ~ . - V1, data = train)
model
varImpPlot(model,sort=T)

pred <- predict(model, newdata = test)
table(pred, test$V1)
confusionMatrix(pred,test$V1)

#plot(model)
