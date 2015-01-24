### Script performing project requirements from the "Getting and Cleaning Data" course
### by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD
### Coursera, Johns Hopkins University

### Input:
# Human Activity Recognition Using Smartphones Data Set 
# X_train.txt and X_test.txt files

### Output:
#tidy data set with the average of each variable for each activity and each subject

#README.md - data source, experimental design and acknowledgements
#CODEBOOK.md - for variable description 

###Script objectives as described in the project desctiption:
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names. 
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

#load packages

library(dplyr)

# chceck if all data files exist. Stop and return Error message if not.

if (!file.exists("./test/X_test.txt") | 
        !file.exists("./test/y_test.txt") |
        !file.exists("./test/subject_test.txt") |
        !file.exists("./train/X_train.txt") |
        !file.exists("./train/y_train.txt") |
        !file.exists("./train/subject_train.txt") |
        !file.exists("features.txt")
        ) stop("missing data files, check file location")

# load data to data frames add labels from the "features.txt" file

features <- read.csv("features.txt", header = FALSE, sep = "", col.names = c("number", "variable"), stringsAsFactors = FALSE)
test <- read.csv("./test/X_test.txt", header = FALSE, sep = "", col.names = as.character(features$variable), check.names = FALSE)
activities_test <- read.csv("./test/y_test.txt", header = FALSE, col.names = "activity_type")
subjects_test <- read.csv("./test/subject_test.txt", header = FALSE, col.names = "subject")

train <- read.csv("./train/X_train.txt", header = FALSE, sep = "", col.names = as.character(features$variable), check.names = FALSE)
activities_train <- read.csv("./train/y_train.txt", header = FALSE, col.names = "activity_type")
subjects_train <- read.csv("./train/subject_train.txt", header = FALSE, col.names = "subject")

activity_labels <- read.csv("activity_labels.txt", header = FALSE, sep = "", col.names = c("number", "activity"), stringsAsFactors = FALSE)
# merge test data with subject data and activity data

comb_test <- cbind(subjects_test, activities_test, test)
comb_train <- cbind(subjects_train, activities_train, train)

# merge two df test and training

full_set <- rbind(comb_test, comb_train)

# select only mean and std (standard deviation) variables
#first create vector of all varaible names that contain "-mean" or "-std' but not meanFrequency and adds first two variables:
#"subject" and "activity_type"

list_of_variables <- c("subject", "activity_type", grep("(-mean|-std)" ,names(full_set), value = TRUE))
data_set <- subset(full_set, select = list_of_variables)

# change activity numbers to descriptive names

activity <- NULL
for(idx in 1:nrow(activity_labels)){
    data_set[idx,number] 
}


# final subset

