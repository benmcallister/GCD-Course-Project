The following are the variable names included in the tidy data set "GCD_Course_Project_Tidy_Data_bmca.txt"

## Variables
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

## What do these variables represent? 
The first two variables "subject" and "activity" are identifiers. Subjects (people) are represented by integers from 1-30 and activities (what the people were doing when the original measurements were taken) are represented with descriptions such as "WALKING" or "SITTING".

To understand what the measurements represent, we must start with the original description of the data, which can be found in the features_info.txt file from the [original study][2]

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