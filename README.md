#Getting And Cleaning Data Course Project 
Aleksandr Cherkashin, Moscow, Russia, 2014.

##Purpose
The goal of this project is to
  1. combine different sets of raw data
  2. extract only mean and standart deviation values from measurments
  3. convert data to tidy form
  4. make a separate aggregated dataset with mean of previosly extracted values by activities and subjects 

##Data
Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data is already downloaded and stored in "./UCI HAR Dataset" folder.

Check "./UCI HAR Dataset/README.txt" for the info about dataset.

Variable names in processed data is taken from raw data set: "./UCI HAR Dataset/features.txt". They desribed at "./UCI HAR Dataset/features_info.txt".

In the original war dataset the data is splited in 2 parts: train and test.

For the purpose of cours project we uses only data in files:

  * "./UCI HAR Dataset/train/X_train.txt" - measurments of train data part
  * "./UCI HAR Dataset/test/X_test.txt" - measurments of test data part
  * "./UCI HAR Dataset/train/y_train.txt" - activity id for train data part
  * "./UCI HAR Dataset/test/y_test.txt"  - activity id for test data part
  * "./UCI HAR Dataset/activity_labels.txt" - activity labels to substitute activity id in combined dataset with selfdesribing names
  * "./UCI HAR Dataset/train/subject_train.txt" - subject ids of train part
  * "./UCI HAR Dataset/test/subject_test.txt" - and subject ids of test part, both to be concateneiting with main dataset
  * "./UCI HAR Dataset/features.txt" - variable names (wich will aggregate later)

## Achieving the goal
All the work is done by R script: "run_analysis.R". See comments at the code for details. 

In general it 
 1. combines train and test data part into one
 2. drops all but mean and std values
 3. adds variable names from features.txt
 4. adds subjects ids
 5. substitute activity ids with readable labels
 6. melts data into narrow data form and casts back to wide form with mean() aggregation by activities and subjects.
 7. writes the result to tidyData.txt with write.table() and default sep=" ".

While exctarting mean and standart deviation values, is tooks only variables with "mean()" and "std()" strings in names, dropping others. Also dropping additional variables with "Mean" in the name (like "gravityMean") because this variables do not contain means of the measurments.

Information about variables could be found in the CODEBOOK.md
