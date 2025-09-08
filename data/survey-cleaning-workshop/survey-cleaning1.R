
## Step 1: Clean column names and add ID

library(tidyverse)

js_survey <- read_csv("js-test-survey.csv")

View(js_survey)

# Rename columns to be friendlier
js_survey <- js_survey |>
  rename("hours-per-day" = "How many hours per day do you spend on social media?",
         "platforms" = "Which social media platforms do you use at least once a week?",
         "feel-connected" = "Social media makes me feel connected",
         "feel-increase-stress" = "Social media increases my stress",
         "feel-distracted" = "I find social media distracting from studies",
         "feel-improved-mood" = "Social media positively impacts my mood",
         "usage-stay-in-touch" = "Staying connected with friends/family",
         "usage-entertainment" = "Entertainment",
         "usage-news" = "News and current events",
         "usage-networking" = "Academic or professional networking",
         "usage-expression" = "Self-expression/creativity")

# Remove capitals from column names because I'm a weirdo
js_survey <- js_survey |>
  rename("timestamp" = "Timestamp",
         "name" = "Name",
         "email" = "Email")

# Add an ID column
js_survey <- js_survey |>
  mutate(ID = row_number())

# Move ID to first position
js_survey <- js_survey |>
  relocate(ID)

# Save the dataset to preserve provenance
write_csv(js_survey, "js_survey-clean-identifiers.csv")


## Step 2: Remove identifiers and unnecessary columns

# Remove a single column - timestamp
js_survey <- js_survey[, -2]

# Remove multiple columns - identifiers
js_survey <- js_survey[, -c(2, 3)]

# Save dataset as ready for processing
write_csv(js_survey, "js_survey-clean-id.csv")


## Step 3: Clean 'platforms' variable with tidy data principles

# Separate each platform into its own row, by participant ID
js_survey_long <- js_survey |>
  separate_rows(platforms, sep = ",") |> # split responses by commas
  mutate(platforms = trimws(platforms)) # remove leading/trailing spaces

# Take a peak
View(js_survey_long)

# Create new columns for each platform, with 1 being used, and 0 not being used at least once a week
js_survey_wide <- js_survey_long |>
  mutate(value = 1) |>
  pivot_wider(
    names_from = platforms,
    values_from = value,
    values_fill = 0
  )

# Take another peak
View(js_survey_wide)

# Move platforms to where they were in the original dataset

# Move a single column, LinkedIn, to AFTER hours-per-day
js_survey_wide <- js_survey_wide |>
  relocate(LinkedIn, .after = `hours-per-day`)

# Move a single column, Instagram, BEFORE connected
js_survey_wide <- js_survey_wide |>
  relocate(Instagram, .before = "feel-connected")

# Move multutiple columns with one of these functions
js_survey_wide <- js_survey_wide |>
  relocate(Reddit, Facebook, Snapchat, TikTok, X (Twitter), .after = Instagram)

# Oh dear, we've run into a program with "X (Twitter) Due to its naming.  Let's change this
js_survey_wide <- js_survey_wide |>
  rename("X" = "X (Twitter)")

# Let's try to move those columns again, changing the name of "X (Twitter)" to "X"
js_survey_wide <- js_survey_wide |>
  relocate(Reddit, Facebook, Snapchat, TikTok, X, .after = Instagram)


# Now there's one last thing we need to do.  

# Save a copy of this dataset, as the cleaning is done and we can start poking around at it!
write_csv(js_survey_wide, "js_survey_analysis.csv")




