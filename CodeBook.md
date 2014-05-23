Getting and Cleaning Data Course Project
========================================
## Dataset for Human Activity Monitoring

Last modified by Xuan Kong on May 23, 2014

This dataset is created based on Human Activity Recognition Using Smartphones Dataset.  A full description of the dataset is available at the site

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset can be obtained via the following link

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Background
The original experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

Various features were calculated in the original data and more information can be found in the file features_info.txt.

### Data Description
The dataset is a space delimited text file. Columns are appropriated labeled. 

First column indicates the activity engaged by test subjects and second column is the subject id.

Subsequent columns contain the average of all measurement values available for the activity and subject corresponding in the first two columns. Features as indicated by the column header can be interpreted as follows:
* First letter t or f indicates the original feature is a time domain or a frequency domain feature
* Descriptor following either "t" or "f" but before the first "." describes the physical meaning of the measured signals. For more information about the physical interpretation of the signals, please refers to "feature_info.txt" (copied from original data source) in this directory.
* mean or std designation.  The mean and standard deviation of the original signals were calculated for multiple trials and provided for all six activity types and 30 subjects. In other words, multiple mean and standard deviation values are available for each activity-subject combination from the original datasets.  The average of the mean or standard deviation measurements is reported as the column value in this dataset.  Average is calculated for each activity and subject combination as indicated in the first two columns of the same row.
* direction designation. The last part of the column names (if applicable) indicates the X, Y, Z direction in a three-dimensional space.

### R Code Used
R code used to generate this dataset based on original datasets can be found in run_analysis.r A R markdown file call run_analysis.r is also provided with more detained explaination of various steps involved in creating the dataset.