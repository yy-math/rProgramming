pollutantmean <- function(directory, pollutant, id = 1:332) {
  directoryList <- list.files(directory)
  allData <- lapply(directoryList[id], function(x) read.csv(paste(directory, "/",x, sep="")))
  pollutantData <- lapply(allData, function(x) x[,pollutant])
  pollutantVector <- unlist(pollutantData)
  mean(pollutantVector, na.rm = TRUE)
}