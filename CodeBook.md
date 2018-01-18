

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
 


## Script Process

1.  **Importing and merging data sets :  read.table and rbind**
   * Here we first load all the above mentioned data sets into R using the read.table function. These data sets are then combined across both test and trial sets (using rbind) so we have a single subject, activity label (Y) and data (X) data frame. The activity_labels and feature files are then converted to character lists to be manipulated and indexed later.
   
2. **Rename the columns: colnames**
   * Here we rename the columns of the new combined data sets (subjects, activity labels and data). The names for the data object are obtained from the feature object (containing each of the variable/column names)
   
3. **Filter the data to just mean and standard deviation variables: cbind, grep**
   * Here we first loop though the feature list containings all the variable names and, using grep, find the indeces of variables that contain the word mean or std (standard deviation).
   * We then filter the data object to just include the columns of those desired variables
   * This filtered data is then combined with both the subject and activity label data frames.

4. **Tidying up variable name: sapply, gsub**
   * Here we loop around all the variable names and replace sections to improve their clarity
   * Variatled signified with the t and f have been replaced to Time and Frequency respectivly (e.g. tBodyAcc-mean to TimeBodyAcc-mean)
   * The () will be removed from the end


5. **Rename activity column: sapply**
   * Here we loop around each row in the Activity column and replace each number value with the corresponding activity descriptive name. It does this by using the element as an index to the previously saved activity names
 
6. **Save out the mean file: write.table**
   * Here we save the output file to the current working directory as 'subjectmeans.txt'




