# Create a vector of ages ranging from 19 to 22
data <- read.csv("User Satisfaction on Popular Mobile Games_ A Survey_COPY.csv")

# Check the structure of the data frame
str(data)

# Factorize the "Age" column
data$Age_Group <- factor(data$Age, levels = 19:22, labels = c("19", "20", "21", "22"))

#Factoring the gender column
data$Gender_Group <- factor(data$Gender, levels = c("Male", "Female"))

#Factoring the location
data$Location_Group <- factor(data$Location, levels = c("Urban", "Rural"))



# Display the factorized age groups
head(data)

# Remove columns with missing values
survey_data <- na.omit(data)

# Remove irrelevant columns
survey_data <- data[, -which(names(data) == "Timestamp", "Name..Optional.")]

# Assuming 'survey_data' is your data frame
write.csv(survey_data, file = "Exported Survey.csv", row.names = TRUE)

PE1 <- data$How.do.you.perceive.the.performance..graphics..gameplay..etc...of.the.games.you.play.
PE1_mean <- mean(PE1)
PE1_sd <- sd(PE1)

EE1 <- data$How.easy.or.difficult.do.you.find.it.to.navigate.and.use.the.features.in.the.games.
EE1_mean <- mean(EE1)
EE1_sd <- sd(EE1)

SI1 <- data$Have.you.started.playing.any.of.these.games.because.of.recommendations.from.friends.or.social.media.
SI1_factor <- factor(SI1, levels = c("Yes", "No"))

FC1 <- data$Do.you.believe.that.you.have.the.necessary.resources.and.support.to.effectively.use.mobile.games.
FC1_mean <- mean(FC1)
FC1_sd <- sd(FC1)

BI1 <- data$How.likely.are.you.to.continue.playing.mobile.games.in.the.future.
BI1_mean <- mean(BI1)
BI1_sd <- sd(BI1)








library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)

# Read the data
data <- read.csv("survey.csv")

# Remove rows with missing values
cleaned_data <- na.omit(data)

# Calculate the total counts per choice for the desired column
column_counts <- cleaned_data %>%
  separate_rows(Have.you.used.any.of.these.music.streaming.platform.for.the.past.week...Can.select.multiple., sep = ", ") %>%
  group_by(Have.you.used.any.of.these.music.streaming.platform.for.the.past.week...Can.select.multiple.) %>%
  summarise(count = n())

# Bar graph for the total counts per choice
bar_another_column <- ggplot(column_counts, aes(x = Have.you.used.any.of.these.music.streaming.platform.for.the.past.week...Can.select.multiple., y = count)) +
  geom_bar(stat = "identity") +
  labs(title = "Total Counts per Choice for Another Column") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Pie chart for age 
pie_chart_age <- ggplot(cleaned_data, aes(x = "", fill = factor(Age))) +
  geom_bar(width = 1, position = "fill") +
  coord_polar(theta = "y") +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "Age",
       fill = "Age") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )

# Pie chart for sex 
pie_chart_sex <- ggplot(cleaned_data, aes(x = "", fill = factor(Sex))) +
  geom_bar(width = 1, position = "fill") +
  coord_polar(theta = "y") +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "Sex",
       fill = "Sex") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )

# Pie chart for education level 
pie_chart_education <- ggplot(cleaned_data, aes(x = "", fill = factor(Education.level))) +
  geom_bar(width = 1, position = "fill") +
  coord_polar(theta = "y") +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "Education Level",
       fill = "Education Level") +
  theme_void() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )

# Arrange the plots
grid.arrange(pie_chart_age, pie_chart_sex, pie_chart_education, bar_another_column, nrow = 2)

