# a. Load the data http://data.princeton.edu/wws509/datasets/salary.dat into R
salary <- read.table("https://data.princeton.edu/wws509/datasets/salary.dat", header = TRUE)
salary <- na.omit(salary)
salary$sx <- as.factor(salary$sx)
salary$rk <- as.factor(salary$rk)
salary$dg <- as.factor(salary$dg)
View(salary)
# sx: sex
# rk: rank
# yr: year
# dg: degree
# yd: years since degree was awarded
# sl: salary
# ------------------------------------------------------------------------------------------------------------------------------------

# b. Split data into train/test based on a 80/20 split (use seed: 123).
set.seed(123)
train_ = sample(1:nrow(salary), size = 0.8*nrow(salary))
test_ = (-train_)
train_data <- salary[train_,]
test_data <- salary[test_,]
# ------------------------------------------------------------------------------------------------------------------------------------

# c. Fit model with train data to predict salary based on sex, rank, year, degree, and years since degree was awarded.
linear.model <- lm(sl~., data = train_data)
# ------------------------------------------------------------------------------------------------------------------------------------

# d. Interpret model results
# Categorical variables with two levels
# Categorical variables with more than two levels
# Generally, a categorical variable with n levels will be transformed into n-1 variables each with two levels. 
# These n-1 new variables contain the same information than the single variable. 
# This recoding creates a table called contrast matrix.
# R creates dummy variables automatically.
summary(linear.model)
contrasts(salary$sx)
contrasts(salary$rk)
contrasts(salary$dg)
