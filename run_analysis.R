#############################################
# Load datasets
#############################################

# Subjects Values (subject_id)
subject_test <- read.csv(file = "test/subject_test.txt", header = FALSE, sep=' ')
subject_train <- read.csv(file = "train/subject_train.txt", header = FALSE, sep=' ')
# Activities Values (activity_id)
y_train <- read.csv(file = "train/y_train.txt", header = FALSE, sep=' ')
y_test <- read.csv(file = "test/y_test.txt", header = FALSE, sep=' ')
# Activity Labels (eg.: 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING)
activity_labels <- read.csv(file = "activity_labels.txt", header = FALSE, sep=' ')
names(activity_labels) <- c("activity_id", "activity_desc")
# Features (eg.: 1 tBodyAcc-mean()-X, 2 tBodyAcc-mean()-Y, 3 tBodyAcc-mean()-Z), etc)
features <- read.csv(file = "activity_labels.txt", header = FALSE, sep=' ')
names(features) <- c("feature_id", "feature_desc")

#############################################
# Merge Datasets 
#############################################

# Subjects (test + train)
subjects <- rbind(subject_test, subject_train)
names(subjects) = c("subject_id")
# Activities (test + train)
activities <- rbind(y_test, y_train)
names(activities) = c("activity_id")
# Subjects + Activities
res <- cbind(subjects, activities)
temp_tidy <- sqldf('select r.subject_id subject, al.activity_desc activity from res r, activity_labels al where r.activity_id = al.activity_id')


