
library(plyr) 
 
# Merging the training and test sets to create one data set 

x_training <- read.table("train/X_train.txt") 
y_training <- read.table("train/y_train.txt") 
subject_training <- read.table("train/subject_train.txt") 
 
 
x_test <- read.table("test/X_test.txt") 
y_test <- read.table("test/y_test.txt") 
subject_test <- read.table("test/subject_test.txt") 

 
# create 'x' data set 
x_dataset <- rbind(x_training, x_test) 

 
# create 'y' data set 
y_dataset <- rbind(y_training, y_test) 
 
 
# create 'subject' data set 
subject_dataset <- rbind(subject_training, subject_test) 

 

# Extracting only the measurements on the mean and standard deviation for each measurement 
 
 
features <- read.table("features.txt") 

 
# get only columns with mean() or std() in their names 
mean_std <- grep("-(mean|std)\\(\\)", features[, 2]) 
 
 
# subset the desired columns 
x_dataset <- x_dataset[, mean_std] 
 
 
# correct the column names 
names(x_dataset) <- features[mean_std, 2] 

 

# Use descriptive activity names to name the activities in the data set 
 
 
activities <- read.table("activity_labels.txt") 

 
# update values with correct activity names 
y_dataset[, 1] <- activities[y_dataset[, 1], 2] 

 
# correct column name 
names(y_dataset) <- "activity" 
 
 
 
# Appropriately label the data set with descriptive variable names 

 
# correct column name 
names(subject_dataset) <- "subject" 

# bind all the data in a single data set 
all_dataset <- cbind(x_dataset, y_dataset, subject_dataset) 

 
# Create a independent tidy data set with the average of each variable for each activity and each subject

averages_dataset <- ddply(all_dataset, .(subject, activity), numcolwise(mean)) 
 
 
write.table(averages_dataset, "averages_dataset.txt", row.name=FALSE) 