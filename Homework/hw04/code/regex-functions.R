# Title: regex-function.R
# Description: These are functions necessary for regex
# Input(s): code
# Output(s): functions
# Author(s): Kanak Garg
# Date: 04-09-2019


#' @title split_chars
#' @description takes a string, and splits it into single character elements
#' @param st, string 
#' @return strings
split_chars <- function(str) {
  strsplit(str, split = c())[[1]]
}

#' @title num_vowels
#' @description returns the number of vowels 
#' @param vec, vector
#' @return character vector
num_vowels <- function(vec) {
  vec <- table(vec)
  vowels <- c('a','e','i','o','u')
  vec <- vec[vowels]
  vec[is.na(vec)] = 0
  names(vec) = vowels
  vec
}

#' @title count_vowels
#' @description counts the number of vowels 
#' @param str, string
#' @return character vector
count_vowels <- function(str) {
  num_vowels(split_chars(tolower(str)))
}


#' @title reverse_chars
#' @description reverses a string
#' @param str, string
#' @return character vector
reverse_chars <- function(str) {
  paste0(rev(split_chars(str)), collapse = '')
}

#' @title reverse_words
#' @description reverses a set of words
#' @param str, string
#' @return string
reverse_words <- function(str) {
  paste0(rev(str_split(str, " ")[[1]]), collapse = ' ')
}