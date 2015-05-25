# Load "mean" and "standard deviation" features
features <- read.table("features.txt", col.names=c("FeatureID", "FeatureName"), header=F, as.is=T)
features_ms <- features[grep('mean|std',features$FeatureName),]

# Load the activity labels
activity_labels <- read.table("activity_labels.txt", header=F, as.is=T)
colnames(activity_labels) <- c("ActivityID", "ActivityName")

# Load the subjects (An ID which represents a volunteer)
data_subject_test <- read.table("test/subject_test.txt", header=F, as.is=T)
data_subject_train <- read.table("train/subject_train.txt", header=F, as.is=T)
data_subject <- rbind(data_subject_test, data_subject_train)
colnames(data_subject) <- c("Subject")

# Load measurements (just "mean" and "standard deviation")
data_x_test <- read.table(file = "test/X_test.txt")
data_x_train <- read.table(file = "train/X_train.txt")
data_x <- rbind(data_x_test, data_x_train)
colnames(data_x) <- features$FeatureName
data_x_subset <- data_x[,features_ms$FeatureName]

# Load the activities related to each measurement
data_y_test <- read.table(file = "test/Y_test.txt")
data_y_train <- read.table(file = "train/Y_train.txt")
data_y <- rbind(data_y_test, data_y_train)
colnames(data_y) <- c("ActivityID")
data_y_named <- merge(data_y, activity_labels)
data_y_named$ActivityID = NULL

# Merge all datasets
tidy_data <- cbind(data_subject, data_y_named, data_x_subset)

