library(stringr)
library(dplyr)

# Ensure the directories exist.
VerifyEnvironment <- function (return) {
  if(dir.exists("UCI HAR Dataset")) {setwd("UCI Har Dataset")}
  if (!dir.exists("train")) {stop("Expected directory 'train' is missing. "); return;}
  if (!dir.exists("test")) {stop("Expected directory 'test' is missing. "); return;}
}

#Read variables from features*.txt, clean names.
CleanHeaders <- function () {
  # Read in variable names.
  cnames.Original <- read.csv("features.txt", sep = " ", header=FALSE)
  cnames.Info <- read.csv("features_info.txt", sep=":", header=FALSE)
  cnames.Clean <- cnames.Original[,2]
  
  # Convert frequency bands to have the last value.
  #  i.e. band -33,40 becomes 40, which is the more important value
  cnames.Clean <- gsub("(\\d+),(\\d+)", "\\2", cnames.Clean, perl=T)
  
  # No more disallowed characters. 
  cnames.Clean <- gsub("(","", cnames.Clean, fixed=TRUE)  # (Fixed treats string as literal)
  cnames.Clean <- gsub(")","", cnames.Clean, fixed=TRUE)  
  cnames.Clean <- gsub("-","", cnames.Clean, fixed=TRUE)  
  cnames.Clean <- gsub(",","", cnames.Clean, fixed=TRUE)
  
  # Make starting character readable, 
  #  t*/f*/Angle* becmose TimeDomain/FrequencyDomain/AngleDomain
  cnames.Clean <- lapply(cnames.Clean
                         , function(x) {
                                 if(grepl("^angle",  x)) 
                                         paste(c(gsub("^angle", "", x), "Angle"),collapse="") 
                                 else 
                                         return(x)
                                 })
  cnames.Clean <- gsub("^t", "TimeDomain", cnames.Clean)           
  cnames.Clean <- gsub("^f", "FreqDomain", cnames.Clean)
  cnames.Clean <- gsub("gravity", "Gravity", cnames.Clean)
  
  # Capitalize the estimated variables (Mean, Acc, etc.)
  cnames.EstimatedVariableNames <- as.character(cnames.Info[grep(")$", cnames.Info[,1]),])
  cnames.EstimatedVariableNames <- gsub("()","", cnames.EstimatedVariableNames , fixed=TRUE)  
  cnames.EstimatedVariableNames <- paste(cnames.EstimatedVariableNames, collapse="|")
  cnames.Clean <- lapply(cnames.Clean, function(x) {
          loc <- regexpr(cnames.EstimatedVariableNames, x)[1];
          char <- toupper(substring(text=x, first=loc, last=loc));
          substr(x, loc, loc+1) <- char;
          return(x);
          })
  return(cnames.Clean);
}

# Merge the values from the various tables.
MergeData <- function(activitylabels, headers, name)
{
        # Read in the 'x' Mean and StdDev values, the 'y' activity IDs, and the subject IDs.
        x <- read.csv(paste(c(name, "\\X_", name, ".txt"), collapse=""), sep="", header=F, col.names = headers)[,grep("Mean|Std", headers)];
        y <- read.csv(paste(c(name, "\\Y_", name, ".txt"), collapse=""),sep="", header=F, col.names = c("activityid"));
        subject <- read.csv(paste(c(name, "\\subject_", name, ".txt"), collapse=""),sep="", header=F, col.names = c("subjectid"));
        
        # Get the factor names for the activities.
        y <- merge(activitylabels, y);
        x$activity <- y$activity;
        
        # Pull in the subject names
        x$subjectid <- subject$subjectid;
        
        # Identify the source of the data for future merging.
        x$source <- name;
        return(x);
}

#Retrieve the activityID/activityName list.
GetActivities <- function()
{
        read.csv("activity_labels.txt", sep="", header=F, col.names = c("activityid","activity"));
}

#Clean the columns and retrieve the average for each participant for each activity.
#Returns a data table containing Means, StdDev, 
run_analysis <- function()
{
        VerifyEnvironment();
        
        headers <- CleanHeaders();
        activitylabels <- GetActivities();

        alldata <- rbind(MergeData(activitylabels, headers, "test"), 
                     MergeData(activitylabels, headers, "train"));
        
        cleandata <- alldata %>% group_by(subjectid,activity) %>% summarise_each(funs(mean(.)), seq(1, ncol(alldata)-3))
        
        write.table(cleandata, file="CleanedSummary.txt", row.name=FALSE);
        write.table(colnames(cleandata), "CleanedDataDictionary.txt", quote=FALSE)
        return(cleandata);
}

