
# Load the tidyverese
library(tidyverse)

# Read in data as js_data
js_data <- read_csv("js_survey_analysis.csv")

# Take a looksy
View(js_data)

# One of the things that can be a good way to start exploring data is getting counts of specific fields
js_data |>
  count(`feel-connected`) |>
  arrange(desc(n))

js_data |>
  count(`feel-increase-stress`) |>
  arrange(desc(n))

# Convert values to numbers to make analysis easier

js_data <- js_data |>
  mutate(`hours-num` = as.numeric(factor(`hours-per-day`,
                                         "Less than 1 hours", ""))

 <- df %>%
  mutate(q1_num = as.numeric(factor(q1,
                                    levels = c("Strongly disagree", "Disagree", "Neutral", "Agree", "Strongly agree"),
                                    ordered = TRUE
  )))




