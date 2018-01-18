

# Script Overview


## Pre-requisites
The script run_analyses.R is designed to extract the mean value of each mean and standard devition variable for each participant (1-30) and for each of the 6 activities. It will be saved out as a txt file called subjectdata.

This script relies on the data already being downloaded into the directory stated on line 10 (saved as wd).
Below are a list of data files that should be downloaded.



1. **'features_info.txt'**: Shows information about the variables used on the feature vector.

2. **'features.txt'**: List of all features.

3. **'activity_labels.txt'**: Links the class labels with their activity name.

4. **'train/X_train.txt'**: Training set - containing accelerometer data (561 columns)

5. **'train/y_train.txt'**: Training labels - numbers 1-6 to indicate which activity type the corresponding X-rows are

6. **'train/subject_train.txt'** : Each row identifies the subject performing the activity on each corresponding X-row. Ranges from 1-30. 

7. **'test/X_test.txt'**: Test set - containing accelerometer data (561 columns)

8. **'test/y_test.txt'**: Test labels - numbers 1-6 to indicate which activity type the corresponding X rows are

9.  **'test/subject_test.txt'** : Each row identifies the subject performing the activity on each corresponding X-row. Ranges from 1-30.  


# Variables

Below is a list of variables(columns names) exported in the subjectdata.txt file. These are divided below into general variable names, mean variable names and standard deviation names. Variables with X, Y ans Z components are also specified.

- **t** variables are a measure of time
- **f** variables are a measure of frequency domain
- Features are normalized and bounded within -1 to 1.

General Variable Name |
 --------------------- |
Subjects |
Activity |


Mean-Variable Name       | X                 |   Y                |  Z          
------------        | ----------------- | ----------------   | ------       
tBodyAcc-mean       |tBodyAcc-mean-X    |  tBodyAcc-mean-Y    |   tBodyAcc-mean-Z               
tBodyAccJerk-mean   | tBodyAccJerk-mean-X|tBodyAccJerk-mean-Y |   tBodyAccJerk-mean-Z
tBodyAccMag-mean     | ||          
tBodyAccJerkMag-mean| ||        
tBodyGyro-mean      | tBodyGyro-mean-X  |   tBodyGyro-mean-Y  |   tBodyGyro-mean-Z              
tBodyGyroJerk-mean  | tBodyGyroJerk-mean-X  | tBodyGyroJerk-mean-Y |  tBodyGyroJerk-mean-Z              
tBodyGyroMag-mean | ||          
tBodyGyroJerkMag-mean | ||    
tGravityAcc-mean    |tGravityAcc-mean-X |  tGravityAcc-mean-Y |   tGravityAcc-mean-Z
tGravityAccMag-mean | ||        
fBodyAcc-mean       | fBodyAcc-mean-X    |fBodyAcc-mean-Y       |fBodyAcc-mean-Z               
fBodyAcc-meanFreq   | fBodyAcc-meanFreq-X |   fBodyAcc-meanFreq-Y |  fBodyAcc-meanFreq-Z           
fBodyAccJerk-mean   | fBodyAccJerk-mean-X |   fBodyAccJerk-mean-Y |  fBodyAccJerk-mean-Z           
fBodyAccJerk-meanFreq | fBodyAccJerk-meanFreq-X|  fBodyAccJerk-meanFreq-Y |  fBodyAccJerk-meanFreq-Z 
fBodyAccMag-mean  | ||               
fBodyAccMag-meanFreq  | ||         
fBodyGyro-mean     | fBodyGyro-mean-X  |   fBodyGyro-mean-Y|     fBodyGyro-mean-Z              
fBodyGyro-meanFreq |     fBodyGyro-meanFreq-X | fBodyGyro-meanFreq-Y  | fBodyGyro-meanFreq-Z                 
fBodyBodyAccJerkMag-mean | ||        
fBodyBodyAccJerkMag-meanFreq | ||    
fBodyBodyGyroMag-mean | ||          
fBodyBodyGyroMag-meanFreq | ||       
fBodyBodyGyroJerkMag-mean | ||      
fBodyBodyGyroJerkMag-meanFreq | ||  
     




STD-Variable Name       | X                 |   Y                |  Z          
------------        | ----------------- | ----------------   | ------  
tBodyAcc-std  | tBodyAcc-std-X  |  tBodyAcc-std-Y  |  tBodyAcc-std-Z               
tBodyAccJerk-std  | tBodyAccJerk-std-X  |    tBodyAccJerk-std-Y  |  tBodyAccJerk-std-Z  | 
tBodyAccMag-std | ||    
tBodyAccJerkMag-std | ||  
tBodyGyro-std|  tBodyGyro-std-X  |  tBodyGyro-std-Y  |  tBodyGyro-std-Z  |              
tBodyGyroJerk-std  | tBodyGyroJerk-std-X  |    tBodyGyroJerk-std-Y  |  tBodyGyroJerk-std-Z  |          
tBodyGyroMag-std | ||    
tBodyGyroJerkMag-std | ||    
fBodyAcc-std  | fBodyAcc-std-X   | fBodyAcc-std-Y  | fBodyAcc-std-Z                
fBodyAccJerk-std  | fBodyAccJerk-std-X  |  fBodyAccJerk-std-Y  |  fBodyAccJerk-std-Z  | 
fBodyAccMag-std  | ||                 
fBodyGyro-std  |  fBodyGyro-std-X   |   fBodyGyro-std-Y |  fBodyGyro-std-Z               
fBodyBodyAccJerkMag-std   | ||         
fBodyBodyGyroMag-std   | ||            
fBodyBodyGyroJerkMag-std  | ||  
tGravityAcc-std  | tGravityAcc-std-X  | tGravityAcc-std-Y   |   tGravityAcc-std-Z            
tGravityAccMag-std | ||    
