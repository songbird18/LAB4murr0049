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


# create a linear model of Height vs. BHDiameter
spruce.lm=lm(Height~BHDiameter,data=spruce.df)


# store the residuals of the model in a variable
height.res=residuals(spruce.lm)


# store the fitted values of the model in a variable
height.fit=fitted(spruce.lm)


# Output a scatter plot of residuals vs. fitted values of the model
plot(height.fit,height.res)


# Output a lowess smoother scatter plot of the same data (similar to the
# previous line, but with a trendline for the plot and lines indicating
# +/- 1 standard deviation)
trendscatter(height.fit,height.res)


# Output a scatter plot of the data with a single trendline
plot(spruce.lm, which =1)


# Check normality
normcheck(spruce.lm,shapiro.wilk = TRUE)
