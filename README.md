# CleanDataWeek4Assignment

This directory contains the following files: run_analysis.R
Run_analysis.R performes the following tasks:
  Reads in the test and training data sets 
  Merges the training and test data sets to create one data set
  Extracts only measurements corresponding to means and standard deviations
  Uses descriptive names for the column names and activity names
  The final dataframe after step 4 has the variable name: alldata3b and is saved as "DataSet-Step4.csv"
  A second independent tidy data set is produced with the average of each variable for each activity and subject
  The variable name after step5 is called "alldata4" and is saved as "DataSet-Step5.csv"
  
  The following input file is used by Run_analysis.R: "colnames.txt", which contains a list of descriptive column names
  
  The following data files must be read in by the code and should be located in the directory "UCIHARDataset" (spaced removed)
  Data files to be read in are::
     ./test/subject_test.txt
     ./test/X_test.txt
     ./test/y_test.txt
     ./train/subject_train.txt
     ./train/X_train.txt 
     ./train/y_train.txt
    
  These packages should be installed to run this code:
    dplyr
    data.table
    
