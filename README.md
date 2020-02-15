The uploaded project contains the following 3 file:
  1. This README
  2. cook book
  3. run_analysis.R
  
run_analysis.R contains the working script that reads all the necessary files and then performs the merging of the tables, extraction of the needed columns, and calculatiion of the average values for each variable grouped by each subject and each activity. The commnets in the script describe all the steps from the reading tables to the final reuslt.
  1. read the tables
  2. combine train test
  3. add column name
  4. extract columns with mean() and std(), and combine the tables into one
  5. use newid defined as subject * 10 + activity as the key for each subject and each activity
  6. calculate the mean for each feature of each subject and each activity based on the key (newid)
  7. create data frame from the arrays of the calculated means

The columns details are logged in the cook book.