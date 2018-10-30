# ===================================================================
# Title: Lab 6
# Description:
#   Lab 6, learning new tools.
# Input(s): N/A
# Output(s): N/A
# Author: Kanak Garg
# Date: 3-6-2018
# ===================================================================

sink(file = '../output/data-structure.tx')
str(players)
sink()

sink(file = '../output/summary_warriors.tx')
summary(warriors)
sink()


sink(file = '../output/summary_lakers.tx')
summary(lakers)
sink()


png(filename =  '../images/scatterplot.png')
plot(height, weight)
dev.off()


png(filename =  '../images/scatterplot-highres.png', res = 100)
plot(height, weight)
dev.off()

jpeg(filename = '../images/histogram.jpeg', width = 600, height = 400)
hist(age)
dev.off()


pdf(filename = '../images/histogram.jpeg', width = 7, height = 5)
hist(age)
dev.off()

