Course 3 Final Project Codebook

From the instructions in the assignment:

        - GitHub contains a code book that modifies and updates the available 
        codebooks with the data to indicate all the variables and summaries 
        calculated, along with units, and any other relevant information.
        
The assignment asks for an analysis on the MEAN and STD of all variables.  We'll
use text manipulation on "features.txt"" to find all the proper
variables.  

        - filteredvarnames - data.table - only names with "mean" or "std"
                - V1 - variable index
                - V2 - variable names

Create data tables of only the required fields and change
column names appropriately in both "X_test.txt" and "X_train.txt".  

        - X_test - data.table of test data
        
        - X_train - data.table of training data

The activity files "y_test.txt" and "y_train.txt" are left joined with
"activity_labels.txt" to make the output more readable.  

        - activity_labels - data.table of activity labels and thier index
                V1 - index
                V2 - label (e.g. WALKING, STANDING, etc.)
                
        - y_test_act - joined y_test with activity labels
        
        - y_train_act - joined y_train with activity labels
        
The "y_" files are single-column files of data.  They are the exact length as
the "X_" files and the "subject_" files.  I assumed, since there is no index 
available, that the resulting data.table(s) can be appended.

"subject_train.txt" and "subject_test.txt" are appended with the appropriate
activity (y) table and then with the respective data (X) table.

        - s_train - subject training data.table
        
        - s_test - subject test data.table
        
        - sy_test - appended activity and subject test files
        
        - sy_train - appended activity and subject train files
        
        - full_test_dt - X_test appended with sy_test 
        
        - full_train-dt - X_train appended with sy_train
        
With these tidy data tables we can order, group, and take the mean of each col.

Script Dependencies

data.table
dplyr

Selecting Variables

The assignment asks for only "mean" and "std" variables of all measurements.  We
filter all names for only names containing "mean" or "std".  This results in 86
column names

        varNames - data table read from "features.txt"
                V1 - column number
                V2 - feature name
                
        filteredvarnames <- varNames[grep(".*[Mm]ean|.*[Ss]td",V2),]
                V1 - column number
                V2 - feature name (only contains "mean" or "std")
        
Read only the desired columns with fread
        
        tst <- fread("./train/x_train.txt", select = filteredvarnames$V1)
        
We'll improve readability by adding words to "activity.txt".  We do this by
using left-join on "activity_levels" and both "y_train" and "y_test" 

        readable_activity_variable <- left_join(y_train, activity_levels)
        
        