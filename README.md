# README

`CodeBook.rmd` describes the variables, the data, and any transformations or work that was performed to clean up the data present in the codebook.

`run_analysis.R` contains all the code to perform the analyses described in the 5 steps in the codebook. It can be run in RStudio along with the data present in the same folder, un-compressed and without names altered.

### The outline of analysis performed is to: 

1.  Merge the training and the test sets to create one data set.
2.  Extract only the measurements on the mean and standard deviation for each measurement.
3.  Use descriptive activity names to name the activities in the data set
4.  Appropriately label the data set with descriptive variable names
5.  From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

#### `tidy.txt` is the output of the final step.
