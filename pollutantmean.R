pollutantmean <- function(directory, pollutant="sulfate", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  path<-directory
  df<-list.files(path, full.names=TRUE)
  
  dat<-data.frame()
  for (i in id) {
    dat<-rbind(dat, read.csv(df[i]))
  }

  dat_subset<-dat[,pollutant]
  round(mean(dat_subset, na.rm=TRUE), digits=3)
  
}

