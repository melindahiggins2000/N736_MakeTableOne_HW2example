### Intro to R Script ###

# you can leave comments at the end of code lines using the "#" symbol
# run lines of code by having your cursor on the line and hitting ctrl+enter on a PC or command+enter on a mac
# you can run multiple lines of code by highlighting the lines and hitting ctrl+enter on a PC or command+enter on a mac

df<-read.csv("example_df.csv")          # Load the data set 
head(df)                                # View the first 6 lines of the data  set

df$age                                  # Use "$" to search for a variable within a data frame 
mean(df$age)                   
summary(df$age)                         # Get a summary of the "age" variable
sd(df$age)

df$gender
summary(df$gender)                      # Note how R is reporting a "mean" gender. Does this make sense?

df$gender<-as.factor(df$gender)         # Gender is a nominal variable! it needs to be specified as a factor
summary(df$gender)                      # ahh.. much better!

?t.test                                 # Question mark before a function pulls up the help file over here -->
t.test(weight~gender, data = df)        # Let's run a T-test
t.test(df$weight~df$gender)             # Note how this code gets exactly the same results - R has many ways to do the same thing

boxplot(df$height)                      # This makes a boxplot
boxplot(df$height, col = "lightblue")   # Same, but in blue
boxplot(height~gender, data = df)       # Boxplot by group

plot(height~age)                        # why didn't this work?
plot(height~age, data = df)             # Scatter plot
plot(height~age, data = df,             # Scatter plot, but fancy
     main = "Height vs Age", 
     xlab = "participant age", 
     ylab = "participant height")
abline(lm(height~age, data = df), col = "red")   # add a regression line to the plot with lm() and abline()
