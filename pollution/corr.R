corr <- function(directory, threshold = 0) {
  correl <- c()
  directoryList <- list.files(directory)
  allData <- lapply(directoryList, function(x) read.csv(paste(directory, "/",x, sep="")))
  goodData <- lapply(allData, function(x) x[complete.cases(x),])
  for (i in 1:length(directoryList)){
    if (nrow(goodData[[i]]) >= threshold){
        correl <- c(correl, cor(goodData[[i]]$sulfate, goodData[[i]]$nitrate))
    }
  }
  return (correl)
}