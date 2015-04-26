library(dplyr)
library(reshape2)

run_analysis <- function() {
  # Load training data
  trainingPath <- file.path(".", "train", "X_train.txt")
  
  training <- read.table(trainingPath)
  
  #Load and apply feature names to training data
  featuresPath <- file.path(".", "features.txt")
  features <- read.table(featuresPath)
  
  colnames(training) <- features[,2]
  
  # Strip all columns from training data except for
  # standard deviation and mean of each measurement
  training <- training[,grep("mean|std", colnames(training))]
  
  # Load activities and subjects for training data then
  # merge them with the main data set
  trainingPathActivities <- file.path(".", "train", "y_train.txt")
  trainingPathSubjects <- file.path(".", "train", "subject_train.txt")
  
  trainingActivities <- read.table(trainingPathActivities)
  trainingSubjects <- read.table(trainingPathSubjects)
  
  training <- cbind(trainingActivities, trainingSubjects, training)
  
  # Name activity and subject columns for training data
  colnames(training)[1] <- "Activity.Name"
  colnames(training)[2] <- "Subject.ID"
  
  
  # Load test data
  testPath <- file.path(".", "test", "X_test.txt")
  
  test <- read.table(testPath)
  
  # Apply feature names to test data
  colnames(test) <- features[,2]
  
  # Strip columns from test data
  test <- test[,grep("mean|std", colnames(test))]
  
  # Load activities and subjects for test data then
  # merge them with the main data set
  testPathActivities <- file.path(".", "test", "y_test.txt")
  testPathSubjects <- file.path(".", "test", "subject_test.txt")
  
  testActivities <- read.table(testPathActivities)
  testSubjects <- read.table(testPathSubjects)
  
  test <- cbind(testActivities, testSubjects, test)
  
  # Name activity and subject columns for test data
  colnames(test)[1] <- "Activity.Name"
  colnames(test)[2] <- "Subject.ID"
  
  
  # Merge training and test data sets together
  data <- rbind(training, test)
  
  # Substitute activity numbers with names
  activityLabelsPath <- file.path(".", "activity_labels.txt")
  activityLabels <- read.table(activityLabelsPath)
  
  for (i in 1:nrow(data)) {
    data[i,1] <- activityLabels[data[i,1],2]
  }
  
  # Label data set with descriptive names
  colnames(data) <- gsub("[()]", "", colnames(data))
  colnames(data) <- gsub("[-]", ".", colnames(data))
  
  colnames(data) <- gsub("tBodyAcc", "T.Body.Acc", colnames(data))
  colnames(data) <- gsub("tGravityAcc", "T.Gravity.Acc", colnames(data))
  colnames(data) <- gsub("tBodyAccJerk", "T.Body.Acc.Jerk", colnames(data))
  colnames(data) <- gsub("tBodyGyro", "T.Body.Gyro", colnames(data))
  colnames(data) <- gsub("tBodyGyroJerk", "T.Body.Gyro.Jerk", colnames(data))
  colnames(data) <- gsub("tBodyAccMag", "T.Body.Acc.Mag", colnames(data))
  colnames(data) <- gsub("tGravityAccMag", "T.Gravity.Acc.Mag", colnames(data))
  colnames(data) <- gsub("tBodyAccJerkMag", "T.Body.Acc.Jerk.Mag", colnames(data))
  colnames(data) <- gsub("tBodyGyroMag", "T.Body.Gyro.Mag", colnames(data))
  colnames(data) <- gsub("tBodyGyroJerkMag", "T.Body.Gyro.Jerk.Mag", colnames(data))
  colnames(data) <- gsub("fBodyAcc", "F.Body.Acc", colnames(data))
  colnames(data) <- gsub("fBodyAccJerk", "F.Body.Acc.Jerk", colnames(data))
  colnames(data) <- gsub("fBodyGyro", "F.Body.Gyro", colnames(data))
  colnames(data) <- gsub("fBodyAccMag", "F.Body.Acc.Mag", colnames(data))
  colnames(data) <- gsub("fBodyAccJerkMag", "F.Body.Acc.Jerk.Mag", colnames(data))
  colnames(data) <- gsub("fBodyGyroMag", "F.Body.Gyro.Mag", colnames(data))
  colnames(data) <- gsub("fBodyGyroJerkMag", "F.Body.Gyro.Jerk.Mag", colnames(data))
  
  colnames(data) <- gsub("mean", "Mean", colnames(data))
  colnames(data) <- gsub("std", "Std.Dev", colnames(data))
  
  # Create data set containing average for each activity
  # and each subject (180 obs. total)
  meltedData <- melt(data, id=c("Activity.Name", "Subject.ID"))
  meltedData <- dcast(meltedData, Activity.Name + Subject.ID ~ variable,mean)
  
  write.table(meltedData, "./UCI-Clean-Data.txt", row.name=FALSE)
  return(meltedData)
}