# Getting-and-Cleaning-data


Input
-----

Data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Analysis Script
---------------

`run_analysis.R`: this script takes the input data, and creates the output file

The script first downloads the dataset from the above url. 
The script then reads the test and training sets, and combines them.
Then it filters down the mean and std features, and selects only these.
It then builds up a series of labeled columns to represent single variables from the feature. 
And finally it calculates the average of each variable and writes out this data set to `Tidy.txt`


Output
------

* Tidy dataset: `Tidy.txt`


Code Book
---------

`CodeBook.md`: describes the variables, the data, and any transformations or work that was performed to clean up the data
