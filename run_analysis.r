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
        
     varfile <- "./UCI HAR Dataset/features.txt"
     vardt <- fread(varfile)
     filteredvarnames <- vardt[grep(".*[Mm]ean|.*std", vardt$V2),]
}