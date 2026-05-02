## Data:

The data used in this repo is from Human Activity Recognition Using Smartphones.

Variables:

As the list of variables is very long some of the variable are given below.

subject_id: This variable identifies different subjects for which the measurement are done

activity: This variable contains the activities performed by the subjects.

tbodyacc_mean_x: It is the mean of acceleration along x axis of the body. The mean is taken for measurement between a set interval.

tbodyacc-std-y: It is the standard deviation of body acceleration along y axis.

All of the remaining variable are in this form first is the first is the measurement then a calculation is performed like mean, max, min in regular intervals then lastly there is the axis. The variable names are in the form of measurement_calculation_axis.

## Transformation:

First measurement data is loaded from test and train into a list which are then combined into a data frame.

Names are loaded from feature which are first cleaned to remove the leading numbers then empty spaces are removed. Then it is added to the columns of the data data frame then from janitor package cleans_names is applied to the columns to clean the names so that it follow tidy data guidelines.

Subjects id is loaded from the y_test and y_train files then it is added to the data data frame.

Activities are given descriptive names.

mean and std columns of the data frame along with activities and subject_id is separated into an independent data frame.

The mean_and_std data frame is grouped by subjects then by the activity they performed for further analysis.

The grouped data frame is summarized using mean so that we can have a mean for every measurement based on the subjects and the activity they performed
