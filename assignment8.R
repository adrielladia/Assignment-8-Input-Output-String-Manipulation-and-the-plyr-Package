# Assignment 8 - Import data, group means with plyr, filter names containing "i"

# ---- Step 1: Import the Assignment 6 dataset ---------------------------------
# The file is comma-separated with a header row.
# Interactive: pick the file in a dialog
student6 <- read.table(file.choose(), header = TRUE, sep = ",",
                       stringsAsFactors = FALSE)
# Non-interactive alternative:
# student6 <- read.table("Assignment 6 Dataset (1).txt", header = TRUE, sep = ",",
#                        stringsAsFactors = FALSE)

print(student6)

# ---- Step 2: Mean Grade (and Age) by Sex using plyr --------------------------
# install.packages("plyr")   # run once if plyr is not installed
library(plyr)

gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  AgeAverage   = mean(Age,   na.rm = TRUE),
  GradeAverage = mean(Grade, na.rm = TRUE)
)
print(gender_mean)

# Write the grouped means to a file (comma-separated, no quotes)
write.table(gender_mean, file = "gender_mean.txt",
            sep = ",", row.names = FALSE, quote = FALSE)

# ---- Step 3: Names containing the letter "i" (upper or lower case) -----------
i_students <- subset(student6, grepl("[iI]", Name))
print(i_students)

# Names only, comma-separated (CSV)
write.csv(i_students["Name"], file = "i_students.csv",
          row.names = FALSE, quote = FALSE)

# Full filtered data set as CSV
write.csv(i_students, file = "i_students_full.csv", row.names = FALSE)

# Confirm the files were written
file.exists(c("gender_mean.txt", "i_students.csv", "i_students_full.csv"))
