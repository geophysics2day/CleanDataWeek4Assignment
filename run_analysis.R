setwd("~/R/Rtestproj/UCIHARDataset")  ##Get to the correct folder

##----------------------------------------------------------------
##Read in the test data sets  ## Number of rows: 2947
test_subject <- read.table("./test/subject_test.txt")
test_data <- read.table("./test/X_test.txt")
test_activity_info <- read.table("./test/y_test.txt")

##Read in the train data sets ## Number of rows: 7352
train_subject <- read.table("./train/subject_train.txt")
train_data <- read.table("./train/X_train.txt")
train_activity_info <- read.table("./train/y_train.txt")

##----------------------------------------------------------------
## Merge the training and test sets to create one data set
subj <- rbind(test_subject,train_subject)
data <- rbind(test_data,train_data)
activ <- rbind(test_activity_info,train_activity_info)

alldata <- cbind(subj,activ,data)
colnams <- read.table("colnames.txt")
colnames(alldata) <- colnams[,2]
library(dplyr)
alldata2 <- alldata[order(subj,activ),] ##Arranges data first by subject and then by activity
## alldata2 contains all measurements arranged first by subject and then by activity

##----------------------------------------------------------------
##Extracts only the measurements on the mean and standard deviation for each measurement
alldata3 <- alldata2[grep("[Mm]ean|std",colnams[,2])] ##This contains all mean/standard deviation measurements
alldata3b <- cbind(alldata2[,1],alldata2[,2],alldata3) ##Adding back on the Subject and Activity Columns
## alldata3b contains the subject, activity, and measurements on the mean and standard deviation for each measurement

##----------------------------------------------------------------
## Use descriptive activity names to name activities in the data set
for(i in 1:length(alldata3b[,2])){
  if(alldata3b[i,2]==1){
    alldata3b[i,2] <- "WALKING"
  }
  
  if(alldata3b[i,2]==2){
    alldata3b[i,2] <- "WALKING_UPSTAIRS"
  }
  
  if(alldata3b[i,2]==3){
    alldata3b[i,2] <- "WALKING_DOWNSTAIRS"
  }
  
  if(alldata3b[i,2]==4){
    alldata3b[i,2] <- "SITTING"
  }
  
  if(alldata3b[i,2]==5){
    alldata3b[i,2] <- "STANDING"
  }
  
  if(alldata3b[i,2]==6){
    alldata3b[i,2] <- "LAYING"
  }
}

##---------------------------------------------------------------
## Labels data set with descriptive variable names
names(alldata3b)[1] <- "SubjectNum"
names(alldata3b)[2] <- "ActivityDesc"
## Other columns already have descriptive variable names from a previous step.

write.csv(alldata3b,"DataSet-Step4.csv")
#----------------------------------------------------------------
## Summary:
## "alldata3b" contains test and training data arranged by subject and activity.  
## The activities are descriptive and column names are descriptive.
## Columns containing measurements related to Mean or Standard deviation have been extracted

##---------------------------------------------------------------

## Create second independent tidy data set with average of each variable for each activity and each subject

library(data.table)
alldata4 <- setDT(alldata3b)[,lapply(.SD,mean),by=.(SubjectNum,ActivityDesc),.SDcols=names(alldata3b)[3:88]]
setDF(alldata4)
write.csv(alldata4,"DataSet-Step5.csv")