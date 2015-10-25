# Code Book

##Initial data:

Data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Actions on the data:

1.Downloaded and unziped the file.

2.Read data from the files from 'test' and 'train' folders into the variables:

	activityTestData, activityTrainData (from 'Y*.txt' files)
	subjectTestData, subjectTrainData (from 'subject*.txt' files)
	featuresTestData, featuresTrainData (from 'X*.txt' files)

3.Merged the rows from test and training sets into the variables:

	activityData
	subjectData
	featuresData
	
4.Set the names for columns "Activity" and "Subject".
Read the features names from file 'features.txt' and set the names for the rest of the columns.

5.Merged first the columns from subjectData and activityData,
next merged the columns from featuresData with the previous merge result.

6.Took only names of the features containing 'mean' or 'std'
and subset the data of the above selected names into variable subData1.

7.Read descriptive activity names from file 'activity_labels.txt' into activityNames variable
and assigned to Activity: "WALKING" for 1, "WALKING_UPSTAIRS" for 2, etc.

8.Appropriately labeled the features with descriptive variable names by replacing 
"t" with "time", 
"f" with "frequency", 
"Acc" with "Accelerometer", 
"Gyro" with "Gyroscope", 
"Mag" with "Magnitude", 
"BodyBody" with "Body".

9.From the data set above, created a second, independent tidy data set 
with the average (mean) of each variable for each activity and each subject. 
Saved the result into variable subData2.

10.Ordered subData2 and used write.table to save the data to a file called 'tidy_data.txt'.


##Output file tidy_data.txt:

###Columns: 68 in total

####Identifiers Names

	Subject - the ID of the subject
	Activity - the type of activity performed: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"

####Measurements Names

	"timeBodyAccelerometer-mean()-X"
	"timeBodyAccelerometer-mean()-Y" 
	"timeBodyAccelerometer-mean()-Z" 
	"timeBodyAccelerometer-std()-X" 
	"timeBodyAccelerometer-std()-Y" 
	"timeBodyAccelerometer-std()-Z" 
	"timeGravityAccelerometer-mean()-X" 
	"timeGravityAccelerometer-mean()-Y" 
	"timeGravityAccelerometer-mean()-Z" 
	"timeGravityAccelerometer-std()-X" 
	"timeGravityAccelerometer-std()-Y" 
	"timeGravityAccelerometer-std()-Z" 
	"timeBodyAccelerometerJerk-mean()-X" 
	"timeBodyAccelerometerJerk-mean()-Y" 
	"timeBodyAccelerometerJerk-mean()-Z" 
	"timeBodyAccelerometerJerk-std()-X" 
	"timeBodyAccelerometerJerk-std()-Y" 
	"timeBodyAccelerometerJerk-std()-Z" 
	"timeBodyGyroscope-mean()-X" 
	"timeBodyGyroscope-mean()-Y" 
	"timeBodyGyroscope-mean()-Z" 
	"timeBodyGyroscope-std()-X" 
	"timeBodyGyroscope-std()-Y" 
	"timeBodyGyroscope-std()-Z" 
	"timeBodyGyroscopeJerk-mean()-X" 
	"timeBodyGyroscopeJerk-mean()-Y" 
	"timeBodyGyroscopeJerk-mean()-Z" 
	"timeBodyGyroscopeJerk-std()-X" 
	"timeBodyGyroscopeJerk-std()-Y" 
	"timeBodyGyroscopeJerk-std()-Z" 
	"timeBodyAccelerometerMagnitude-mean()" 
	"timeBodyAccelerometerMagnitude-std()" 
	"timeGravityAccelerometerMagnitude-mean()" 
	"timeGravityAccelerometerMagnitude-std()" 
	"timeBodyAccelerometerJerkMagnitude-mean()" 
	"timeBodyAccelerometerJerkMagnitude-std()" 
	"timeBodyGyroscopeMagnitude-mean()" 
	"timeBodyGyroscopeMagnitude-std()" 
	"timeBodyGyroscopeJerkMagnitude-mean()" 
	"timeBodyGyroscopeJerkMagnitude-std()" 
	"frequencyBodyAccelerometer-mean()-X" 
	"frequencyBodyAccelerometer-mean()-Y" 
	"frequencyBodyAccelerometer-mean()-Z" 
	"frequencyBodyAccelerometer-std()-X" 
	"frequencyBodyAccelerometer-std()-Y" 
	"frequencyBodyAccelerometer-std()-Z" 
	"frequencyBodyAccelerometerJerk-mean()-X" 
	"frequencyBodyAccelerometerJerk-mean()-Y" 
	"frequencyBodyAccelerometerJerk-mean()-Z" 
	"frequencyBodyAccelerometerJerk-std()-X" 
	"frequencyBodyAccelerometerJerk-std()-Y" 
	"frequencyBodyAccelerometerJerk-std()-Z" 
	"frequencyBodyGyroscope-mean()-X" 
	"frequencyBodyGyroscope-mean()-Y" 
	"frequencyBodyGyroscope-mean()-Z" 
	"frequencyBodyGyroscope-std()-X" 
	"frequencyBodyGyroscope-std()-Y" 
	"frequencyBodyGyroscope-std()-Z" 
	"frequencyBodyAccelerometerMagnitude-mean()" 
	"frequencyBodyAccelerometerMagnitude-std()" 
	"frequencyBodyAccelerometerJerkMagnitude-mean()" 
	"frequencyBodyAccelerometerJerkMagnitude-std()" 
	"frequencyBodyGyroscopeMagnitude-mean()" 
	"frequencyBodyGyroscopeMagnitude-std()" 
	"frequencyBodyGyroscopeJerkMagnitude-mean()" 
	"frequencyBodyGyroscopeJerkMagnitude-std()"

$$$Number of rows: 1 header + 180 observations