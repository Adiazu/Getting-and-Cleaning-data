## Loading the libraries I will use
library(sqldf)
library(data.table)

##Dowloading the file and saving in the working directory with the name "Project.zip"

fileIURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileIURL,destfile = "./Project.zip")
files <- unzip("Project.zip", files = NULL, list = FALSE, overwrite = TRUE,
               junkpaths = FALSE, exdir = ".", unzip = "internal",
               setTimes = FALSE)

##Read data into data frames
subject_train <- read.table(unz("Project.zip", "UCI HAR Dataset/train/subject_train.txt"))
X_train<- read.table(unz("Project.zip", "UCI HAR Dataset/train/X_train.txt"))
y_train <- read.table(unz("Project.zip", "UCI HAR Dataset/train/y_train.txt"))
subject_test <- read.table(unz("Project.zip", "UCI HAR Dataset/test/subject_test.txt"))
X_test <- read.table(unz("Project.zip", "UCI HAR Dataset/test/X_test.txt"))
y_test<- read.table(unz("Project.zip", "UCI HAR Dataset/test/y_test.txt"))
DimActivity <- read.table(unz("Project.zip", "UCI HAR Dataset/activity_labels.txt"))
DimFeatures <- read.table(unz("Project.zip", "UCI HAR Dataset/features.txt"))

##Put names to the colums
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

names(y_test) <- "activityID"
names(y_train) <- "activityID"
names(DimActivity) <- c("activityID","Description")
names(DimFeatures) <- c("featureID","Description")
names(X_train) <- DimFeatures$Description
names(X_test) <- DimFeatures$Description

##Merge all the data
Train <- cbind(subject_train,y_train,X_train)
Test <- cbind(subject_test,y_test,X_test)

##Put flag to know if is from train or test
Train$Flag = "Train"
Test$Flag = "Test"

##Union the Train and Test dataframes
data <- rbind(Test,Train)

##Forcing unique columnames to use the sqldf package
valid_column_names <- make.names(names=names(data), unique=TRUE, allow_ = TRUE)
names(data) <- valid_column_names
