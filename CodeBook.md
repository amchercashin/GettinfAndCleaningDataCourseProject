# Desription of variables in tidyData.txt

tidyData.txt contains 68 variables (columns) and 180 observations (rows).

tidyData.txt is in a wide data form. Variables 1:2 are id variables: Activity and Subject id. Variables 3:68 are measurment variables.

For the purpose of project we took only mean and standart deviation measurments form raw datasets. 
This is done by taking only variables wich name contains "mean()" or "std()". Other variables was dropped, also was dropped additional variables with "Mean" in the name because they do not content means of measurments (details in "features_info.txt").

For the purpose of the project taken variables was aggregated with mean() function by activities and subjects. To mark the fact we averaged them, the measurment variable names start to use this name pattern: "MEAN_" & originalVariableName.

For an example if the original variable name was "tGravityAcc-std()-Z", the avereged variable by activities and subjects in tidyData.txt would be "MEAN_tGravityAcc-std()-Z".

The detailed description of original variables you can find at "./UCI HAR Dataset/features_info.txt".

tidyData.txt was written with write.table() function with default sep=" " and row.names=FALSE.
To load it please use 
`tidyData <- read.table("tidyData.txt", header=TRUE)`. 

While loading tidyData.txt in to R some symbols: "-", "(", ")" in variable names could be replaces with dots: ".". So the the variables named like "MEAN_tGravityAcc-std()-Z" could be presented to you like: "MEAN_tGravityAcc.std...Z"
