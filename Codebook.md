
Human Activity Recognition Using Smartphones Dataset
====================================================

A. DESCRIPTION OF THE DATA
==========================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/tot2in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
===================================================

B. DATA TRANSFORMATIONS
========================

1. Download the files containing the required dataset from the path https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Unzip the file to the selected directory.
3. Load all the training and test data along with the other required datasets.
4. For each column in the training and test datasets, assign a variable name. The variable names are contained in the features dataset.
5. Do the same to acvity data, subject data and acvity labels.
6. Create a tidy dataset for each training and test data by adding the data on the subject ID and activity ID. The total number of variables for each training and test data is equal to 563 including the subject ID and activity ID.
7. Create a full data containing the test and training data by adding all the observations from the the two datasets.
8. From the combined test and training data, extract all the variables that contains only the mean and standard deviation of each measurements.
9. Clean the variable names by:
	a. removing the paranthesis from variable names
	b. replacing "Acc" to "Accelleration"
	c. replacing "Gyro" to "Gyroscope"
	d. replacing "Freq" to "Frequency"
	e. replacing "t" at the beginning of the variable names to "Time"
	f. replacing "f" at the beginning of the variable names to "Frequency"
	g. replacing "BodyBody" to "Body"
	h. replacing "std" to "Std"
	i. replacing "Mag" to "Magnitude"

10. From the tidy dataset modified in (9), include the the mean of each variable for ach activity type  and for each subject.













