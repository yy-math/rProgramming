best <- function(state, outcome) {
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character", na.strings="Not Available")
  validOutcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!outcome %in% validOutcomes) { stop("invalid outcome")}
  
  validStates <- unique(data$State)
  if (!state %in% validStates) stop("invalid state")
  
  newColumnNames <- c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack", "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure", "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
  columnName <- newColumnNames[match(outcome,validOutcomes)]
  
  dataState <- data[data$State == state,]
  smallest <- which.min(as.double(dataState[,columnName]))
  dataState[smallest,"Hospital."]
}