data<- read.csv("~/Documents/Wildcat/capstone/iss_prediction.csv")
data$academic_status <- ifelse(data$PROBATION == 0, "good academic standing","on probation")
head(data)
library(caret)
library(caTools)
library(arm)
set.seed(100)
split <- sample.split(data$PROBATION, SplitRatio = 0.70)
trainingdata <- subset(data,split == TRUE)
testingdata <- subset(data, split == FALSE)

model <- bayesglm(PROBATION ~ TERM + EVENT_COUNT+CHECKIN_COUNT+ CREDITS, family = binomial(logit), data = trainingdata)

summary(model)

prediction <- predict(model, newdata = testingdata)
prediction <- predict(model, type = "response")
prediction[1:5]
table(trainingdata$PROBATION, prediction > 0.5)

library(ROCR)
ROCRpred <- prediction(prediction, trainingdata$PROBATION)

ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2,1.7))


