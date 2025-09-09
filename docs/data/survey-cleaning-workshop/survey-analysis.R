
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

# Try this with some other values!

# Intro boolean operators and filter function

# Check out heavy users
js_heavy_users <- js_data |>
  filter(`hours-per-day` == "More than 6 hours")

View(js_heavy_users)

js_heavy_users |>
  count(`feel-increase-stress`) |>
  arrange(desc(n))


# Check out light uses
js_light_users <- js_data |>
  filter(`hours-per-day` == "Less than 2 hours")

View(js_light_users)

js_light_users |>
  count(`feel-increase-stress`) |>
  arrange(desc(n))



