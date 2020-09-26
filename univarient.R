library(DataExplorer)
library(knitr)
library(purrr)
library(tidyr)
library(ggplot2)
colour1 = "#66CD00"

format_dataset <- function(data){
  #remove NA
  data <- na.omit(data)
  #set char columns to factor
  cols <- length(colnames(data))
  colNames = colnames(data)
  types = sapply(data, typeof)
  for (c in 1:cols){
    if (types[c] == "character") {
      data[ ,colNames[c]] <- as.factor(data[ ,colNames[c]])
    }
  }
  return(data)
}


data_table_summary <- function(data, filename, dp = 3){
  rows <- 3
  cols <- 3
  types = sapply(data, typeof)
  
  tableData <- matrix(nrow = rows, ncol = cols, dimnames = list(c("Size (KB)", "Observations", "Variables"), c("value","","value")))
  
  tableData[1,1] <- round(object.size(data) / 1024,1)
  tableData[2,1] <- length(data[ , 1])
  tableData[3,1] <- length(data[1, ])
  
  tableData[1,2] <- ""
  tableData[2,2] <- "Numeric Variables"
  tableData[3,2] <- "Non-Numeric Variables"
  
  tableData[1,3] <- ""
  tableData[2,3] <- sum(types == "double") + sum(types == "integer") + sum(types == "complex") + sum(types == "logical") + sum(types == "numeric")
  tableData[3,3] <- sum(types == "character")
  
  return(tableData)
  
  }


univarient_table_summary <- function(data, dp = 3){
  rows <- length(colnames(data))
  cols <- 5
  colNames <- colnames(data)
  
  tableData <- matrix(nrow = rows, ncol = cols, dimnames = list(colnames(data), c("type", "mean", "sd", "missing data", "missing data (%)")))
  
  #names
  types <- sapply(data, typeof)
  factors <- sapply(data, is.factor)
  for (r in 1:rows) {
    tableData[r,1] <- types[r]
  }
  
  #mean
  for (r in 1:rows) {
    if (types[r] != "character" & factors[r] != TRUE){
      tableData[r,2] <- round(mean( na.omit(data[ ,colNames[r]])),dp)
    }
    else {
      tableData[r,2] <- "-"
    }
  }
  
  #SD
  for (r in 1:rows) {
    if (types[r] != "character" & factors[r] != TRUE){
      tableData[r,3] <- round(sd( na.omit(data[ ,colNames[r]])),dp)
    }
    else {
      tableData[r,3] <- "-"
    }
  }
  
  #missing data
  for (r in 1:rows) {
    tableData[r,4] <- sum(is.na(data[ ,colNames[r]]))
  }
  
  for (r in 1:rows) {
    tableData[r,5] <- paste(round(100* sum(is.na(data[ ,colNames[r]])) / length(rownames(data)), dp), "% ")
  }
  
  return(tableData)
}

distributions <- function(data){
  #https://drsimonj.svbtle.com/quick-plot-of-all-variables
  
  if (sum(sapply(rock, is.numeric)) == 0) {
    print("No numeric columns")
  }
  else {
    data %>%
    keep(is.numeric) %>%
    gather() %>%
    ggplot(aes(value)) +
    facet_wrap(~ key, scales = "free") +
    geom_histogram(aes(y=..density..), fill = "#FFFFFF", colour = "grey") +
    geom_density(alpha = 0.2, fill = colour1, colour = colour1)
  }
}

hists <- function(data){
  #https://drsimonj.svbtle.com/quick-plot-of-all-variables
  #Check for some data
  if (sum(sapply(rock, negate(is.numeric))) == 0) {
    print("No ategorical columns")
  }
  else {
    data %>%
    keep(negate(is.numeric)) %>%
    gather() %>%
    ggplot(aes(value)) +
    facet_wrap(~ key, scales = "free") +
    geom_histogram(stat="count", alpha = 0.2, fill = colour1, colour = colour1) +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
  }
}
  