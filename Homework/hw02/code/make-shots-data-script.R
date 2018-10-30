#Title: Data Preperation
#Description: Create a shots_data.csv file that will contain data of all the shots taken for all respective NBA players.
#Input: andre_iguadala.csv; draymond-green.csv; kevin_durant.csv, klay_thompson.csv; stephen-curry.csv
#Output: shots_data.csv

#import packages
library(dplyr)

#import data
iggy <- read.csv("hw02/data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv("hw02/data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv("hw02/data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv("hw02/data/klay-thompson.csv", stringsAsFactors = FALSE)
curry <- read.csv("hw02/data/stephen-curry.csv", stringsAsFactors = FALSE)

#change data
curry <- mutate(curry, name = "Stephen Curry")
curry$shot_made_flag[curry$shot_made_flag == 'y'] = "made shot"
curry$shot_made_flag[curry$shot_made_flag == 'n'] = "missed shot"
curry <- mutate(curry, minute = 12*period - minutes_remaining)

thompson <- mutate(thompson, name = "Klay Thompson")
thompson$shot_made_flag[thompson$shot_made_flag == 'y'] = "made shot"
thompson$shot_made_flag[thompson$shot_made_flag == 'n'] = "missed shot"
thompson <- mutate(thompson, minute = 12*period - minutes_remaining)

durant <- mutate(durant, name = "Kevin Durant")
durant$shot_made_flag[durant$shot_made_flag == 'y'] = "made shot"
durant$shot_made_flag[durant$shot_made_flag == 'n'] = "missed shot"
durant <- mutate(durant, minute = 12*period - minutes_remaining)

green <- mutate(green, name = "Draymond Green")
green$shot_made_flag[green$shot_made_flag == 'y'] = "made shot"
green$shot_made_flag[green$shot_made_flag == 'n'] = "missed shot"
green <- mutate(green, minute = 12*period - minutes_remaining)

iggy <- mutate(iggy, name = "Andre Iguadala")
iggy$shot_made_flag[iggy$shot_made_flag == 'y'] = "made shot"
iggy$shot_made_flag[iggy$shot_made_flag == 'n'] = "missed shot"
iggy <- mutate(iggy, minute = 12*period - minutes_remaining)

#export data
sink(file = "hw02/output/andre-iguodala-summary.txt")
summary(iggy)
sink()

sink(file = "hw02/output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "hw02/output/stephen-curry-summary.txt")
summary(curry)
sink()

sink(file = "hw02/output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "hw02/output/klay-thompson-summary.txt")
summary(thompson)
sink()

#stack data
shot_data <- rbind(curry, durant, green, iggy, thompson)
write.csv(shot_data, file = "hw02/data/shot-data.csv", row.names = FALSE)

sink(file = "hw02/output/shots-data-summary.txt")
summary(shot_data)
sink()

