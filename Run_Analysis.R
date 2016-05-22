
#load library
library(reshape2)

Xtrain <- read.table("train/X_train.txt")
Ytrain <- read.table("train/y_train.txt")
Subtrain <- read.table("train/subject_train.txt")

Xtest <- read.table("test/X_test.txt")
Ytest <- read.table("test/y_test.txt")
Subtest <- read.table("test/subject_test.txt")

# create 'x' data set
Xdata <- rbind(Xtrain, Xtest)

# create 'y' data set
Ydata <- rbind(Ytrain, Ytest)

# create 'subject' data set
Subdata <- rbind(Subtrain, Subtest)


features <- read.table("features.txt")

# get only columns with mean() or std() in their names
meanandstd <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
Xdata <- Xdata[, meanandstd]

# correct the column names
names(Xdata) <- features[meanandstd, 2]


activities <- read.table("activity_labels.txt")

# update values with correct activity names
Ydata[, 1] <- activities[Ydata[, 1], 2]

# correct column name
names(Ydata) <- "activity"

#load the plyr library
library(plyr)


# correct column name
names(Subdata) <- "subject"

# bind all the data in a single data set
all_data <- cbind(Xdata, Ydata, Subdata)

# Step 5
# Creating an tidy data set with the average of each variable
# for each activity and each subject
###############################################################################
library(dplyr)
# 66 <- 68 columns but last two (activity & subject)
tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(tidy_data, "tidydata.txt", row.name=FALSE)
