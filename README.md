GETTING AND CLEANING DATA
=========================

The following were the steps performed to create a tidy set:

1. Set the working directory

wd <-  "C:/Users/Migs/Desktop/Grace/DataScience/Course 3 - Getting and Cleaning Data/Week 4/Project"
setwd(wd)
 

Before performing the succeeding steps below, be sure to load all the required R packages.

2. Download the zip file of Human Activity Recognition
 
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
file <- "UCIdata.zip"
download.file(url, file)

3. Unzip the file in set directory

unzip(file, files = NULL, exdir=".")


4. Read all the required data from the unzip folder

sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt") 

5. Assign column names to each of the variables in each of the data sets. For test and train data, column names are found in the 2nd column of features data. 

colnames(sub_train) <- "subId"
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityId"
colnames(sub_test) <- "subId"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityId"
colnames(activity_labels)<-c("activityId","activityType")

6. Create a complete dataset containining the subject ID, activity details and all the measurements, for each test and training dataset.

train_data <- cbind(sub_train,y_train, x_train)
test_data <- cbind(sub_test,y_test,x_test)

7. Combine into one dataset all the observations from the training and test data just created in (6) and assign it to the variable "dataset"

dataset <- rbind(train_data, test_data)

8. Extract only the measurements on the mean and standard deviation for each measurement from the dataset and assign it to the variable "mean_std"

mean_std <-dataset[,grep("mean|std|subId|activityId",names(dataset),value =TRUE)]

9. Merge the "activity_labels" to the "mean_std" data by activityID to name the activities with ID from 1 to 6

ID Activity Type
1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING


mean_std <- join(mean_std,activity_labels,by="activityId", match = "first")


10. Arrange the variables(column names) of the mean_std data properly by placing the subject ID, Activity ID and Activity Type on the first 3 columns.

mean_std <- select(mean_std,subId,activityId,activityType,"tBodyAcc-mean()-X":"fBodyBodyGyroJerkMag-meanFreq()") 

11. Fix the variable names of the data "mean_std" by:
- removing all the parantheses in the column names,
- replacing "Acc" to "Accellaration"
- replacing "Gyro" to "Gyroscope"
- replacing "Freq" to "Frequency"
- replacing "BodyBody" to "Body"
- replacing "t" at the beginning of the variable name to "Time"
- replacing "f" at the beginning of the variable name to "Frequency"
- replacing "std" to "STD"
- replacing "Mag" to "Magnitude"

names(mean_std) <- gsub("\\(|\\)","",names(mean_std))
names(mean_std) <- gsub("Acc", "Accelleration", names(mean_std))
names(mean_std) <- gsub("Gyro", "Gyroscope", names(mean_std))
names(mean_std) <- gsub("Freq", "Frequency", names(mean_std))
names(mean_std) <- gsub("^t", "Time", names(mean_std))
names(mean_std) <- gsub("^f", "Frequency", names(mean_std))
names(mean_std) <- gsub("BodyBody", "Body", names(mean_std))
names(mean_std) <- gsub("std", "Std", names(mean_std))
names(mean_std) <- gsub("Mag", "Magnitude", names(mean_std))


12. Get the mean of all the variables for each activity type and subject ID

groupData_mean<- ddply(mean_std, c("subId","activityType"), numcolwise(mean))

13. Save the created dataset to filename tidy.txt 

write.table(groupData_mean,file="tidydata.txt")