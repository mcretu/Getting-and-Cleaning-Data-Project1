# Getting-and-Cleaning-Data-Project1

In the code in the run_analysis.R file: 

First create a folder in the working directory called ProjectData,
then download the file from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
into this folder.

Next, unzip the file.
Unzipped files are in the folder named UCI HAR Dataset.
List the files to become familiar with the data.

Read data from the files from 'test' and 'train' folders into the variables:
*activityTestData, activityTrainData (from 'Y*.txt' files)
*subjectTestData, subjectTrainData (from 'subject*.txt' files)
*featuresTestData, featuresTrainData (from 'X*.txt' files)
Use str() to see and verify that data was correctly read.

#1. Merge the training and the test sets to create one data set:
Merge the rows from test and training sets using rbind() into the variables:
*activityData
*subjectData
*featuresData
Set the names for columns "Activity" and "Subject"
Read the features names from file 'features.txt' and set the names for the rest of the columns.
Merge first the columns from subjectData and activityData using cbind()
next merge the features data with the above result using cbind()

#2. Extracts only the measurements on the mean and standard deviation for each measurement:
Use grep() function to take only names of the features containing 'mean' or 'std'
and subset the data using subset() function on the above selected names.
 
#3. Uses descriptive activity names to name the activities in the data set:
Read descriptive activity names from file 'activity_labels.txt' into activityNames variable
and assign to Activity:
'WALKING' for 1, 'WALKING_UPSTAIRS" for 2, etc.

#4. Appropriately labels the data set with descriptive variable names:
Using function gsub() label names of features using descriptive variable names by replacing 
't' with 'time',
'f' with 'frequency'
'Acc' with 'Accelerometer'
'Gyro' with 'Gyroscope'
'Mag' with 'Magnitude'
'BodyBody' with 'Body'

#5. From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject:
Use agregate() function to calculate the average (mean) and saved the result into variable subData2.
Next order subData2 and use write.table to save the data to a file called 'tidy_data.txt'

'tidy_data.txt' can be opened in notepad and can be observed that it meats 
the tidy data principle:
Each variable is in one column, each different observation of that variable is in a different row.






