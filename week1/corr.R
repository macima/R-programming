corr<- function(directory, threshold = 0){
        GoodDataList<- data.frame(id=numeric(),CasesNumber=numeric(),stringsAsFactors = FALSE)
        GoodDataList <- complete(directory)
        print(GoodDataList(CasesNumber>threshold))
        # calcCorrelations(GoodDataList(CasesNumber>threshold))
        
}
calcCorrelations <- function()
{
        
}