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


# Check normality with a QQ plot + Shapiro-Wilk data
normcheck(spruce.lm,shapiro.wilk = TRUE)


# Fit a quadratic curve to the plot of Height vs. BHDiameter
quad.lm=lm(Height~BHDiameter + I(BHDiameter^2),data=spruce.df)

# Plot spruce height predictions
plot(Height~BHDiameter,bg="Blue",pch=21,cex=1.2,
     ylim=c(0,max(Height)),xlim=c(0,max(BHDiameter)),
     main="Spruce height prediction",data=spruce.df)

# Declare a function to calculate the quadratic polynomial
myplot=function(x){
  quad.lm$coef[1] +quad.lm$coef[2]*x  + quad.lm$coef[3]*x^2
}


# Plot the quadratic curve over the existing scatter plot
curve(myplot, lwd=2, col="steelblue",add=TRUE)


# similar to code with 'spruce' variables above
quad.fit=fitted(quad.lm)
quad.res=residuals(quad.lm)
plot(quad.lm, which =1)
normcheck(quad.lm,shapiro.wilk = TRUE)
