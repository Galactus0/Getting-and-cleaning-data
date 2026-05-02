In Getting and cleaning repo the following files are contained.

getting and cleaning data.R which mergers the different data into one data frame then descriptive variable names are given a new data frame is created from the existing one and then the mean of the values are calculated in the new data frame.

Codebook.md file contains the information about the variable and the transformation done to the data.

UCI HAR Dataset folder contains the file which the getting and cleaning data.R script uses to performe different kinds of processes.

## Transformation:

First measurement data is loaded from test and train into a list which are then combined into a data frame.

Names are loaded from feature which are first cleaned to remove the leading numbers then empty spaces are removed. Then it is added to the columns of the data data frame then from janitor package cleans_names is applied to the columns to clean the names so that it follow tidy data guidelines.

Subjects id is loaded from the y_test and y_train files then it is added to the data data frame.

Activities are given descriptive names.

mean and std columns of the data frame along with activities and subject_id is separated into an independent data frame.

The mean_and_std data frame is grouped by subjects then by the activity they performed for further analysis.

The grouped data frame is summarized using mean so that we can have a mean for every measurement based on the subjects and the activity they performed
