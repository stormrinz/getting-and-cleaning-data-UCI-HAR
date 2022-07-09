## Source data

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The source data are from the Human Activity Recognition Using Smartphones Data Set collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here is the data for the project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

# The data

[`run_analysis.R`](https://github.com/stormrinz/getting-and-cleaning-data-UCI-HAR/blob/main/run_analysis.R) contains several datasets along with the final datasets. These are:

1.  `activities`: contains activity labels with names
2.  `elements`: contains the file locations of unzipped folder
3.  `features`: contains feature (variable) names
4.  `FINALtidydataset`: contains final tidy dataset
5.  `MeanSDdataset`: contains the variables on the mean and standard deviations along with subjectID, activityID and activityNames
6.  `mergedDataset`: contains the merged testing and training datasets
7.  `testx` and `trainx`: contains testing and training datasets
8.  `testy` and `trainy`: contains testing and training labels
9.  `testsubject` and `trainsubject`: contains testing and training subjectID(s)
10. `MeanSDcolnames`: contains a boolean vector of names of variables on mean and standard deviations

# The transformation

File with R code [`run_analysis.R`](https://github.com/stormrinz/getting-and-cleaning-data-UCI-HAR/blob/main/run_analysis.R) performs the 5 following steps:

1.  Reading in the files and merging the training and the test sets to create one dataset.

2.  Extracting only the measurements on the mean and standard deviation for each measurement.

3.  Using descriptive activity names to name the activities in the data set.

4.  Appropriately labeling the data set with descriptive variable names.

5.  Creating a second, independent tidy data set with the average of each variable for each activity and each subject:\
    5.1 Making second tidy data set (`FINALtidyset`)\
    5.2 Writing second tidy data set in .txt file ([`tidy.txt`](https://github.com/stormrinz/getting-and-cleaning-data-UCI-HAR/blob/main/tidy.txt))

The code assumes all the data is present in the same folder, un-compressed and without names altered.
