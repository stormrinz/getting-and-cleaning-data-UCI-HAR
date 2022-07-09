download.file(
      'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
      paste0(getwd(), "/week4dataset")
)
elements <- unzip('week4dataset', list = T)
elements <- elements[c(1, 2, 16, 17, 18, 30, 31, 32),]

library(tidyverse)

######################################################################
# 1: Merges the training and the test sets to create one data set
######################################################################

#extracting features
features <-
      read.table('UCI HAR Dataset/features.txt', row.names = 1)
dim(features)

#extracting activities
activities <- read.table('UCI HAR Dataset/activity_labels.txt')
colnames(activities) <- c("activityID", "activityType")

#extracting testing dataset
testx <- read.table('UCI HAR Dataset/test/X_test.txt')
testy <- read.table('UCI HAR Dataset/test/y_test.txt')
testsubject <- read.table('UCI HAR Dataset/test/subject_test.txt')

#extracting training dataset
trainx <- read.table('UCI HAR Dataset/train/X_train.txt')
trainy <- read.table('UCI HAR Dataset/train/y_train.txt')
trainsubject <-
      read.table('UCI HAR Dataset/train/subject_train.txt')

#renaming columns of sets, activity labels and subject labels
colnames(trainx) <- features[, 1]
colnames(testx) <- features[, 1]

colnames(testy) <- "activityID"
colnames(trainy) <- "activityID"

colnames(testsubject) <- "subjectID"
colnames(trainsubject) <- "subjectID"

#merging datasets
testdataset <- cbind(testsubject, testy, testx)
traindataset <- cbind(trainsubject, trainy, trainx)

mergedDataset <- rbind(traindataset, testdataset)

mergedDataset

######################################################################
# 2: Extracts only the measurements on the mean
#    and standard deviation for each measurement
######################################################################

#extracting column names
MeanSDcolnames <-
      grepl('.*mean.*|.*std.*', colnames(mergedDataset), ignore.case = T)

#extracting columns
MeanSDdataset <-
      select(mergedDataset, c("subjectID", "activityID", colnames(mergedDataset)[MeanSDcolnames]))

MeanSDdataset

######################################################################
# 3: Uses descriptive activity names
#    to name the activities in the data set
######################################################################

#adding activity names column corresponding with activity labels
MeanSDdataset$activityNames <-
      factor(MeanSDdataset$activityID, labels = activities[, 2])

MeanSDdataset <- MeanSDdataset %>% relocate(activityNames, .after = activityID)

MeanSDdataset

######################################################################
# 4: Appropriately labels the data set with descriptive variable names
######################################################################

names(MeanSDdataset)<-gsub("Acc", "Accelerometer", names(MeanSDdataset))
names(MeanSDdataset)<-gsub("Gyro", "Gyroscope", names(MeanSDdataset))
names(MeanSDdataset)<-gsub("BodyBody", "Body", names(MeanSDdataset))
names(MeanSDdataset)<-gsub("Mag", "Magnitude", names(MeanSDdataset))
names(MeanSDdataset)<-gsub("^t", "Time", names(MeanSDdataset))
names(MeanSDdataset)<-gsub("^f", "Frequency", names(MeanSDdataset))
names(MeanSDdataset)<-gsub("tBody", "TimeBody", names(MeanSDdataset))
names(MeanSDdataset)<-gsub("-mean()", "Mean", names(MeanSDdataset), ignore.case = TRUE)
names(MeanSDdataset)<-gsub("-std()", "STD", names(MeanSDdataset), ignore.case = TRUE)
names(MeanSDdataset)<-gsub("-freq()", "Frequency", names(MeanSDdataset), ignore.case = TRUE)
names(MeanSDdataset)<-gsub("angle", "Angle", names(MeanSDdataset))
names(MeanSDdataset)<-gsub("gravity", "Gravity", names(MeanSDdataset))

MeanSDdataset

######################################################################
# 5: From the data set in step 4, creates a second, 
#    independent tidy data set with the average of each variable 
#    for each activity and each subject.
######################################################################

#creating final tidy dataset
FINALtidyset <- MeanSDdataset %>% group_by(subjectID, activityID) %>% summarise(across(.cols = -activityNames,.fns = mean))

FINALtidyset

#writing final tidy dataset into tidy.txt
write.table(FINALtidyset, file = "tidy.txt", row.names = F)                                                                
