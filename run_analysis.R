library(readr)
library(dplyr)

## Read the lists of features and activities
features <- read_table2("features.txt", col_names=c("id", "feature"))

activity_labels <- read_table2("activity_labels.txt", col_names = c("id","activity"))
activities <- tolower(activity_labels$activity)

## Read the training data set
subject_train <- read_table2("train/subject_train.txt", col_names = c("subject"))

y_train <- read_table2("train/y_train.txt", col_names = c("activity"))
y_train$activity <- factor(y_train$activity, labels=activities)

X_train <- read_table("train/X_train.txt",  col_names=features$feature)
colnames(X_train) <- c("xmean","ymean","zmean","xstd","ystd","zstd")

train <- cbind(subject_train, X_train[,1:6], y_train)

## Read the test data set
subject_test <- read_table2("test/subject_test.txt", col_names = c("subject"))

y_test <- read_table2("test/y_test.txt", col_names = c("activity"))
y_test$activity <- factor(y_test$activity, labels=activities)

X_test <- read_table("test/X_test.txt", col_names=features$feature)
colnames(X_test) <- c("xmean","ymean","zmean","xstd","ystd","zstd")

test <- cbind(subject_test, X_test[,1:6], y_test)

## Merge the training and test data
full <- rbind(train, test)

## Create a summary grouped by activity and subject and showing the means
summary <- full %>%
  group_by(activity, subject) %>%
  summarize(xmean=mean(xmean), ymean=mean(ymean), zmean=mean(zmean), xstd=mean(xstd), ystd=mean(ystd),zstd=mean(zstd))

write.table(summary, file="summary.txt", row.names=FALSE)