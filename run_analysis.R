

require(plyr)

data_dir <- "Dataset"
feature_file <- paste(data_dir, "/features.txt", sep = "")
activity_labels_file <- paste(data_dir, "/activity_labels.txt", sep = "")
x_train_file <- paste(data_dir, "/train/X_train.txt", sep = "")
y_train_file <- paste(data_dir, "/train/y_train.txt", sep = "")
subject_train_file <- paste(data_dir, "/train/subject_train.txt", sep = "")
x_test_file  <- paste(data_dir, "/test/X_test.txt", sep = "")
y_test_file  <- paste(data_dir, "/test/y_test.txt", sep = "")
subject_test_file <- paste(data_dir, "/test/subject_test.txt", sep = "")

features <- read.table(feature_file, colClasses = c("character"))
activity_labels <- read.table(activity_labels_file, col.names = c("ActivityId", "Activity"))
x_train <- read.table(x_train_file)
y_train <- read.table(y_train_file)
subject_train <- read.table(subject_train_file)
x_test <- read.table(x_test_file)
y_test <- read.table(y_test_file)
subject_test <- read.table(subject_test_file)

dataSubject <- rbind(subject_train, subject_test)
dataActivity<- rbind(y_train, y_test)
dataFeatures<- rbind(x_train, x_test)

names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
names(dataFeatures)<- features$V2

dataCombine <- cbind(dataSubject, dataActivity)
Complete_dataset <- cbind(dataFeatures, dataCombine)


subdataFeaturesNames<-features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
mean_std_dataset<-subset(Complete_dataset,select=selectedNames)

names(mean_std_dataset)<-gsub("^t", "time", names(mean_std_dataset))
names(mean_std_dataset)<-gsub("^f", "frequency", names(mean_std_dataset))
names(mean_std_dataset)<-gsub("Acc", "Accelerometer", names(mean_std_dataset))
names(mean_std_dataset)<-gsub("Gyro", "Gyroscope", names(mean_std_dataset))
names(mean_std_dataset)<-gsub("Mag", "Magnitude", names(mean_std_dataset))
names(mean_std_dataset)<-gsub("BodyBody", "Body", names(mean_std_dataset))

tidy_dataset<-aggregate(. ~subject + activity, mean_std_dataset, mean)
tidy_dataset<-tidy_dataset[order(tidy_dataset$subject,tidy_dataset$activity),]
write.table(tidy_dataset, file = "tidy_dataset.txt",row.name=FALSE)

