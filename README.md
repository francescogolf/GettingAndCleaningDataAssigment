# GettingAndCleaningDataAssigment
Repository for Getting and Cleaning Data Assigment on Coursera

The Run_analysis.R script:
* Merges the training and the test sets to create one data set.  
After loading those into tables, the merging is done by rbind (logical table "union").  
After row binding and using the names() function to rename datasets, data are combined by cbind to have in the same dataset subjects and activities and features.

* Extracts only the measurements on the mean and standard deviation for each measurement.  
This is done by looking for features that contain the words "mean" or "std" (function grep)

* Uses descriptive activity names to name the activities in the data set  
  * ^t : Time
  * ^f : Frequency
  * Acc : Accelerometer
  * Gyro : Gryroscope
  * Mag : Magnitude
  * BodyBody : Body


* Appropriately labels the data set with descriptive variable names.


* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
Done aggregating by mean, it's called "tidy_dataset.txt".

