# Code Book for Course Project #

## Overview
The Run_analysis.R script:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables

* data_dir - string referring the directory where data is saved
* All the variables ending in "file" - string referring to the file names
* All the variables with the same name as the source files (eg: x_train) contain the tables extracted from the files
* dataSubject: union between subject's train and test data
* dataActivity: union betwrrn activities' (y) train and test data
* dataFeatures: union betwrrn activities' (x) train and test data
* dataCombine: column bind between datasubject and activity
* Complete_dataset: the dataset with everything before united
* mean_std_dataset: the dataset with only mean and standard deviation
* tidy_dataset: the aggregated file for the outout


## Output

* tidy_dataset.txt
