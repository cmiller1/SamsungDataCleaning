# SamsungDataCleaning
Coursera Course > Getting and Cleaning Data > Course Project

This README contains the following information:
1: Notes on the script
2: Notes on the data
3: Summary of the script
4: Code Book

##***********************
Notes on script:
(1) The script is named run_analysis.R and it returns a tidy data set of data collected from the accelerometers from the Samsung Galaxy S smartphone. The tidy data is returned as a text file 'mytidydata.txt'

(2) The script assumes that the data has been downloaded and unzipped into the working directory.

(3) The script returns a table with 180 rows (30 test subjects, performing 6 activities each = 180) and 81 columns. The 81 columns are the subject ID, the activity name, and the 79 variables that are related to mean or standard deviation measurements. See Code Book below for more detail.

(4) The project meets the four conditions of being 'tidy' - namely: (1) the raw data is available for download from the course website or this Github page; (2) a Tidy Data Set is provided in the mytidydata.txt file; (3) a Code Book is included in this file; (4) The script used to generate this file is included in this github

(5) The data is also tidy. Each variable is in its own column (one col for the subject, one for the activity, and one for each of 79 data observations); Each observation is in its own row; Column names and activities are descriptive in plain text.

##***********************
Notes on the data:
(1) There are 563 total variables - one variable for the subject code (1-30), one variable for the activity (1-6) and 561 variables for data readings. See Code Book (below) for more detail.

##***********************
Script Summary
(1) The script has 6 basic sections:

(1.1) First the data is read into two different tables - one for the test subjects and one for the trial subjects. cbind is used to create these tables

(1.2) At this point we have two dataframes, the test data with 2947 rows and 563 columns and the training data with 7352 rows and 563 columns. Next, the data is merged and sorted to add to readability in the final table. The data is merged with rbind

(1.3) At this point the data contains 10299 rows and 563 columns. Now we select a subset of this data for variables related to either the mean or standard deviation data. This is accomplished by searching the descriptive variable names for the keywords mean or std and then creating a DF indexed to these variables. 

(1.4) At this point the data contains 10299 rows and 81 columns. Now we apply descriptive names to the activity codes and to the columns. This is done by reading the relevant text files. The activity names must be cleaned a bit to enable the dplyr summarise function we will use later.

(1.5) Now we use dplyr functions to group the data by Subject and Activity and then to summarise the data by these two variables, taking the mean of all the other columns with the summarise_each function.

(1.6) Last, the script creates a text file with the output of the summarise_each function. The final table has 180 rows and 81 columns

##***********************
Code Book
(1) The final txt file contains 81 variables:
Subject: Numeric. Value from 1 to 30. Each unique integer references one test subject participating in the study. Participants are split into test or training groups.
Activity: Character. Measurements we based on 6 different physical activities. These include WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
(Note: remaining dataclasses are all numeric; each variable references one data reading from the Samsung Galaxy phone used in the study; ACC variables show the acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'; BODY_ACC variables show The body acceleration signal obtained by subtracting the gravity from the total acceleration; BODY_GYRO variable show The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.)
"tBodyAcc_mean_X"
"tBodyAcc_mean_Y"             
"tBodyAcc_mean_Z"              
"tBodyAcc_std_X"              
"tBodyAcc_std_Y"                
"tBodyAcc_std_Z"               
"tGravityAcc_mean_X"            
"tGravityAcc_mean_Y"           
"tGravityAcc_mean_Z"            
"tGravityAcc_std_X"            
"tGravityAcc_std_Y"             
"tGravityAcc_std_Z"            
"tBodyAccJerk_mean_X"           
"tBodyAccJerk_mean_Y"          
"tBodyAccJerk_mean_Z"           
"tBodyAccJerk_std_X"           
"tBodyAccJerk_std_Y"            
"tBodyAccJerk_std_Z"           
"tBodyGyro_mean_X"              
"tBodyGyro_mean_Y"             
"tBodyGyro_mean_Z"              
"tBodyGyro_std_X"              
"tBodyGyro_std_Y"               
"tBodyGyro_std_Z"              
"tBodyGyroJerk_mean_X"          
"tBodyGyroJerk_mean_Y"         
"tBodyGyroJerk_mean_Z"          
"tBodyGyroJerk_std_X"          
"tBodyGyroJerk_std_Y"           
"tBodyGyroJerk_std_Z"          
"tBodyAccMag_mean"              
"tBodyAccMag_std"              
"tGravityAccMag_mean"           
"tGravityAccMag_std"           
"tBodyAccJerkMag_mean"          
"tBodyAccJerkMag_std"          
"tBodyGyroMag_mean"             
"tBodyGyroMag_std"             
"tBodyGyroJerkMag_mean"         
"tBodyGyroJerkMag_std"         
"fBodyAcc_mean_X"               
"fBodyAcc_mean_Y"              
"fBodyAcc_mean_Z"               
"fBodyAcc_std_X"               
"fBodyAcc_std_Y"                
"fBodyAcc_std_Z"               
"fBodyAcc_meanFreq_X"           
"fBodyAcc_meanFreq_Y"          
"fBodyAcc_meanFreq_Z"           
"fBodyAccJerk_mean_X"          
"fBodyAccJerk_mean_Y"           
"fBodyAccJerk_mean_Z"          
"fBodyAccJerk_std_X"            
"fBodyAccJerk_std_Y"           
"fBodyAccJerk_std_Z"            
"fBodyAccJerk_meanFreq_X"      
"fBodyAccJerk_meanFreq_Y"       
"fBodyAccJerk_meanFreq_Z"      
"fBodyGyro_mean_X"              
"fBodyGyro_mean_Y"             
"fBodyGyro_mean_Z"              
"fBodyGyro_std_X"              
"fBodyGyro_std_Y"               
"fBodyGyro_std_Z"              
"fBodyGyro_meanFreq_X"          
"fBodyGyro_meanFreq_Y"         
"fBodyGyro_meanFreq_Z"          
"fBodyAccMag_mean"             
"fBodyAccMag_std"               
"fBodyAccMag_meanFreq"         
"fBodyBodyAccJerkMag_mean"      
"fBodyBodyAccJerkMag_std"      
"fBodyBodyAccJerkMag_meanFreq"  
"fBodyBodyGyroMag_mean"        
"fBodyBodyGyroMag_std"          
"fBodyBodyGyroMag_meanFreq"    
"fBodyBodyGyroJerkMag_mean"     
"fBodyBodyGyroJerkMag_std"     
"fBodyBodyGyroJerkMag_meanFreq"