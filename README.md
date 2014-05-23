Getting and Cleaning Data Course Project
========================================
Readme File, last modified by Xuan Kong on May 23, 2014

This directory contains all required documents/data files to fulfill "Getting and Cleaning Data" course requirements.

Directory "UCI HAR Dataset" contains original datasets provided. More information can be obtained from website 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In order to run the R script "run_analysis.R" properly, make sure that the data directory "UCI HAR Dataset" is in the directory containing the "run_analysis.R".

A R-markdown version of the same script can be found at run_analysis.Rmd

CodeBook.md provides an explaination of the dataset generated with run_analysis.R

tidyData.txt is the space delimited data set (created by run_analysis.R) with the average of each selected measurement over all available values for the corresponding activity-subject combination as indicated in the first two column of the dataset.