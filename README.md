GCD-Course-Project
==================

Course Project for Getting and Cleaning Data
Ben McAllister

## The assignment output: tidy data set.
In this repo, the file "GCD_Course_Project_Tidy_Data_bmca.txt" contains a tidy dataset. This data set is tidy because every row contains one observation, and every column contains one variable. There are two identifying variables: "subject" and "activity" and 86 measurements. Each measurement is actually the average of all measurements captured for a given subject/activity combination in the [original study][2]. Furthermore, while the original study included over 500 variables, the means in this dataset are derived from a subset of the original variables (described below in Part 2). Despite the fact that these are all average values, I have used a very similar name as was used in the source data for the original measurements, for brevity's sake. Other wise, I might have added a prefix of 
"meanof" to each variable name.

When reading this file, be aware that it contains a header, so please pass the header=TRUE argument when using read.table. 
   

## The run_analysis.R script
This script manipulates some data which was downloaded from [this link][1], as provided by the class assignment. The original source (see citation) of the data can be found at [this site][2].

The script assumes that you have downloaded and unzipped the data referenced above into your working directory.

### PART 1: Merge the training and the test sets to create one data set

The first step in the script is reading in: 
* the 'test' data set ("X_test.txt")
* the 'test' subject (person) associated with each observation/row ("subject_test.txt"). 
* the activity corresponding to each row in the 'test' data ("y_test.txt")

The corresponding data for the 'train' data set is then read. 

Subjects (people) are represented by integers from 1-30 and activities are represented as integers from 1-6. (Later in the analysis, the activity integers will be substituted with descriptive strings such as "WALKING" and "SITTING".)

The script obtains variable names for the measured data from "features.txt". These variable names are processed with the the make.names() function to ensure they are all syntactically valid in R. Then all periods are removed from the names and they are converted to all lowercase, as instructed in week 4 lectures of the Getting and Cleaning Data lectures. The variable names are then assigned to each set of measured data (testSet and trainSet). 

Subject and activity code variables are then joined to the measured data using cbind() for both the test and training data sets. After adding these variables, the two data sets are joined using rbind(). rbind is the appropriate choice here because all rows represent unique person/activity observations and all variable names are consistent between the two data sets. 

### PART 2: Extract only the measurements on the mean and standard deviation for each measurement. 
I assumed that any variable containing the letters "std" or "mean" should be included in this subset of variables. Note that if you do not convert the variables to lowercase and if you perform the default grep() function, in which ignore.case="FALSE", you might end up with a 79 variable subset. Because I changed all variables to lowercase, this returns an additional 7 variables, for a total of 86. The extra seven variables are (represented before being converted to lowercase): 
> "angletBodyAccMeangravity"          
> "angletBodyAccJerkMeangravityMean" 
> "angletBodyGyroMeangravityMean"     
> "angletBodyGyroJerkMeangravityMean"
> "angleXgravityMean"                 
> "angleYgravityMean"                
> "angleZgravityMean"                

### PART 3: Use descriptive activity names to name the activities in the data set. 
Descriptive activity names were substituted by creating a new variable called "activity", which referenced the "activity_labels.txt" file to return one of six human-readable activities ("WALKING", WALKING_UPSTAIRS", etc.)

### PART 4: Appropriately label the data set with descriptive variable names
This step was described in step one, above. I made the assumption that the original variable names, as provided by the original source were sufficiently descriptive. For more detail on the variable names, see "features_info.txt", which is included in the original data set. 

### PART 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.



[1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "linked data"
[2]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones    "original data source"

Citation for data source: 
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012