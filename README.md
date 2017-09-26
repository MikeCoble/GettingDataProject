# GettingDataProject

This file explains the analysis files: how all the scripts work and how they are connected.

There is just one script file: run_analysis.R.

It expects all data files to be in the working directory.  Specifically, it uses these files:

* activity_labels.txt
* features.txt
* test (folder)
  * subject_test.txt
  * X_test.txt
  * y_test.txt
* train (folder)
  * subject_train.txt
  * X_train.txt
  * y_train.txt 


run_analysis.R: 
* reads the list of "features" (i.e., the names of the data variables that appear in the main data files).
* reads the list of "activity labels" -- these are the strings that indicate the human activity happening at the time of observations
	* converts the "activity labels" to lower case
* for each of the training and test data sets:
	* read the subject id corresponding to each observation
	* read the activity code corresponding to each observation
		* convert the activity code to the activity labels as a factor
	* read 561 pieces of data for each observation
		* rename the first 6 columns (the only ones we use) to simpler & tidier names
			* xmean, ymean, zmean, xstd, ystd, zstd
	* bind the subject id column, the 1st 6 data columns, and the activity column into a single data set
* binds (the rows of) the train and test data frames into the full data frame
* creates a tidy summary grouped by activity and subject and showing the means
* saves that tidy summary as a .txt file with write.table()

The tidy summary is written to the working directory (see CodeBook.md for details)