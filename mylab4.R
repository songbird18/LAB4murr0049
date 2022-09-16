# Read the comma delimited data sheet "SPRUCE.csv" into R variable
spruce.df = read.csv("SPRUCE.csv")


# Return the current working directory
getwd()


# Return the last 6 entries in the 'spruce.df' data frame
tail(spruce.df)


# import s20x library
library(s20x)


# generate a lowess smoother scatter plot
trendscatter(Height~BHDiameter,f=0.5,data=spruce.df)
