

## Variables in this data set
The following are the variable names included in the tidy data set "GCD_Course_Project_Tidy_Data_bmca.txt"

 [1] "subject"                           "activity"                         
 [3] "tbodyaccmeanx"                     "tbodyaccmeany"                    
 [5] "tbodyaccmeanz"                     "tbodyaccstdx"                     
 [7] "tbodyaccstdy"                      "tbodyaccstdz"                     
 [9] "tgravityaccmeanx"                  "tgravityaccmeany"                 
[11] "tgravityaccmeanz"                  "tgravityaccstdx"                  
[13] "tgravityaccstdy"                   "tgravityaccstdz"                  
[15] "tbodyaccjerkmeanx"                 "tbodyaccjerkmeany"                
[17] "tbodyaccjerkmeanz"                 "tbodyaccjerkstdx"                 
[19] "tbodyaccjerkstdy"                  "tbodyaccjerkstdz"                 
[21] "tbodygyromeanx"                    "tbodygyromeany"                   
[23] "tbodygyromeanz"                    "tbodygyrostdx"                    
[25] "tbodygyrostdy"                     "tbodygyrostdz"                    
[27] "tbodygyrojerkmeanx"                "tbodygyrojerkmeany"               
[29] "tbodygyrojerkmeanz"                "tbodygyrojerkstdx"                
[31] "tbodygyrojerkstdy"                 "tbodygyrojerkstdz"                
[33] "tbodyaccmagmean"                   "tbodyaccmagstd"                   
[35] "tgravityaccmagmean"                "tgravityaccmagstd"                
[37] "tbodyaccjerkmagmean"               "tbodyaccjerkmagstd"               
[39] "tbodygyromagmean"                  "tbodygyromagstd"                  
[41] "tbodygyrojerkmagmean"              "tbodygyrojerkmagstd"              
[43] "fbodyaccmeanx"                     "fbodyaccmeany"                    
[45] "fbodyaccmeanz"                     "fbodyaccstdx"                     
[47] "fbodyaccstdy"                      "fbodyaccstdz"                     
[49] "fbodyaccmeanfreqx"                 "fbodyaccmeanfreqy"                
[51] "fbodyaccmeanfreqz"                 "fbodyaccjerkmeanx"                
[53] "fbodyaccjerkmeany"                 "fbodyaccjerkmeanz"                
[55] "fbodyaccjerkstdx"                  "fbodyaccjerkstdy"                 
[57] "fbodyaccjerkstdz"                  "fbodyaccjerkmeanfreqx"            
[59] "fbodyaccjerkmeanfreqy"             "fbodyaccjerkmeanfreqz"            
[61] "fbodygyromeanx"                    "fbodygyromeany"                   
[63] "fbodygyromeanz"                    "fbodygyrostdx"                    
[65] "fbodygyrostdy"                     "fbodygyrostdz"                    
[67] "fbodygyromeanfreqx"                "fbodygyromeanfreqy"               
[69] "fbodygyromeanfreqz"                "fbodyaccmagmean"                  
[71] "fbodyaccmagstd"                    "fbodyaccmagmeanfreq"              
[73] "fbodybodyaccjerkmagmean"           "fbodybodyaccjerkmagstd"           
[75] "fbodybodyaccjerkmagmeanfreq"       "fbodybodygyromagmean"             
[77] "fbodybodygyromagstd"               "fbodybodygyromagmeanfreq"         
[79] "fbodybodygyrojerkmagmean"          "fbodybodygyrojerkmagstd"          
[81] "fbodybodygyrojerkmagmeanfreq"      "angletbodyaccmeangravity"         
[83] "angletbodyaccjerkmeangravitymean"  "angletbodygyromeangravitymean"    
[85] "angletbodygyrojerkmeangravitymean" "anglexgravitymean"                
[87] "angleygravitymean"                 "anglezgravitymean"

## Units
All measured data (columns 3-88) has been divided by its range to normalize it. So these variabels are averages of ratios and therefore have no units. 

## What do these variables represent? 
The first two variables "subject" and "activity" are identifiers. Subjects (people) are represented by integers from 1-30 and activities (what the people were doing when the original measurements were taken) are represented with descriptions such as "WALKING" or "SITTING".

To understand what the measurements represent, we must start with the original description of the data, which can be found in the features_info.txt file from the [original study][2].

[2]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones    "original data source"

The measurements found in "GCD_Course_Project_Tidy_Data_bmca.txt", however, represent averages for all of the values of *some* of the variables in the original data set. Averages were taken for each unique student/activity/variable combination. For details on which variables were included, see the next section. 

## Key assumptions for which variables were included: 
I assumed that any variable containing the letters "std" or "mean" should be included in this subset of variables. Note that if you do not convert the variables to lowercase and if you perform the default grep() function, in which ignore.case="FALSE", you might end up with a 79 variable subset. Because I changed all variables to lowercase, this returns an additional 7 variables, for a total of 86. The extra seven variables are (represented before being converted to lowercase): 
> "angletBodyAccMeangravity"          
> "angletBodyAccJerkMeangravityMean" 
> "angletBodyGyroMeangravityMean"     
> "angletBodyGyroJerkMeangravityMean"
> "angleXgravityMean"                 
> "angleYgravityMean"                
> "angleZgravityMean"     

## Slightly different variable names
The variable names in my subset are slightly different than those found in the original data, but they should still be recognizable. The variable names were processed with the the make.names() function to ensure they were all syntactically valid in R. Then all periods were removed from the names and they were converted to all lowercase, as instructed in week 4 lectures of the Getting and Cleaning Data lectures. 

## Source Data Information
For convenience, I have pasted in the descriptions of the original data:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

>> tBodyAcc-XYZ
>> tGravityAcc-XYZ
>> tBodyAccJerk-XYZ
>> tBodyGyro-XYZ
>> tBodyGyroJerk-XYZ
>> tBodyAccMag
>> tGravityAccMag
>> tBodyAccJerkMag
>> tBodyGyroMag
>> tBodyGyroJerkMag
>> fBodyAcc-XYZ
>> fBodyAccJerk-XYZ
>> fBodyGyro-XYZ
>> fBodyAccMag
>> fBodyAccJerkMag
>> fBodyGyroMag
>> fBodyGyroJerkMag

> The set of variables that were estimated from these signals are: 

>> mean(): Mean value
>> std(): Standard deviation
>> mad(): Median absolute deviation 
>> max(): Largest value in array
>> min(): Smallest value in array
>> sma(): Signal magnitude area
>> energy(): Energy measure. Sum of the squares divided by the number of values. 
>> iqr(): Interquartile range 
>> entropy(): Signal entropy
>> arCoeff(): Autorregresion coefficients with Burg order equal to 4
>> correlation(): correlation coefficient between two signals
>> maxInds(): index of the frequency component with largest magnitude
>> meanFreq(): Weighted average of the frequency components to obtain a mean frequency
>> skewness(): skewness of the frequency domain signal 
>> kurtosis(): kurtosis of the frequency domain signal 
>> bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
>> angle(): Angle between to vectors.

> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

>> gravityMean
>> tBodyAccMean
>> tBodyAccJerkMean
>> tBodyGyroMean
>> tBodyGyroJerkMean


Citation for data source: 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
