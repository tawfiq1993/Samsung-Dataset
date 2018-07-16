# THE FOLLOWING IS THE CODE BOOK FOR THE RUNING THE ANALYSIS ON THE SAMSUNG DATA

THE run_Analysis.R CODE SHOULD BE RUN BY DOWNLOADING THE FILE TO CURRENT DIRECTORY

## THE DESCRIPTION OF THE VARIABLES

- Data <-extracts the current directory and sets it the UCI DATA SET folder as working directory
- column_names <- reads all the features of the data set
- x_test <- reads all the test set
- y_test <- reads all the test labels
- subject_test <- reads all the subjects who performed the test data
- c_test <- test data frame
- x_train <- reads all the train set
- y_train <- reads all the train labels
- subject_train <- reads all the subjects who performed the training data
- c_train <- training data frame
- complete_database <- Combined test and training data
- Activity_labels <- all the names of the activities measured
- Required_columns <- all the required mean() and std() columns
- subset_dataset <- subsetted data frame with all the required columns
- Final_data <- final data set after performing the summarize function
