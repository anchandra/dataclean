Read datasets (test\X_test.txt, test\y_test.txt, test\subject_test.txt) in (x_test,y_test,subject_test) variables

Read datasets (test\X_train.txt, test\y_train.txt, test\subject_train.txt) in (x_training,y_training,subject_training) variables

Merge x_test and x_training to create x_dataset

Merge y_test and y_training to create y_dataset

Merge subject_test and subject_training to create subject_dataset

Extract only the measurements using features.txt the mean and standard deviation for each measurement by selecting variables which names contain "mean" or "std".

subset the desired columns and correct the column names in x_dataset

subset the desired columns and correct the column names in y_dataset (activity label was replaced with corresponding activity name from activity_labels.txt)

subset the desired columns and correct the column names in subject_dataset

bind all the data in a single data set in all_dataset
Create a independent tidy data set with the average of each variable for each activity and each subject in averages_dataset

Write the data to averages_dataset.txt
