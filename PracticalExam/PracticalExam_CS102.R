#Practical Exam

#A
data(warpbreaks)

#1
numeric_or_integer <- sapply(warpbreaks, function(x) is.numeric(x) || is.integer(x))
print(numeric_or_integer)

#2
#Integer is more natural data type than numeric, since you cannot have a fraction of a break 
warpbreaks$breaks <- as.integer(warpbreaks$breaks)
str(warpbreaks$breaks)

#3
sum_warpbreaks <- sum(warpbreaks)
#Error in FUN(X[[i]], ...) : 
#only defined on a data frame with all numeric-alike variables

#B

#1

textfile <- readLines('Cloud/project/Activity#5/exampleFile.txt')

#2
lines_txt <- c(
  "// Survey data. Created : 21 May 2013",
  "// Field 1: Gender",
  "// Field 2: Age (in years)",
  "// Field 3: Weight (in kg)",
  "M;28;81.3",
  "male;45;",
  "Female;17;57.2",
  "fem.;64;62.8"
)

ident_comments <- lines_txt[grepl("^//", lines_txt)]

ident_data <- lines_txt[!grepl("^//", lines_txt)]

print("Comments:")
print(ident_comments)

print("Data:")
print(ident_data)


#3
install.packages("lubridate")
library(lubridate)

firstline <- "// Survey data. Created : 21 May 2013"

extract_date <- dmy(gsub("// Survey data. Created : ", "", firstline))

print(extract_date)


#4

data_lines <- lines[!grepl("^//", lines_txt)]  # ! Indicates to exclude comment lines
split_data <- strsplit(data_lines, ";")


max_fields <- max(sapply(split_data, length))
filled_data <- t(sapply(split_data, function(x) c(x, rep(NA, max_fields - length(x)))))


matrix_data <- matrix(unlist(filled_data), ncol = max_fields, byrow = TRUE)

field_names <- sapply(lines[2:4], function(line) gsub("^// Field [0-9]+: ", "", line))

colnames(matrix_data) <- field_names

print(matrix_data)
writeTocsv <- write.csv(matrix_data, file = "Matrix Data.csv", row.names = FALSE)
