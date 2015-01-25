##The script assumes the zip file was unzipped in the working directory (meaning there is a working dir level folder named UCI HAR Dataset)
library(dplyr)

## FIRST read in the data from the relevant test and training files
test1<-read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="Subject")
test1$Activity<-read.table("./UCI HAR Dataset/test/y_test.txt")
temp1<-read.table("./UCI HAR Dataset/test/X_test.txt")
test1<-cbind(test1, temp1)

train1<-read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="Subject")
train1$Activity<-read.table("./UCI HAR Dataset/train/y_train.txt")
temp1<-read.table("./UCI HAR Dataset/train/X_train.txt")
train1<-cbind(train1, temp1)

## SECOND merge the data into a single DF (and convert activity class to numeric)
test1[,2]<-as.numeric(unlist(test1[,2]))
train1[,2]<-as.numeric(unlist(train1[,2]))
full_data<-rbind(test1, train1)

## And now just for the fun of it, we'll sort the data by Subject and then Activity
s_index<-with(full_data, order(Subject, Activity))
full_data<-full_data[s_index,]

## THIRD extract mean and std indicators
## My methodology assumes the features file contains descriptive names using mean and std where relevant
test1.names<-read.table("./UCI HAR Dataset/features.txt")
z1<-grepl("std", test1.names$V2)
z2<-grepl("mean", test1.names$V2)
z3<-z1 | z2
test1.names<-test1.names[z3,]
colind<-c(1,2,test1.names$V1+2)
full_data<-full_data[,colind]

## FOURTH, name the activities in the dataset
for (i in 1:nrow(full_data)) {
  if (full_data[i,2] == 1) {
    full_data[i,2] <- "WALKING"
  } else if (full_data[i,2]==2){
    full_data[i,2] <- "WALKING_UPSTAIRS"
  } else if (full_data[i,2]==3){
    full_data[i,2] <- "WALKING_DOWNSTAIRS"
  } else if (full_data[i,2]==4){
    full_data[i,2] <- "SITTING"
  } else if (full_data[i,2]==5){
    full_data[i,2] <- "STANDING"
  } else {
    full_data[i,2] <- "LAYING"
  }
}

## FIFTH, Use a descriptive variable name for each variable
## To make it easier to summarize, we'll remove parens from the names as well
pre_clean_names<-as.character(test1.names$V2)
clean_names<-sub("\\()","",pre_clean_names)
clean_names<-gsub("-","_",clean_names)
colnames(full_data) <- c("Subject", "Activity", clean_names)

## and Last, we will create a tidy data set with the mean for each variable
## we will expect 180 rows (30 participants x 6 activities each) and 81 columns
grouped_data<-group_by(full_data, Subject, Activity)
tidy_data<-summarise_each(grouped_data,funs(mean))

## Finally, we'll write the text to an output file 
write.table(tidy_data, file="mytidydata.txt",row.names=F)