

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
TimeBodyAcc-mean       |TimeBodyAcc-mean-X    |  TimeBodyAcc-mean-Y    |   TimeBodyAcc-mean-Z               
TimeBodyAccJerk-mean   | TimeBodyAccJerk-mean-X|TimeBodyAccJerk-mean-Y |   TimeBodyAccJerk-mean-Z
TimeBodyAccMag-mean     | ||          
TimeBodyAccJerkMag-mean| ||        
TimeBodyGyro-mean      | TimeBodyGyro-mean-X  |   TimeBodyGyro-mean-Y  |   TimeBodyGyro-mean-Z              
TimeBodyGyroJerk-mean  | TimeBodyGyroJerk-mean-X  | TimeBodyGyroJerk-mean-Y |  TimeBodyGyroJerk-mean-Z              
TimeBodyGyroMag-mean | ||          
TimeBodyGyroJerkMag-mean | ||    
TimeGravityAcc-mean    |TimeGravityAcc-mean-X |  TimeGravityAcc-mean-Y |   TimeGravityAcc-mean-Z
TimeGravityAccMag-mean | ||        
FrequencyBodyAcc-mean       | FrequencyBodyAcc-mean-X    |FrequencyBodyAcc-mean-Y       |FrequencyBodyAcc-mean-Z               
FrequencyBodyAcc-meanFreq   | FrequencyBodyAcc-meanFreq-X |   FrequencyBodyAcc-meanFreq-Y |  FrequencyBodyAcc-meanFreq-Z           
FrequencyBodyAccJerk-mean   | FrequencyBodyAccJerk-mean-X |   FrequencyBodyAccJerk-mean-Y |  FrequencyBodyAccJerk-mean-Z           
FrequencyBodyAccJerk-meanFreq | FrequencyBodyAccJerk-meanFreq-X|  FrequencyBodyAccJerk-meanFreq-Y |  FrequencyBodyAccJerk-meanFreq-Z 
FrequencyBodyAccMag-mean  | ||               
FrequencyBodyAccMag-meanFreq  | ||         
FrequencyBodyGyro-mean     | FrequencyBodyGyro-mean-X  |   FrequencyBodyGyro-mean-Y|     FrequencyBodyGyro-mean-Z              
FrequencyBodyGyro-meanFreq |     FrequencyBodyGyro-meanFreq-X | FrequencyBodyGyro-meanFreq-Y  | FrequencyBodyGyro-meanFreq-Z               
FrequencyBodyBodyAccJerkMag-mean | ||        
FrequencyBodyBodyAccJerkMag-meanFreq | ||    
FrequencyBodyBodyGyroMag-mean | ||          
FrequencyBodyBodyGyroMag-meanFreq | ||       
FrequencyBodyBodyGyroJerkMag-mean | ||      
FrequencyBodyBodyGyroJerkMag-meanFreq | ||  
     




STD-Variable Name       | X                 |   Y                |  Z          
------------        | ----------------- | ----------------   | ------  
TimeBodyAcc-std  | TimeBodyAcc-std-X  |  TimeBodyAcc-std-Y  |  TimeBodyAcc-std-Z               
TimeBodyAccJerk-std  | TimeBodyAccJerk-std-X  |    TimeBodyAccJerk-std-Y  |  TimeBodyAccJerk-std-Z  | 
TimeBodyAccMag-std | ||    
TimeBodyAccJerkMag-std | ||  
TimeBodyGyro-std|  TimeBodyGyro-std-X  |  TimeBodyGyro-std-Y  |  TimeBodyGyro-std-Z  |              
TimeBodyGyroJerk-std  | TimeBodyGyroJerk-std-X  |    TimeBodyGyroJerk-std-Y  |  TimeBodyGyroJerk-std-Z  |          
TimeBodyGyroMag-std | ||    
TimeBodyGyroJerkMag-std | || 
TimeGravityAcc-std  | TimeGravityAcc-std-X  | TimeGravityAcc-std-Y   |   TimeGravityAcc-std-Z            
TimeGravityAccMag-std | ||   
FrequencyBodyAcc-std  | FrequencyBodyAcc-std-X   | FrequencyBodyAcc-std-Y  | FrequencyBodyAcc-std-Z                
FrequencyBodyAccJerk-std  | FrequencyBodyAccJerk-std-X  |  FrequencyBodyAccJerk-std-Y  |  FrequencyBodyAccJerk-std-Z  | 
FrequencyBodyAccMag-std  | ||                 
FrequencyBodyGyro-std  |  FrequencyBodyGyro-std-X   |   FrequencyBodyGyro-std-Y |  FrequencyBodyGyro-std-Z               
FrequencyBodyBodyAccJerkMag-std   | ||         
FrequencyBodyBodyGyroMag-std   | ||            
FrequencyBodyBodyGyroJerkMag-std  | ||  
 


