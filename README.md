# Getting and cleaning data: Final Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

## Review criteria
The submitted data set is tidy.
The Github repo contains the required scripts.
GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
The README that explains the analysis files is clear and understandable.
The work submitted for this project is the work of the student who submitted it.
Getting and Cleaning Data Course Projectless 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

------------------------------------------------------------
# Repository Files

1. **CodeBook.md**
  * This contains a overview of the following information.
      * A list of each file needed to perform the analyses and what information each contains
      * A list of variables including general, mean and standard deviation variables.
      
2. **run_analyses.R script**
  * This script inputs the seperates project files and processes it to output the mean value of all the mean and standard deviation variables seperaly for each participant over each activity type. This will output the file as a tidy txt file (subjectmeans.txt) to the present working directory. A step by step guide to the run_analyses.R script and how it processes the input data is found below.



## Script Process

1.  **Importing and merging data sets :  read.table and rbind**
   * Here we first load all the above mentioned data sets into R using the read.table function. These data sets are then combined across both test and trial sets (using rbind) so we have a single subject, activity label (Y) and data (X) data frame. The activity_labels and feature files are then converted to character lists to be manipulated and indexed later.
   
2. **Rename the columns: colnames**
   * Here we rename the columns of the new combined data sets (subjects, activity labels and data). The names for the data object are obtained from the feature object (containing each of the variable/column names)
   
3. **Filter the data to just mean and standard deviation variables: cbind, grep**
   * Here we first loop though the feature list containings all the variable names and, using grep, find the indices of variables that contain the word mean or std (standard deviation).
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

