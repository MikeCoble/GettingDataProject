## Code Book: 'Getting and Cleaning Data' Course Project by Mike Coble

This code book describes the variables, the data, and the transformations/work I performed to clean up the data.

The data for the project came from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

I downloaded and unzipped the data to a local directory.  This had these files and directories:

* activity_labels.txt
* features_info.txt
* features.txt
* README.txt
* test (folder)
  * Inertial Signals (folder)
  * subject_test.txt
  * X_test.txt
  * y_test.txt
* train (folder)
  * Inertial Signals (folder)
  * subject_train.txt
  * X_train.txt
  * y_train.txt 
  
After reviewing the data and the Coursera discussions I decided to ignore the data in the Inertial Signals folders.

The X_test.txt and X_train.txt files contain 561 columns/variables of data.  Since I barely understood the first few, I decided to limit my work to just the first six variables:

tBodyAcc-X-mean()
tBodyAcc-Y-mean()
tBodyAcc-Z-mean()
tBodyAcc-X-std()
tBodyAcc-Y-std()
tBodyAcc-Z-std()

These are all time domain variables (but I don't really know what that means) captured at a constant rate of 50 Hz.  They come from the accelerometer and were estimated from raw data to be the body acceleration signal.

I think each observation of the variables represent the mean and standard deviation over 128 readings (2.56 seconds at 50 readings per second).  In each of the three dimensions: X, Y and Z.

Unfortunately, I have no idea what the units are.  Since it is acceleration I assume distance/time squared.  But there is also a note that "Features are normalized and bounded within [-1,1]."  So I don't know if any units are meaningful.

The run_analysis.R file contains the R code to process the data and create a tidy data set called summary.txt.
(See README.md for details.)

The tidy data set summary.txt contains 8 variables and 10,299 observations.
The variables are:
* subject -- the id number of the subject observed (1 to 30)
* xmean -- the mean over a 2.56 sec window of the x component of the body's estimated acceleration vector
* ymean -- the mean over a 2.56 sec window of the y component of the body's estimated acceleration vector
* zmean -- the mean over a 2.56 sec window of the z component of the body's estimated acceleration vector
* xmean -- the standard deviation over a 2.56 sec window of the x component of the body's estimated acceleration vector
* xmean -- the standard deviation over a 2.56 sec window of the y component of the body's estimated acceleration vector
* xmean -- the standard deviation over a 2.56 sec window of the z component of the body's estimated acceleration vector
* activity -- the manually recorded activity during the 2.56 sec window (factor)
	* walking
	* walking_upstairs
	* walking_downstairs
	* sitting
	* standing
	* laying
