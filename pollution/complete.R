complete <- function(directory, id = 1:332) {
  directoryList <- list.files(directory)
  allData <- lapply(directoryList[id], function(x) read.csv(paste(directory, "/",x, sep="")))
  nobs <- sapply(allData, function(x) sum(complete.cases(x)))
  data.frame("id" = id, "nobs" = nobs)
  }