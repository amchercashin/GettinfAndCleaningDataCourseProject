library(reshape2)

# Loading and merging datasets, unloading temporary data afterwards
trainData<-read.table("./UCI HAR Dataset/train/X_train.txt")
testData<-read.table("./UCI HAR Dataset/test/X_test.txt")
mergedData<-rbind(trainData,testData)
rm(trainData,testData)

# Loading features - variable names for the data,then naming mergedData columns by this names,
# unloading temporary data afterwards
features<-read.table("./UCI HAR Dataset/features.txt")
colnames(mergedData)<-features[,2]
rm(features)

# Searching for columns with mean and std values of measurment by column names: 
# there should be "mean()" or "std()" in the name. Defining vectror with such 
# columns numbers. Dropping all but this columns from mergedData
columnsToRetrive <- sort(c(grep("mean\\(\\)",colnames(mergedData)),grep("std\\(\\)",colnames(mergedData))))
mergedData<-mergedData[,columnsToRetrive]
rm(columnsToRetrive)

# Loading and merging activity labels in the same order like datasets,
# unloading temporary data afterwards
trainLabels<-read.table("./UCI HAR Dataset/train/y_train.txt")
testLabels<-read.table("./UCI HAR Dataset/test/y_test.txt")
mergedLabels<-rbind(trainLabels,testLabels)
rm(trainLabels,testLabels)
colnames(mergedLabels)<- "Activity"


# Assigning activity names to codes (1 trough 6) according to the names in activity_labels.txt
labelNames <- read.table("./UCI HAR Dataset/activity_labels.txt")
mergedLabels <- sapply(mergedLabels, function(l) labelNames[l,2])
rm(labelNames)

# Loading and merging activity labels in the same order like datasets
trainSubjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")
testSubjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")
mergedSubjects<-rbind(trainSubjects,testSubjects)
rm(trainSubjects,testSubjects)
colnames(mergedSubjects)<- "Subjects"

# Binding column with activity names to mergedData
mergedData<-cbind(mergedLabels,mergedSubjects,mergedData)
rm(mergedLabels,mergedSubjects)

# Making second, independent tidy data set with the average of each variable for each 
# activity and each subject. Melting data to the narrow form, then casting back to 
# wide form with 'mean' agregation function
tidyData<-melt(mergedData,id.vars=1:2,measure.vars=3:68)
tidyData<-dcast(tidyData, Activity+Subjects ~ variable,mean)

#Adding 'MEAN_' prefix to column names with variables to mark the fact we mean them
colnames(tidyData)[3:68]<-sapply(colnames(tidyData[,3:68]), function(c) paste("MEAN_",c, sep=""))
write.table(tidyData,"./tidyData.txt")