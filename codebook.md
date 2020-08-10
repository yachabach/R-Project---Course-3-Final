Course 3 Final Project Codebook

From the instructions in the assignment:

        - GitHub contains a code book that modifies and updates the available 
        codebooks with the data to indicate all the variables and summaries 
        calculated, along with units, and any other relevant information.
        
The assignment asks for an analysis on the MEAN and STD of all variables.  We'll
use text manipulation techniques on column names to find all the proper 
variables.  Then we'll create data tables of only the required fields and change
column names appropriately in both the test and the training data files.  We'll 
join participant and activity data to the two data tables then merge the result 
with each other to create one tidy data table.

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
        
        