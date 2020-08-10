Course 3 Final Project Codebook

From the instructions in the assignment:

        - GitHub contains a code book that modifies and updates the available 
        codebooks with the data to indicate all the variables and summaries 
        calculated, along with units, and any other relevant information.
        
The assignment asks for an analysis on the MEAN and STD of all variables.  We'll
use text manipulation on "column names"features.txt"" to find all the proper
variables.  

Then we'll create data tables of only the required fields and change
column names appropriately in both "X_test.txt" and "X_train.txt".  

The activity files "y_test.txt" and "y_train.txt" are left joined with
"activity_labels.txt" to make the output more readable.  Activity labels are
read in as factors

"subject_train.txt" and "subject_test.txt" are combined with the appropriate
activity (y) table and then with the respective data (X) table.

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
        
        