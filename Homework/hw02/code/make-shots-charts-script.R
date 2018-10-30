#Title: Creating Charts
#Description: 
#Input: 
#Output: 

#imports
library(dplyr)
library(grid)
library(ggplot2)
library(jpeg)

shot_data <- read.csv(file = "/Users/kanakgarg/Desktop/Statistics/Stat 133/hw-stat133/hw02/data/shot-data.csv", stringsAsFactors = FALSE)

court_file <- "/Users/kanakgarg/Desktop/Statistics/Stat 133/hw-stat133/hw02/images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))


pdf("hw02/images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = shot_data[shot_data$name == "Klay Thompson",])  + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') + theme_minimal()
dev.off()

pdf("hw02/images/stephen-curry-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = shot_data[shot_data$name == "Stephen Curry",]) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') + theme_minimal()
dev.off()

pdf("hw02/images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = shot_data[shot_data$name == "Kevin Durant",]) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') + theme_minimal()
dev.off()

pdf("hw02/images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = shot_data[shot_data$name == "Draymond Green",]) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') + theme_minimal()
dev.off()

pdf("hw02/images/andre-iguadala-shot-chart.pdf", width = 6.5, height = 5)
ggplot(data = shot_data[shot_data$name == "Andre Iguadala",]) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Igudala (2016 season)') + theme_minimal()
dev.off()


pdf("hw02/images/gsw-shot-charts.pdf", width = 8, height = 7)
ggplot(data = shot_data) + annotation_custom(court_image, -250, 250, -50, 420) + geom_point(aes(x = x, y = y, color = shot_made_flag)) + ylim(-50, 420) +
  ggtitle('Shot Charts: GSW') + theme_minimal() + facet_wrap(~ name)
dev.off()