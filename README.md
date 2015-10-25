# Getting-and-Cleaning-Data-Project1

Explanation of code in run_analysis.R file:

First created a folder in the working directory called 'ProjectData',
then downloaded the file from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
into this folder.

Next, unziped the file.
Unzipped files are in the folder named 'UCI HAR Dataset'.
List the files to become familiar with the data.

Read data from the files from 'test' and 'train' folders into the variables:

	* activityTestData, activityTrainData (from 'Y*.txt' files)
	* subjectTestData, subjectTrainData (from 'subject*.txt' files)
	* featuresTestData, featuresTrainData (from 'X*.txt' files)
	
Used str() to see and verify that data was correctly read.

##1. Merge the training and the test sets to create one data set:
Merged the rows from test and training sets using rbind() into the variables:

	* activityData
	* subjectData
	* featuresData
	
Set the names for columns "Activity" and "Subject".
Read the features names from file 'features.txt' and set the names for the rest of the columns.
Merged first the columns from subjectData and activityData using cbind(),
next merged the columns from features data with the above result using cbind().

##2. Extract only the measurements on the mean and standard deviation for each measurement:
Used grep() function to take only names of the features containing 'mean' or 'std'
and subset the data using subset() function on the above selected names.
 
##3. Use descriptive activity names to name the activities in the data set:
Read descriptive activity names from file 'activity_labels.txt' into activityNames variable
and assigned to Activity:
"WALKING" for 1, "WALKING_UPSTAIRS" for 2, etc.

##4. Appropriately label the data set with descriptive variable names:
Using function gsub() labeled names of features using descriptive variable names by replacing 
"t" with "time", 
"f" with "frequency", 
"Acc" with "Accelerometer", 
"Gyro" with "Gyroscope", 
"Mag" with "Magnitude", 
"BodyBody" with "Body".

##5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject:
Use agregate() function to calculate the average (mean) and saved the result into variable subData2.
Next, ordered subData2 and used write.table to save the data to a file called 'tidy_data.txt'.

###'tidy_data.txt' can be opened in notepad and can be observed that it meats the tidy data principle:
each variable is in one column, each different observation of that variable is in a different row.






