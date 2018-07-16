## GETTING AND CLEANING DATA WEEL 4 PEER REVIEW ASSIGNMENT

## FIRST UNZIP THE FILE IN THE WORKING DIRECTORY AND RENAME THE FILE ASSIGNMENT

##AFTER UNZIPING EXTRACT DATA'S FROM THE FOLDER CHANGE THE WORKING DIRECTORY TO
##UCI HAR DATASET

Data <- setwd(paste(getwd(),"UCI HAR Dataset", sep = "/"))

##THE FOLLOWING CODE IS TO READ ALL THE NAMES OF COLUMNS

column_names <- read.table("features.txt", colClasses = "character")

##READ ALL THE TEST DATASET

setwd(paste(getwd(),"test",sep = "/")) ##SETTING WORKING DIRECTORY TO TEST

x_test <-read.table("X_test.txt")
y_test <-read.table("y_test.txt")
subject_test <- read.table("subject_test.txt") 
c_test <- cbind(subject_test,y_test,x_test)

##READ ALL THE TRAINING DATASET

setwd(paste(Data, "train", sep = "/"))

subject_train <- read.table("subject_train.txt")
x_train <-read.table("X_train.txt")
y_train <-read.table("y_train.txt")
c_train <- cbind(subject_train,y_train,x_train)

## COMBINING BOTH TRAINING AND TEST DATASET

Complete_database <- rbind(c_test,c_train)

##RENAMING THE COLUMNS IN THE COMPLETE DATABASE

names(Complete_database)[1]<-"Subject"
names(Complete_database)[2]<-"Activity"

for(i in 3:563) { names(Complete_database)[i] <- column_names$V2[i-2]}

##SETTING ACTIVITY LABELS

Activity_labels <-c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", 
                    "SITTING","STANDING", "LAYING")

Complete_database$Activity <-Activity_labels[Complete_database$Activity]

## SUBSETTING THE DATABASE FOR MEAN() AND STD() COLUMNS

Required_columns <- grep("mean|std", names(Complete_database), value = TRUE)
subset_dataset <-Complete_database[,c("Subject","Activity",Required_columns)]

##FINAL DATASET

Final_data <- Complete_database%>% group_by(Subject,Activity)
%>% summarise_all(mean)

setwd(Data)

write.table(Final_data, file = "Final Data.txt")
