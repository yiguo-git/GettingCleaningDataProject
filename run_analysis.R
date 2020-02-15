## the path to the 4 files and feature names
filePath <- c(".\\UCI HAR Dataset\\test\\X_test.txt", ".\\UCI HAR Dataset\\test\\y_test.txt",
              ".\\UCI HAR Dataset\\train\\X_train.txt",".\\UCI HAR Dataset\\train\\y_train.txt")
featurePath <- ".\\UCI HAR Dataset\\features.txt"
subjectTrainPath <- ".\\UCI HAR Dataset\\train\\subject_train.txt"
subjectTestPath <- ".\\UCI HAR Dataset\\test\\subject_test.txt"

## read the tables
X_train <- read.table(filePath[[3]])
X_test <- read.table(filePath[[1]])
y_train <- read.table(filePath[[4]])
y_test <- read.table(filePath[[2]])
features <- read.table(featurePath, sep = " ")
subjectTrain <- read.table(subjectTrainPath)
subjectTest <- read.table(subjectTestPath)

## combine train test
y_all <- rbind(y_train, y_test) ## combine activity train test
X_all <- rbind(X_train, X_test) ## combine feature train test
subject <- rbind(subjectTrain, subjectTest) ## combine subject train test

## add column name
names(X_all) <- features[[2]] ## add column names to feature table
names(y_all) <- "activity"    ## add column name to activity table
names(subject) <- "subject"   ## add column name to subject table

## combine the tables for step 4
X_all2 <- X_all[,grep("mean\\(|std\\(", names(X_all))] ## get only mean() and std() columns
df_all <- cbind(X_all2, subject, y_all) ## combine the tables

## use newid as the key for each subject and each activity
df_all$newid <- df_all$subject * 10 + df_all$activity

## calculate the mean for each feature of each subject and each activity
temp_array <- tapply(df_all[[1]], df_all$newid, mean)
for (n in seq(2, ncol(df_all)-1))
  temp_array <- cbind(temp_array, tapply(df_all[[n]], df_all$newid, mean))

## create data frame from the calculated means
df_result <- data.frame(temp_array)
names(df_result) <- names(df_all)[1:(ncol(df_all)-1)] ## add column names

print("Finish")


