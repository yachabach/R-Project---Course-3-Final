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
        
We will rbind these two tables for one large tidy data table.  Then we can
order, group, and take the mean of each col.

        - rslt - Tidy data table:
                - of mean mean readings
                - of the mean std readings
                - grouped by Subject and Activity
                - Ordered by Subject and Activity

Script Dependencies

data.table
dplyr

