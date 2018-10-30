# Title: archive-function.R
# Description: These are functions necessary for data accumulation.
# Input(s): code
# Output(s): functions
# Author(s): Kanak Garg
# Date: 04-09-2019

library(XML)
library(stringr)
library(ggplot2)

#' @title read_archive
#' @description returns the data frame from reading the HTML table
#' @param str, string package name
#' @return a data frame

read_archive <- function(str = '') {
  url <- paste0('http://cran.r-project.org/src/contrib/Archive/', str)
  tbl_html <- readHTMLTable(url)
  return(data.frame(tbl_html[1]))
}


#' @title clean_archive
#' @description cleans the data frame from earlier extraction
#' @param df, data frame
#' @return a data frame

clean_archive <- function(df) {
  n <- dim(df)[1] -1
  df <- df[3:n, ]
  name <- sapply(df$NULL.Name, version_names)
  version <- sapply(df$NULL.Name, version_numbers)
  date <- as.Date(sapply(df$NULL.Last.modified, version_dates), origin = "1970-01-01")
  size <- sapply(df$NULL.Size, version_sizes)
  return(data.frame(name, version, date, size))
}

#' @title version_names
#' @description extracts the name of the package
#' @param str, string
#' @return string

version_names <- function(str) {
  string <- str_split_fixed(str, '_', n=2)
  return(string[1])
}


#' @title version_number
#' @description extracts the number of the version 
#' @param str, string
#' @return string

version_numbers <- function(str) {
  string <- str_split_fixed(str, '_', n=2)
  newStr <- str_replace(string[2], ".tar.gz", '')
  return(newStr)
}

#' @title version_dates
#' @description extracts the date of the version
#' @param str, string
#' @return string

version_dates <- function(str) {
  string <- str_split_fixed(str, " ", n=2)
  newStr <- string[1]
  date <- as.Date(newStr)
  format(date, '%Y-%m-%d')
  return(date)
}

#' @title version_sizes
#' @description extracts the size of the version
#' @param df, data frame
#' @return a data frame

version_sizes <- function(str){
  num <- str_sub(str, 0, -2)
  type <- str_sub(str, -1)
  if(type == "K"){
    return(as.numeric(num))
  }
  else{
    return(1000*as.numeric(num))
  }
}

#' @title plot_archive
#' @description visualize timeline with version sizes
#' @param df, data frame
#' @return step line plot

plot_archive <- function(df){
  title <- paste0(df$name[1], ": timeline of version sizes")
  ggplot(df, aes(x = df$date, y = df$size)) +
  geom_step() +
  labs(title = title, y = 'Size (kilobytes)', x = 'Date')
}
