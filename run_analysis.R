## Download the file and put the file in the ProjectData folder.

if (!file.exists("./ProjectData)")){dir.create("./ProjectData")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile="./ProjectData/Dataset.zip")


## Unzip the file.

unzip (zipfile="./ProjectData/Dataset.zip", exdir ="./ProjectData")


## Unzipped files are in the folder named UCI HAR Dataset. List the files.

filesPath <- file.path("./ProjectData", "UCI HAR Dataset")
files <- list.files(filesPath, recursive = TRUE)
files

## Read data from the files into the variables

activityTestData <- read.table(file.path(filesPath, "test", "Y_test.txt"), header = FALSE)
str(activityTestData)
activityTrainData <- read.table(file.path(filesPath, "train", "Y_train.txt"), header = FALSE)
str(activityTrainData)

subjectTestData <- read.table(file.path(filesPath, "test", "subject_test.txt"), header = FALSE)
str(subjectTestData)
subjectTrainData <- read.table(file.path(filesPath, "train", "subject_train.txt"), header = FALSE)
str(subjectTrainData)

featuresTestData <- read.table(file.path(filesPath, "test", "X_test.txt"), header = FALSE)
str(featuresTestData)
featuresTrainData <- read.table(file.path(filesPath, "train", "X_train.txt"), header = FALSE)
str(featuresTrainData)


## Merge the test and training sets

activityData <- rbind (activityTestData, activityTrainData)
str(activityData)
subjectData <- rbind (subjectTestData, subjectTrainData)
str(subjectData)
featuresData <- rbind (featuresTestData, featuresTrainData)
str(featuresData)


## Set names

names(activityData) <- c("Activity")
str(activityData)
names(subjectData) <- c("Subject")
str(subjectData)
featuresNames <- read.table(file.path(filesPath, "features.txt"), header = FALSE)
str(featuresNames)
names(featuresData) <- featuresNames$V2
str(featuresData)


## Merge columns

subject_and_activity_Data <- cbind(subjectData, activityData)
str(subject_and_activity_Data)
allData <-cbind(featuresData, subject_and_activity_Data)
tail(allData)


## Take only names of features with "mean()" or "std()"

subFeaturesNames <-featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]


## Subset the data

selectedNames <- c(as.character(subFeaturesNames), "Subject", "Activity")
subData1 <- subset(allData, select=selectedNames)
str(subData1)
head(subData1,50)


## Read descriptive activity names and assigned to Activity

activityNames <- read.table(file.path(filesPath, "activity_labels.txt"), header = FALSE)
activityNames
subData1$Activity[subData1$Activity==1] <-"WALKING"
subData1$Activity[subData1$Activity==2] <-"WALKING_UPSTAIRS"
subData1$Activity[subData1$Activity==3] <-"WALKING_DOWNSTAIRS"
subData1$Activity[subData1$Activity==4] <-"SITTING"
subData1$Activity[subData1$Activity==5] <-"STANDING"
subData1$Activity[subData1$Activity==6] <-"LAYING"
head(subData1$Activity,50)


## Label names of features usig descriptive variable names

names(subData1) <- gsub("^t", "time", names(subData1))
names(subData1) <- gsub("^f", "frequency", names(subData1))
names(subData1) <- gsub("Acc", "Accelerometer", names(subData1))
names(subData1) <- gsub("Gyro", "Gyroscope", names(subData1))
names(subData1) <- gsub("Mag", "Magnitude", names(subData1))
names(subData1) <- gsub("BodyBody", "Body", names(subData1))
names(subData1)


## Create tidy data and output it to a txt file
library(plyr)
subData2 <- aggregate(.~Subject+Activity, subData1, mean)
str(subData2)
subData2 <- subData2[order(subData2$Subject, subData2$Activity),]
write.table(subData2, file = "tidy_data.txt", row.name=FALSE)

