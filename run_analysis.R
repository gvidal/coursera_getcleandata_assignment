library(dplyr)

#Get the data from train and test data sets
train_data_x<-read.table("./train/X_train.txt")
train_data_y<-read.table("./train/y_train.txt")
subject_train<-read.table("./train/subject_train.txt")
test_data_x<-read.table("./test/X_test.txt")
test_data_y<-read.table("./test/y_test.txt")
subject_test<-read.table("./test/subject_test.txt")
#get the activity labels
activity_labels<-read.table("./activity_labels.txt")
#Get the features
features<-read.table("./features.txt")

# Merge both
## 1.Merge data frames into single one
test_data <- cbind(test_data_x, test_data_y, subject_test)
train_data <- cbind(train_data_x, train_data_y,subject_train)

total_data <- rbind(test_data, train_data)

## 2.- Add names to the data (also accomplishes the 4th)
head_names <- as.character(features[,2])
head_names <- append(head_names, "Activity")
head_names <- append(head_names, "Subject")
names(total_data) <- head_names

ptn_mean_std<-"(Mean|mean|Std|std|Activity|Subject)"
names_to_select <- grep(ptn_mean_std,names(total_data),perl=T)
total_data <- total_data[,names_to_select]

# Part 3: Activity labels

for(i in 1:nrow(total_data)){
  n <- total_data[i,"Activity"]
  label <- as.character(activity_labels[activity_labels$V1 == n,]$V2)[1]
  total_data[i,"Activity"] <- label
}

# Part 5
grouped_data <- group_by(total_data, Subject, Activity) %>% 
                  summarise_each(funs(mean))

write.table(a, row.names=FALSE, file="grouped_data.txt")
