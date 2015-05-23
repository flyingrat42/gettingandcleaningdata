# Code Book for "Tidy" UCI HAR Dataset

## Original Data

The original dataset for this analysis was the Human Activity Recognition Using Smartphones dataset, version 1.0 [1].  The original dataset is available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  

For more details on the original data and project, consult the README.txt file in the "UCI HAR Dataset" package/directory.


## Processing

This "tidy" dataset was created by doing the following:

1. The original test and training datasets found in the test/ and train/ subdirectories, respectively were combined.  
  * For each of these subsets, the following files were combined by column:
    * subject_train.txt/subject_test.txt: Subject identifiers for each observation.
    * y_train.txt/y_test.txt: Activity identifiers for each observation.
    * X_train.txt/X_test.txt: Full observation data.
  * The test and training datasets were then combined by row into a single data frame.
2. Column names were resolved using the feature_labels.txt file, which indexes columns.
3. Activity names were resolved using the activity_labels.txt file, which indexes activity names to IDs.
4. Columns containing "mean" and "std" were extracted to isolate only the mean and standard deviation variables.  The result was 88 columns instead of 500+.
5. Each variable was averaged per subject (1-30) and activity (six activities total).

## Variables

### Variable Explanations:

Each entry in the tidy dataset is unique to the following two values:
1. Subject: The identifier of the subject, a factor from 1-30.  Subjects were "volunteers within an age bracket of 19-48 years" [1].  
2. Activity: The activity recorded, a factor with the following values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. [1]

Each additional variable is the mean for that subject and activity of all observations in the original dataset.  Accordingly, all variables in the tidy dataset are prefixed with "mean-".  

The original variables had structured names, which are summarized below, and can be used to identify the original variable averaged to produce the tidy "mean-" result. 

Time-domain signals (in seconds): 
* tBodyAcc-X/Y/Z: Body acceleration as measured by the smartphone accelerometer, along the X/Y/Z axis.
* tBodyGyro-X/Y/Z: Body acceleration as measured by the smartphone gyroscope, along the X/Y/Z axis.
* tGravityAcc-X/Y/Z: Gravitational acceleration as measured by the smartphone accelerometer, along the X/Y/Z axis.
* tGravityGyro-X/Y/Z: Gravitational acceleration as measured by the smartphone gyroscope, along the X/Y/Z axis.
* tBodyAccJerk-X/Y/Z: 
* tBodyGyroJerk-X/Y/Z: 
* tBodyAccMag:
* tGravityAccMag:
* tBodyAccJerkMag:
* tBodyGyroMag:
* tBodyGyroJerkMag:

