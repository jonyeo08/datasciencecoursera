corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations  
  df <- list.files(directory, full.names=TRUE)
  
  cr <- c() 
  
  for(i in 1:length(df)){
    omg<-read.csv(paste(df[i]))
    omg <- omg[complete.cases(omg),]
    if ( nrow(omg) > threshold ) {
      cr <- c(cr, cor(omg$sulfate, omg$nitrate) )
    }
  }
  
  return( cr )
  
}