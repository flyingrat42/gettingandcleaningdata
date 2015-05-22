run_analysis <- function () {
  
  # Some initial package/library wrangling.
  #install.packages("data.table")
  library(data.table)
  
  # Store location of current/original working directory
  origWD <- getwd()
  
  # Create working directory and switch to it  
  workingDir <- "wearableData"
  if (!file.exists(workingDir)) {dir.create(workingDir)}
  setwd(workingDir)
  
  # Download raw dataset and unzip it
  #zipURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  #zipFileName <- "UCI_HAR_Dataset.zip"
  #download.file(zipURL,zipFileName,mode="wb")
  #unzip(zipFileName)
  
  rawDataDir <- "UCI HAR Dataset"
  
  # Read feature labels (column names)
  featureLabels <- read.csv(file.path(rawDataDir,"features.txt"),header=FALSE,sep="",colClasses=c("integer","character"))
  
  # Read activity labels, and give the resulting data frame (lookup table) some descriptive column names
  activityLabels <- read.csv(file.path(rawDataDir,"activity_labels.txt"),header=FALSE,sep="",colClasses=c("integer","character"))
  names(activityLabels) <- c("ActivityID","activity")
  
  # Read the training data, training activities, and training subjects)
  trainData <- read.csv(file.path(rawDataDir,"train","X_train.txt"),header=FALSE,sep="")
  trainActivities <- read.csv(file.path(rawDataDir,"train","y_train.txt"),header=FALSE)
  trainSubjects <- read.csv(file.path(rawDataDir,"train","subject_train.txt"),header=FALSE)
  
  # Cbind the training datasets together
  allTrainData <- cbind(trainSubjects,trainActivities,trainData)
    
  # Read the test data, test activities, and test subjects)
  testData <- read.csv(file.path(rawDataDir,"test","X_test.txt"),header=FALSE,sep="")
  testActivities <- read.csv(file.path(rawDataDir,"test","y_test.txt"),header=FALSE)
  testSubjects <- read.csv(file.path(rawDataDir,"test","subject_test.txt"),header=FALSE)
  
  # Cbind the test datasets together
  allTestData <- cbind(testSubjects,testActivities,testData)
  
  # Now that we have both the test and training datasets, rbind them together
  allData<-rbind(allTestData,allTrainData)
  
  # Do some cleanup of old data frames we no longer need
  rm(trainData,trainActivities,trainSubjects)
  rm(testData,testActivities,testSubjects)
  rm(allTestData,allTrainData)
  
  # Set names on the combined test and training dataset
  # The first two columns (subject and activity ID) we added -- 
  #  the remaining columns are from the featureLabels data frame
  names(allData) <- c("subject","ActivityID",featureLabels[,2])
  
  # Get the column indices from the columns we care about, and store in the targetCols vector.
  # We want the first two columns (subject and activityID), plus any other columns with "mean" or "std" in the name.
  # (The mean/std columns could be pared down further, but this errs on the side of inclusiveness.)
  targetCols <- sort(
    unique(
      c(1,
        2,
        grep("mean",names(allData),ignore.case=TRUE),
        grep("std",names(allData),ignore.case=TRUE)
        )))
  
  #Using the column indices in targetCols, extract the columns we care about into meanAndStdData.
  meanAndStdData <- allData[,targetCols]
  
  # Now label the activities descriptively, by merging this frame with the activityLabels one
  mergedData <- merge(meanAndStdData,activityLabels,by.x="ActivityID",by.y="ActivityID")
  
  # At this point we want to reorder the columns so that the subject and activity are at left, and the activity ID is dropped
  idcols <- c("subject","activity")
  dropcols <- c("subject","activity","ActivityID")
  cols <- c(idcols,names(mergedData)[-which(names(mergedData) %in% dropcols)])
 
  # resortedData will be a data frame containing the columns we care about in a convenient order.
  resortedData <- mergedData[cols]
  
  # Create the tidy set - this is done via aggregate by the subject and activity columns
  tidySet <- aggregate(x=resortedData[,-c(1:2)],by = list(subject = resortedData$subject, activity = resortedData$activity), FUN="mean")
  
  # Changed the names on the tidy set to prepend "mean-" to the mean variables
  names(tidySet) <- c(names(tidySet)[1:2],paste("mean-",names(tidySet[-c(1,2)]),sep=""))

  
  # Some more cleanup
  rm(allData,mergedData,meanAndStdData)
  
  # restore original working directory
  setwd(origWD)
  
  # concat the results into a list and return them together
  final <- list(resortedData,tidySet)

  final
}
