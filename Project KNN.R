library(caret)

data_df=read.csv("C:\\Users\\user\\Desktop\\spm\\VWP.csv")
data_df
str(data_df)

set.seed(3034)
intrain <- createDataPartition(y = data_df$average, p= 0.5, list = FALSE)
training <- data_df[intrain,]
testing <- data_df[-intrain,]

dim(training); dim(testing);

anyNA(data_df)
summary(data_df)
training[["average"]] = factor(training[["average"]])

trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3333)
knn_fit <- train(average ~., data = training, method = "knn",
                 trControl=trctrl,
                 preProcess = c("center", "scale"),
                 tuneLength = 10)
knn_fit
plot(knn_fit)

test_pred <- predict(knn_fit, newdata = average)
test_pred

confusionMatrix(test_pred, testing$average )

