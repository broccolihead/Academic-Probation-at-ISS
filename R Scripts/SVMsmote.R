#Support vector machine using K fold validation
library("klaR")
library("caret")
#install.packages("DMwR")
library("DMwR")
library("e1071")

#Loading the data
train1 <-read.csv("D:/Aiman US/OneDrive - University of Arizona/acads/Capstone/R/bucketlabeled.csv")

#Labels and attributes
x1=train1[2:6]
y1=train1$PROBATIONFLAG

#To solve the class imbalance problem we use smote function 
newData <- SMOTE(PROBATIONFLAG ~ ., train1, perc.over = 400,perc.under=100)
table(newData$PROBATIONFLAG)

#Labels and attributes of the new smoted data
x1=newData[2:6]
y1=newData$PROBATIONFLAG

#model using train function where the algorithm specified is support vector machine
model = train(x1,y1,'svmLinear',trControl=trainControl(method='cv',number=10))

#Using confusion matrix to calculate precision and recall
result <- confusionMatrix(model)
result1 <- result$table

#Precision
result1[2,2]/(result1[2,2]+result1[2,1])

#Recall
result1[2,2]/(result1[2,2]+result1[1,2])
