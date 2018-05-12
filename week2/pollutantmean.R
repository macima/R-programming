pollutantmean <- function(directory, pollutant, id = 1:332){

        files <- list.files(directory)
        polutantData = readData(pollutant,files, id, directory)
        cleanData = polutantData[!is.na(polutantData)]
        polutantMean = mean(cleanData)
return (polutantMean)
}

readData <-function(pollutant,filesList, id, directory){
        polutantData = NULL
         for (i in id) {
                 FileName <- paste(directory,"/",filesList[i],sep='')
                 FileData <- read.csv(FileName,TRUE,",",check.names=FALSE)
                #FileName = (paste(directory,"/",filesList[i],sep=''))
                #FileData = read.csv(FileName,TRUE,",",check.names=FALSE)
                polutantData = rbind(polutantData,FileData[pollutant])
        }

        return(polutantData)
  
}