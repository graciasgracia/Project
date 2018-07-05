#set workiing directory
wd <-  "C:/Users/Migs/Desktop/Grace/DataScience/Course 3 - Getting and Cleaning Data/Week 4/Project"
setwd(wd)

#Downaload the zipped file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
file <- "UCIdata.zip"
download.file(url, file)

#Unzip the file
unzip(file, files = NULL, exdir=".")

#load the data
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")


sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")  

#Assign variable names to data
colnames(sub_train) <- "subId"
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityId"

colnames(sub_test) <- "subId"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activityId"

colnames(activity_labels)<-c("activityId","activityType")


#create clean dataset for each group
train_data <- cbind(sub_train,y_train, x_train)
test_data <- cbind(sub_test,y_test,x_test)


# 1. Merge test data and train data
dataset <- rbind(train_data, test_data)


# 2. Extract only the measurements on the mean and standard deviation for each measurement
mean_std <-dataset[,grep("mean|std|subId|activityId",names(dataset),value =TRUE)]


#3. Use descriptive activity names to name the activities in the data set
mean_std <- join(mean_std,activity_labels,by="activityId", match = "first")
mean_std <- select(mean_std,subId,activityId,activityType,"tBodyAcc-mean()-X":"fBodyBodyGyroJerkMag-meanFreq()") 

#4.label the data set with descriptive variable names

names(mean_std) <- gsub("\\(|\\)","",names(mean_std))
names(mean_std) <- gsub("Acc", "Accelleration", names(mean_std))
names(mean_std) <- gsub("Gyro", "Gyroscope", names(mean_std))
names(mean_std) <- gsub("Freq", "Frequency", names(mean_std))
names(mean_std) <- gsub("^t", "Time", names(mean_std))
names(mean_std) <- gsub("^f", "Frequency", names(mean_std))
names(mean_std) <- gsub("BodyBody", "Body", names(mean_std))
names(mean_std) <- gsub("std", "Std", names(mean_std))
names(mean_std) <- gsub("Mag", "Magnitude", names(mean_std))


#5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
groupData_mean<- ddply(data_mean_std, c("subject","activity"), numcolwise(mean))
write.table(groupData_mean,file="tidydata.txt")





