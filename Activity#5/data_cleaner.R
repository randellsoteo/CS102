# Load required libraries
library(dplyr)
library(readr)


# Read the CSV file
merged_3000 <- read.csv("merged_imdb_reviews.csv", stringsAsFactors = FALSE)

# Check the structure of the dataframe
str(merged_3000)

# Clean the data
cleaning_data <- merged_3000 %>%
  # Remove NA values
  na.omit() %>%
  # Remove leading and trailing whitespaces from all columns
  mutate_all(str_trim)

# Check the structure of the cleaned dataframe
str(cleaning_data)

# Write the cleaned data to a new CSV file
write.csv(cleaning_data, "cleaned_3000.csv", row.names = FALSE)