# This script aims to generate the mean for each mean and standard devition variable
# for each participant (1-30) and for each of the 6 activities.
# This script relies on the data already being downloaded into the below directory (see line 11)


# Load in relevant packages
library(data.table)
library(reshape2)

wd <- getwd()

# Read in the names of the variables and save as a character
features <- read.table(paste(wd,'/features.txt', sep = ''))
features_char <- readLines(paste(wd,'/features.txt', sep = ''))


# Read in activity names
activitynames <- read.table((paste(wd,'/activity_labels.txt', sep = '')), col.names = c("Number","Activity"))
# Save descriptive names only as a list than can be indexed later
activitynames <- gsub('_',' ',(as.list(levels(activitynames$Activity))))

# Load in the subject list for both data sets
subject_test <- read.table(paste(wd,'/test/subject_test.txt', sep = ''))
subject_train <- read.table(paste(wd,'/train/subject_train.txt', sep = ''))
# Load in the data for both data sets
X_test <- read.table(paste(wd,"/test/X_test.txt", sep = ''))
X_train <- read.table(paste(wd,"/train/X_train.txt", sep = ''))
# Load in the activity labels for both data sets
y_test <- read.table(paste(wd,"/test/y_test.txt", sep = ''))
y_train <- read.table(paste(wd,"/train/y_train.txt", sep = ''))

# Bind both data sets together independently for data, subjects and labels
full_dataset <- rbind(X_test,X_train)
full_subjects <-rbind(subject_test, subject_train)
full_labels <- rbind(y_test,y_train)

# Rename the numbers as descriptive actiivty names
full_labels <- sapply(full_labels, function(x) {activitynames[x]})

# Column names from feature dataset
colnames(full_dataset) <- (features[,2])
colnames(full_subjects) <- "Subjects"
colnames(full_labels) <- "Activity"


# Search for names containing mean and std and save their indices 
meanindex <- grep('mean', features_char)
sdindex <- grep('std', features_char)

# List of intergers that contain the Mean and SD variables
wantedvarindex<- c(meanindex, sdindex)

# Just select those data columns with the desired variables (mean and Std values)
filter_data <- full_dataset[ , wantedvarindex]

# Add both the subject and activity label data to the corresponding rows in the filtered data set
# At this point we have all the data saved into a single R object
filter_data <- cbind(full_labels, filter_data)
filter_data <- cbind(full_subjects, filter_data)

# Loop around each column name and remove the ending ()
names(filter_data) <- sapply(names(filter_data), function(x) {gsub("[()]", "",x)})
names(filter_data) <- sapply(names(filter_data), function(x) {gsub("^t", "Time-",x)})
names(filter_data) <- sapply(names(filter_data), function(x) {gsub("^f", "Frequency-",x)})


# Melt the data to have 1 row for each varible for each participant
alldata <- melt(filter_data,(id.vars=c("Subjects","Activity")))
# For the subject and activity, get the mean for each variable (6 rown per participant)
subjectdata <- dcast(alldata, Subjects + Activity ~ variable,mean)
# Rename the numbers as descriptive actiivty names
subjectdata$Activity <- sapply(subjectdata$Activity, function(x) {activitynames[x]})



# Save the resuting data file out as a csv file
write.table(subjectdata, file=(paste(wd,'/subjectmeans.txt')), row.names=FALSE)
