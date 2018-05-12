corr<- function(directory, threshold = 0){
        GoodDataList<- data.frame(id=numeric(),nobs=numeric(),stringsAsFactors = FALSE)
        GoodDataList <- complete(directory)
        CorrelationVec <- vector("numeric", length = 0)
        # print(GoodDataList)
        # print(subset(GoodDataList,CasesNumber > threshold))
        #print(subset(GoodDataList,CasesNumber > threshold))
        CorrelationVec <- calcCorrelations(directory,subset(GoodDataList,nobs > threshold))
        return(CorrelationVec) 
}

calcCorrelations <- function(directory,dat)
{ 
        listCompleteData <- data.frame(id=numeric(),nobs=numeric(),stringsAsFactors = FALSE)
        files <- list.files(directory)
        listCompleteData <- dat
        CorrelationVec <- vector("numeric", length = 0)
        j <- 1L
        # print(dat[[1]])
        for (i in dat[[1]]) {
                FileName <- paste(directory,"/",files[i],sep='')
                #print(FileName)
                FileData <- read.csv(FileName,TRUE,",",check.names=FALSE)
                #DataIsgood<-complete.cases(FileData)
                CompleteCleanData <- FileData[complete.cases(FileData),]
                #print(cor(CompleteCleanData[,"sulfate"],CompleteCleanData[,"nitrate"]))
                #         # nCompleteCases <- sum(DataIsgood, na.rm=TRUE)
                #         # print(filesList[i])
                #         # listCompleteData[j,] = c(i,nCompleteCases)
                #         # listCompleteData[j,1] = filesList[i]
                #         # listCompleteData[j,2] = nCompleteCases
                #         
                #         j = j+1
                # CorrelationVec <- cbind( CorrelationVec,cor(CompleteCleanData[,"sulfate"],CompleteCleanData[,"nitrate"]))
                CorrelationVec[j] <- cor(CompleteCleanData[,"sulfate"],CompleteCleanData[,"nitrate"])
                #print(CorrelationVec)
                j = j+1
        }
        # return(dat)
        return(CorrelationVec)
        
}