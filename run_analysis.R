## this R script assumes that you have downloaded and unzipped the data from the following link to your working directory: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## read in the test data along with variable labels for the test data and subject, which tells us which person each row corresponds to
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## read in the train data along with variable labels for the test data and subject, which tells us which person each row corresponds to
trainSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## read in the variable names data
features <- read.table("./UCI HAR Dataset/features.txt")

## extract the variable names into a vector called varNames
varNames <- features[, 2]
## make sure every name is syntactically valid, has no periods, and is all lowercase
varNamesValid <- make.names(varNames)
varNamesValid2 <- gsub("\\.", "", varNamesValid)
varNamesValid3 <- tolower(varNamesValid2)

## assign the variable names to the test and train data sets
names(testSet) <- varNamesValid3
names(trainSet) <- varNamesValid3

## attach subject, and test variables and variable names to test data, place the combined data in data frame "a"
a <- cbind(testSubject, testLabels, testSet)
colnames(a)[1:2] <- c("subject", "test")

## attach subject, partition, and test variables and variable names to train data, place the combined data in data frame "b"
b <- cbind(trainSubject, trainLabels, trainSet)
colnames(b)[1:2] <- c("subject", "test")

## combine test and train into one data set
combined <- rbind(a, b)
## subset the data frame with only mean and std measurements while keeping the first three id columns
subset <- combined[, c(1:2, grep("mean|std",names(combined)))]

## note that only 79 columns will be returned if we are case sensitive or if we do not choose 'ignore.case = TRUE' when we call the grep fucntion. this subset should actually return 86 columns, not 79 --in addition to the 2 or three that we add

## read the activity labels
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activityLabels) <- c("index", "activity")

## use descriptive names to names the activities in the data set
subset$activity = activityLabels[subset$test, 2]
## reorder columns
subset <- subset[c(1, 89, 3:88)]

library(reshape2)
dataMelt <- melt(subset, id=c("subject","activity"), na.rm=TRUE)
meanData <- dcast(dataMelt, subject + activity ~ variable, mean)
write.table(meanData, file = "GCD_Course_Project_Tidy_Data_bmca.txt", row.names = FALSE)