### Full Variable List
1. subject
2. activity: Activity name: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. [1]
3. mean-tBodyAcc-mean()-X: Mean of mean accelerometer measurements of body acceleration along the X-axis.
4. mean-tBodyAcc-mean()-Y: Mean of mean body acceleration along the Y-axis.
5. mean-tBodyAcc-mean()-Z: Mean of mean body acceleration along the Z-axis.
6. mean-tBodyAcc-std()-X: Mean of the standard deviation of body acceleration along the X-axis.
7. mean-tBodyAcc-std()-Y: Mean of the standard deviation of body acceleration along the Y-axis.
8. mean-tBodyAcc-std()-Z: Mean of the standard deviation of body acceleration along the Z-axis.
9. mean-tGravityAcc-mean()-X: Mean of mean gravitational acceleration along the X-axis.
10. mean-tGravityAcc-mean()-Y: Mean of mean gravitational acceleration along the Y-axis.
11. mean-tGravityAcc-mean()-Z: Mean of mean gravitational acceleration along the Z-axis.
12. mean-tGravityAcc-std()-X: Mean of the standard deviation of gravitational acceleration along the X-axis.
13. mean-tGravityAcc-std()-Y: Mean of the standard deviation of gravitational acceleration along the Y-axis.
14. mean-tGravityAcc-std()-Z: Mean of the standard deviation of gravitational acceleration along the Z-axis.
15. mean-tBodyAccJerk-mean()-X
16. mean-tBodyAccJerk-mean()-Y
17. mean-tBodyAccJerk-mean()-Z
18. mean-tBodyAccJerk-std()-X
19. mean-tBodyAccJerk-std()-Y
20. mean-tBodyAccJerk-std()-Z
21. mean-tBodyGyro-mean()-X
22. mean-tBodyGyro-mean()-Y
23. mean-tBodyGyro-mean()-Z
24. mean-tBodyGyro-std()-X
25. mean-tBodyGyro-std()-Y
26. mean-tBodyGyro-std()-Z
27. mean-tBodyGyroJerk-mean()-X
28. mean-tBodyGyroJerk-mean()-Y
29. mean-tBodyGyroJerk-mean()-Z
30. mean-tBodyGyroJerk-std()-X
31. mean-tBodyGyroJerk-std()-Y
32. mean-tBodyGyroJerk-std()-Z
33. mean-tBodyAccMag-mean()
34. mean-tBodyAccMag-std()
35. mean-tGravityAccMag-mean()
36. mean-tGravityAccMag-std()
37. mean-tBodyAccJerkMag-mean()
38. mean-tBodyAccJerkMag-std()
39. mean-tBodyGyroMag-mean()
40. mean-tBodyGyroMag-std()
41. mean-tBodyGyroJerkMag-mean()
42. mean-tBodyGyroJerkMag-std()
43. mean-fBodyAcc-mean()-X
44. mean-fBodyAcc-mean()-Y
45. mean-fBodyAcc-mean()-Z
46. mean-fBodyAcc-std()-X
47. mean-fBodyAcc-std()-Y
48. mean-fBodyAcc-std()-Z
49. mean-fBodyAcc-meanFreq()-X
50. mean-fBodyAcc-meanFreq()-Y
51. mean-fBodyAcc-meanFreq()-Z
52. mean-fBodyAccJerk-mean()-X
53. mean-fBodyAccJerk-mean()-Y
54. mean-fBodyAccJerk-mean()-Z
55. mean-fBodyAccJerk-std()-X
56. mean-fBodyAccJerk-std()-Y
57. mean-fBodyAccJerk-std()-Z
58. mean-fBodyAccJerk-meanFreq()-X
59. mean-fBodyAccJerk-meanFreq()-Y
60. mean-fBodyAccJerk-meanFreq()-Z
61. mean-fBodyGyro-mean()-X
62. mean-fBodyGyro-mean()-Y
63. mean-fBodyGyro-mean()-Z
64. mean-fBodyGyro-std()-X
65. mean-fBodyGyro-std()-Y
66. mean-fBodyGyro-std()-Z
67. mean-fBodyGyro-meanFreq()-X
68. mean-fBodyGyro-meanFreq()-Y
69. mean-fBodyGyro-meanFreq()-Z
70. mean-fBodyAccMag-mean()
71. mean-fBodyAccMag-std()
72. mean-fBodyAccMag-meanFreq()
73. mean-fBodyBodyAccJerkMag-mean()
74. mean-fBodyBodyAccJerkMag-std()
75. mean-fBodyBodyAccJerkMag-meanFreq()
76. mean-fBodyBodyGyroMag-mean()
77. mean-fBodyBodyGyroMag-std()
78. mean-fBodyBodyGyroMag-meanFreq()
79. mean-fBodyBodyGyroJerkMag-mean()
80. mean-fBodyBodyGyroJerkMag-std()
81. mean-fBodyBodyGyroJerkMag-meanFreq()
82. mean-angle(tBodyAccMean,gravity)
83. mean-angle(tBodyAccJerkMean),gravityMean)
84. mean-angle(tBodyGyroMean,gravityMean)
85. mean-angle(tBodyGyroJerkMean,gravityMean)
86. mean-angle(X,gravityMean)
87. mean-angle(Y,gravityMean)
88. angle(Z,gravityMean)

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
