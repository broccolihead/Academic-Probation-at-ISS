library(e1071)

train <-read.csv("D:/Aiman US/OneDrive - University of Arizona/acads/Capstone/R/bucket.csv")


#Estimating naive Bayes model for 2 predictors
classifier <- naiveBayes(PROBATION ~ EVENT_COUNT + CHECKIN_COUNT,train)
classifier

#Using estimated model to calculate conditional probability
test <- data.frame(EVENT_COUNT=c(1),CHECKIN_COUNT=c(1))
test$EVENT_COUNT <- factor(test$EVENT_COUNT, levels=c(0,1,2,3,4,5,6,7))
test$CHECKIN_COUNT <- factor(test$CHECKIN_COUNT, levels=c(1,2,3,4,5))
test

#Using estimated model to calculate conditional probability for 2
test <- data.frame(EVENT_COUNT=c(1),CHECKIN_COUNT=c(1))

#feed our data to our classifier object
prediction <- predict(classifier, test ,type="raw")
prediction
