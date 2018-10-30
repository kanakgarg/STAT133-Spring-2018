# Title: binomial-function.R
# Description: These are functions necesary for binomial computations.
# Input(s): code
# Output(s): functions
# Author(s): Kanak Garg
# Date: 03-22-2019

#' @title is_integer
#' @description checks if number is an integer
#' @param x, num
#' @return True or False

is_integer <- function(x = 0) {
  y = 1 
  while(y < x) {
    y = y + 1
  }
  if(x%%y == 0) {
    return(TRUE)
  }
  return(FALSE)
}

#' @title is_positive
#' @description checks to see if the number is positive
#' @param x, num
#' @return True or False

is_positive <- function(x = 0) {
  if (x > 0) {
    return(TRUE)
  }
  else return(FALSE)
}

#' @title is_nonnegative
#' @description checks to see if the number is nonnegative
#' @param x, num
#' @return True or False

is_nonnegative <- function(x = 0) {
  if (x >= 0) {
    return(TRUE)
  }
  else return(FALSE)
}


#' @title is_positive_integer
#' @description checks to see if positive and an integer
#' @param x, num
#' @return True or False

is_positive_integer <- function(x = 0){
  if (is_integer(x)){
    return(is_positive(x))
  }
  return(FALSE)
}

#' @title is_nonneg_integer
#' @description checks to see if nonnegative and an integer
#' @param x, num
#' @return True or False

is_nonneg_integer <- function(x = 0) {
  if (is_integer(x)) {
    return(is_nonnegative(x))
  }
  else return(FALSE)
}

#' @title is_probability
#' @description check if valid probability
#' @param x, num
#' @return True or False

is_probability <- function(x = 0) {
  if (is_nonnegative(x)) {
    if (x <= 1) {
      return(TRUE)
    }
  }
  return(FALSE)
}

#' @title bin_factorial
#' @description returns factorial of nonnegative int
#' @param x, positive num
#' @return x!

bin_factorial <- function(x) {
  y = 1
  while(x > 1) {
    y = y * x
    x = x - 1
  }
  return(y)
}

#' @title bin_combinations
#' @description returns nCk, combinations of picking k out of n values
#' @param n, num & k, num
#' @return nCk

bin_combinations <- function(n,k) {
  num = bin_factorial(n)
  den = bin_factorial(n-k) * bin_factorial(k)
  return(num/den)
}

#' @title bin_probability
#' @description calculates probability with given values
#' @param trials, num & successes, num & probability, num
#' @return the binomial probability

bin_probability <- function(trials, successes, probability) {
  if (is_nonneg_integer(trials) && is_nonneg_integer(successes) && is_probability(probability)){
    total = bin_combinations(trials, successes)
    val = (probability**successes) * ((1-probability)**(trials - successes))
    return(total*val)
  }
  return(0)
}

#' @title bin_distribution
#' @description probabilty of n successes
#' @param trials, num & p, num
#' @return a table of probabilities

bin_distribution <- function(trials, p){
  success = seq(0,trials)
  probability = rep(0,trials+1)
  for(i in 0:(length(success)-1)){
    probability [i+1] = bin_probability(trials,i,p)
  }
  return(data.frame(success,probability))
}

