library(e1071)

train <-read.csv("D:/Aiman US/OneDrive - University of Arizona/acads/Capstone/R/bucket.csv")

#Estimating naive Bayes model for 2 predictors
classifier <- naiveBayes(PROBATION ~ EMERGENCYFLAG + CREDITS,train)
classifier

#Using estimated model to calculate conditional probability
test <- data.frame(EMERGENCYFLAG=c(1),CREDITS=c(5))
test$EMERGENCYFLAG <- factor(test$EMERGENCYFLAG, levels=c(0,1))
test$CREDITS <- factor(test$CREDITS, levels=c(1,2,3,4,5))
test

test <- data.frame(EMERGENCYFLAG=c(1),CREDITS=c(5))

#feed our data to our classifier object
prediction <- predict(classifier, test ,type="raw")
prediction
