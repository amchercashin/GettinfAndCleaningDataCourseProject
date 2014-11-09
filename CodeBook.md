# Desription of variables in tidyData.txt

tidyData.txt contains 68 variables (columns) and 180 observations (rows).

tidyData.txt is in a wide data form. Variables 1:2 are id variables: Activity and Subject id. Variables 3:68 are measurment variables.

For the purpose of project we tooks only mean and standart deviation measurments form raw datasets. 
This is done by taking only variables wich names contains "mean()" or "std()". Other variables was dropped, also was dropped additional variables with "Mean" in the name because they do not content means of measurments (details in "features_info.txt").

For the purpose of the project leaved variables was aggregated with mean() function by activities and subjects. To mark the fact we averaged them, the measurment variables names uses pattern: "MEAN_" & originalVariableName.

For an example if the original variable name was "tGravityAcc-std()-Z", the avereged variable by activities and subjects in tidyData.txt would be "MEAN_tGravityAcc-std()-Z".

The detailed description of original variables you can find at "./UCI HAR Dataset/features_info.txt".

tidyData.txt was written with write.table() function with default sep=" " and row.names=FALSE.
To load it please use 
`tidyData <- read.table(tidyData.txt, header=TRUE)`. 

Accasionally symbols - ( ) are substituted with .
So if the names of the original variable was "tGravityAcc-std()-Z" then become "MEAN_tGravityAcc-std()-Z" and after loading back to R it would be "MEAN_tGravityAcc.std...Z".
