# Course Project, Getting and Cleaning Data
* Session: May 2015
* User: flyingrat42

# Purpose
The attached run_analysis.R script produces a tidy dataset from the publicly-available Human Activity Recognition Using Smartphones dataset, version 1.0.

The tidy dataset contains an average per subject and activity for each of 88 original mean or standard deviation variables in the original dataset.  

For more info on the variables, see CodeBook.md.

# Running the Script

The script presumes that the original dataset (which unzips into the folder "UCI HAR Dataset") is in the working directory.

To run:

    tidyData <- run_analysis() 

where tidyData is a "tidy" data frame as above.

