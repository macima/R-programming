complete <- function(directory, id = 1:332){
        GoodDataList<- data.frame(id=numeric(),nobs=numeric(),stringsAsFactors = FALSE)
        files <- list.files(directory)
        GoodDataList <- checkGoodData(files, id, directory)
        return(GoodDataList)
        
}

checkGoodData <-function(filesList, id, directory){
        listCompleteData <- data.frame(id=numeric(),nobs=numeric(),stringsAsFactors = FALSE)
        j <- 1L
        for (i in id) {
                FileName <- paste(directory,"/",filesList[i],sep='')
                FileData <- read.csv(FileName,TRUE,",",check.names=FALSE)
                
                
                #DataIsgood <- !is.na(FileData[,2]) & !is.na(FileData[,3])
                DataIsgood<-complete.cases(FileData) # this does the same as line above but checking all the elements
                # CompleteCleanData <- FileData[DataIsgood,]
                # nCompleteCases <- sum(DataIsgood, na.rm=TRUE)
                # na.rm=TRUE excludes missing values from Analyses. However DataIsGood is aalready a BOOL array with no NA
                # So, adding this argument makes no sense, it can be done like below
                nCompleteCases <- sum(DataIsgood) # summing the BOOL list gives us the amount of good data
                # print(filesList[i])
                listCompleteData[j,] = c(i,nCompleteCases)

                
                j = j+1
        }
        
        return(listCompleteData)
        
}