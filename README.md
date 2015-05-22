# Course Project, Getting and Cleaning Data
## Session: 
## User: flyingrat42

# Purpose
The attached run_analysis.R script processes the Samsung Galaxy accelerometer dataset available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  It creates a tidy dataset by doing the following:

1. Combining the test and training datasets;
2. Extracting variables on mean and standard deviation;
3. Averaging each variable per user and activity;
4. Adding descriptive data labels.

For more details on the variables, see the "Code Book" below.

# Running the Script

Example:
tidyData <- run_analysis() 

where tidyData is a "tidy" data frame as above.

# Codebook
