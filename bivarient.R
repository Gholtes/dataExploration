library(ggplot2)
library(GGally)

colour1 = "#66CD00"
colour2 = "#458B00"

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

corrMat <- function(data){
  #plot a simple coloured correlation matrix (exclude diag and upper half)
  ggcorr(data, 
         label = TRUE,
         low = "#3B9AB2",
         mid = "#EEEEEE",
         high = colour2)
}

PairScatter <- function(data){
  #plot scatter plots of numeric data
  types = sapply(data, typeof)
  cols <- unlist(lapply(data, is.numeric))  
  
  ggpairs(data[, cols],
          upper = list(continuous = wrap("points", alpha = 0.3, col = colour2), combo = wrap("dot", alpha = 0.3)),
          diag = list(continuous = wrap("densityDiag", col = colour1)),
          lower = NULL,
          axisLabels = "none")
}

regressions <- function(data) {
  #   #show scatter plots and regression estimates
  cols <- unlist(lapply(data, is.numeric))  
  data <- data[, cols]
  corrMat <- cor(data)
  for (row in 1:sum(cols)){
    for (col in 1:sum(cols)){
      if (is.na(corrMat[row, col])){
        corrMat[row, col] <- 0
      }
      if (row >= col){
        corrMat[row, col] <- 0
      }
      else
        corrMat[row, col] <- abs(corrMat[row, col])
    }
  }
  for (i in 1:min(3, sum(cols))){
         maxRow <- which(corrMat == max(corrMat), arr.ind = TRUE)
         row <- maxRow[1,1]
         col <- maxRow[1,2]
         corrMat[row, col] <- 0
         #plot
         print(ggplot(data, aes(data[ ,col], data[ ,row])) +
           geom_point(shape=16, , col = colour1, alpha = 0.6) +    # Use hollow circles
           geom_smooth(method=lm, col = colour2) +   # Add linear regression line (by default includes 95% confidence region)
           labs(x = colnames(data)[col], 
                y = colnames(data)[row], 
                title = paste("Relationship between",colnames(data)[col],"and",colnames(data)[row])))
  }
}

