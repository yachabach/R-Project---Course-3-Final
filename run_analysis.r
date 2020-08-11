## run_analysis does the following:
## 
## 	Merges the training and the test sets to create one data set.
## 	
##	Extracts only the measurements on the mean and standard deviation for
##	each measurement.
##	
##	Uses descriptive activity names to name the activities in the data set
##	
##	Appropriately labels the data set with descriptive variable names.
##	
##	From the data set in step 4, creates a second, independent tidy data set
##	with the average of each variable for each activity and each subject.
##	
## It requires the working directory contain the directory "UCI HAR Dataset".
## After it verifies the existence of that directory it does not check for the
## existence of any other files.
## 
## 
run_analysis <- function() {

        if (!file.exists("./UCI HAR Dataset")) stop("UCI HAR Dataset not in 
        working directory.")
        
        ##Build a list of appropriate variable names
        
     varfile <- "./UCI HAR Dataset/features.txt"
     vardt <- fread(varfile)
     filteredvarnames <- vardt[grep(".*[Mm]ean|.*std", vardt$V2),]
     
     ## Create data tables containing only the desired variables
     ## 
     
     test_file <- "./UCI HAR Dataset/test/X_test.txt"
     train_file <- "./UCI HAR Dataset/test/X_train.txt"
     X_test <- fread(test_file, select = filteredvarnames$V1)
     X_train <- fread(train_file, select = filteredvarnames$V1)
     
     ## Read in Activity labels and apply them to the y_train and y_test
     ## activity files and turn the activity labels into factors in the proper
     ## order.
     ## 
     
     act_file <- "./UCI HAR Dataset/activity_labels.txt"
     y_train_file <- "./UCI HAR Dataset/train/y_train.txt"
     y_test_file <- "./UCI HAR Dataset/test/y_test.txt"
     
     activity_labels <- fread(act_file)
     y_train <- fread(y_train_file)
     y_test <- fread(y_test_file)
     
     y_train <- left_join(y_train,activity_labels)
     y_test <- left_join(y_test,activity_labels)
     
     y_train$V2 <- factor(y_train$V2, levels = activity_labels$V2)
     y_test$V2 <- factor(y_test$V2, levels = activity_labels$V2)
     
     
     ## Read in the subject files and append them to the activity tables
     ## 
     
     s_train_file <- "./UCI HAR Dataset/train/subject_train.txt"
     s_test_file <- "./UCI HAR Dataset/test/subject_test.txt"
     
     s_train <- fread(s_train_file)
     s_test <- fread(s_test_file)
     
     sy_train <- s_train[, Activity:=y_train$V2]
     
}