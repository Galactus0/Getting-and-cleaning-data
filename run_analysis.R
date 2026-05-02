library(dplyr)
library(tidyr)
library(stringr)
library(purrr)
library(janitor)

## reading column names from labels file for descriptive variable names
column_name <- readLines("UCI HAR Dataset/features.txt") %>% 
                str_split(pattern = "^\\d+") %>% unlist ## removing leading numbers 
                                                        ## and making a vector
column_name <-  column_name[column_name != ""] ## removing empty spaces

## loading paths for different columns from different for reading and combining into one data frame
measure_paths <- c("UCI HAR Dataset/test/X_test.txt","UCI HAR Dataset/train/X_train.txt")
subject_paths <- c("UCI HAR Dataset/test/subject_test.txt", "UCI HAR Dataset/train/subject_train.txt")
activity_path <- c("UCI HAR Dataset/test/y_test.txt","UCI HAR Dataset/train/y_train.txt")

# creating data frame containing the measurement and giving the variable names
data <- measure_paths %>% map_df(~read.table(.x,col.names = column_name))
data <- clean_names(data) # cleaning names of columns using janitor package
                          # to remove dots

## reading subject columns and activity columns into variables to be added to
## the combined data
subject <- subject_paths %>% map_df(~read.table(.x))
activity_1 <- activity_path %>% map_df(~read.table(.x))


## adding the above columns to the combined data
data <- mutate(data, subject_id = subject$V1, .before = 1)
data <- mutate(data, activity = activity_1$V1, .before = 1)
## changing the activity id into descriptive names
data <- data %>% mutate(activity = recode(activity,
                           `1` = "Walking",
                           `2` = "Walking_Upstairs",
                           `3` = "Walking_Downstairs",
                           `4` = "Sitting",
                           `5` = "Standing",
                           `6` = "Laying"))

## separating the mean and standard deviation measurement into separate data frame
mean_and_std <- data %>% select(activity, subject_id, contains(c("mean","std")))
## Grouping by subject then activity and averaging the measurement of each variable
average <- mean_and_std %>% group_by(subject_id,activity) %>%
            summarise(across(everything(),mean) , .groups = "drop_last")