install.packages("nnet")
library (nnet)

# check out some of the options available in nnet package
?nnet

#Load the data
student <-read.csv("D:/Aiman US/OneDrive - University of Arizona/acads/Capstone/R/bucket.csv")

# fit model using four hidden nodes
t.nnet <- nnet(formula = PROBATION ~ TERM + CREDITS + EVENT_COUNT + CHECKIN_COUNT +  EMERGENCYFLAG, #choose predictors
               data =train, # select our training data
               size = 15) # select size of hidden layer (traila and error, best bet 15)

# We then have to apply the trained network to the test data
tNN.pred <- predict(t.nnet, test, type='prob')

evaluation.NN <- data.frame(actual = test$PROBATION, predicted = tNN.pred) 
tail(evaluation.NN)
#evaluation.NN = na.omit(evaluation.NN)

# create a "correct" column
evaluation.NN$correct <- ifelse(evaluation.NN$actual == evaluation.NN$predicted,1,0)

# We then calculate simple accuracy of our prediction model
sum(evaluation.NN$correct)/nrow(evaluation.NN) 

