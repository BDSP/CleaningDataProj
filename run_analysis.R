# Getting and Cleaning Data Course Project
# ========================================
# Xuan Kong
# Last modified on May 23, 2014

### Step 1 Read Feature Names from Original Source

# IMPORTANT: Make sure that the original data directory is unzipped to "UCI HAR Dataset" in current directory.
# 
# We first read feature names and determines the colums that correspond to mean and standard deviation for each measurement. They are identified if the feature name contains string mean() and std()

featureData <- read.table("UCI HAR Dataset/features.txt", sep = "", col.names = c("sqNo", "Name"))
meanFeatureCol <- grep("mean()", featureData$Name, fixed=TRUE)
stdFeatureCol <- grep("std()", featureData$Name, fixed=TRUE)

### Step 2 Read Descriptive Activity Labels from Original Source
# We next read the activity labels corresponding to the activity code from "activity_labels.txt" file
activityLabel <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Value","Label"))

### Step 3 Merge Test and Train Sets Read from Original Source 
# We then read the original data and merge the test and train sets together. Subject ID and activity type data are read first for test dataset, then the feature data are read with appropriate column names (feature names extracted earlier).  Data read are repeated for train dataset, and the results are merged (combined) with test dataset via rbind() function.  

subjData <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names = "SubjectID")
activityData <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "ActivityType")
testData <- read.table("UCI HAR Dataset/test/X_test.txt",col.names = featureData$Name)

subjData <- rbind(subjData, read.table("UCI HAR Dataset/train/subject_train.txt",col.names = "SubjectID"))
activityData <- rbind(activityData, read.table("UCI HAR Dataset/train/y_train.txt", col.names = "ActivityType"))
testData <- rbind(testData, read.table("UCI HAR Dataset/train/X_train.txt",col.names = featureData$Name))

# Finally, the activity type codes are replaced with descriptive activity names.  All data are then put into a data frame called allData.

activityData <- activityLabel$Label[activityData[,1]]
allData <- data.frame(subjData, ActivityType = activityData, testData)

### Step 4 Extract Mean and Standard Deviation Measurements
# Now allData contains a complete set of the data, including all features from both training and test datasets. Next we extract only the columns on the mean and standard deviation for each measurement. We utilize the column indices identified earlier for the mean and standard deviation features.

selectData <- data.frame(subjData, ActivityType = activityData, testData[,c(meanFeatureCol, stdFeatureCol)])


### Step 5 Create Tidy Dataset
# Next we create a tidy dataset with the average of each variable (means and standard deviations) for each activity type (six of them) and subject (1-30).
nColCnt = ncol(selectData)
newData <- aggregate(selectData[,3:nColCnt], by=list(selectData$ActivityType,selectData$SubjectID), FUN = "mean")
colnames(newData)[1:2] <- c("Activity.type","Subject.id")
colnames(newData) <- gsub("...",".",colnames(newData),fixed=TRUE)
colnames(newData) <- gsub("..","",colnames(newData),fixed=TRUE)

### Step 6 Output Tidy Dataset Into a Text File
# Finally we output the data into a text file to form an independent tidy data set for future analysis. The data contains column headers and is space delimited.
write.table(newData,"tidyData.txt",quote=TRUE,row.names = FALSE)

