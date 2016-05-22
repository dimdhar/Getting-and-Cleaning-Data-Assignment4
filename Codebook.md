# Code Book

The script "run_analysis.R" performs folliwing steps and generates a final file named "tidydata.txt"

* First, all the similar data is merged using the "rbind()" function. 
* Only columns with the mean and standard deviation measures are taken from the whole dataset. 
* After extracting these columns, they are given the correct names, taken from "features.txt".
* Activity names and Ids are taken from "activity_labels.txt" and substituted in the dataset.
* On the whole dataset, those columns with vague column names are corrected.
* Finally, a new dataset is generated and output file is called tidydata.txt.

# 

* "Xtrain", "Ytrain", "Xtest", "Ytest", "Subtrain" and "Subtest" contain the data from the downloaded files.
* "Xdata", "Ydata" and "Subdata" merge the datasets for further analysis.
* "features" contains the correct names for the "Xdata" dataset, which are applied to the column names stored in "meanandstd",
    a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the "activities" variable.
* all_data" merges "Xdata", "Ydata" and "Subdata" in a big dataset.
* Finally, "tidy_data" contains the averages which are stored in a "tidydata.txt" file. 
  "ddply()" from the plyr package is used to apply "colMeans()" and ease the development.
