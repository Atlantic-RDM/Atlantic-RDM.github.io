
## Step 1: Clean column names and add ID

library(tidyverse)

survey_data <- read_csv("data/survey-cleaning-workshop/social-media-survey.csv")

names(survey_data)

head(survey_data)

View(survey_data)

# Rename columns to be friendlier
survey_data <- survey_data |>
  rename("year_of_study" = "Year of Study")
         
survey_data <- survey_data |>
  rename("hours-per-day" = "How many hours per day do you spend on social media?") 

survey_data <- survey_data |>
  rename("platforms" = "Which social media platforms do you use at least once a week?",
          "feel-connected" = "Social media makes me feel connected",
          "feel-increase-stress" = "Social media increases my stress") 

survey_data <- survey_data |>
  rename( "feel-distracted" = "I find social media distracting from studies",
         "feel-improved-mood" = "Social media positively impacts my mood",
         "usage-stay-in-touch" = "Staying connected with friends/family",
         "usage-entertainment" = "Entertainment",
         "usage-news" = "News and current events",
         "usage-networking" = "Academic or professional networking",
         "usage-expression" = "Self-expression/creativity")

# Remove capitals from column names because I'm a weirdo
survey_data <- survey_data |>
  rename("timestamp" = "Timestamp",
         "name" = "Name",
         "email" = "Email",
         "age" = "Age",
         "gender" = "Gender")

# Add an ID column
survey_data <- survey_data |>
  mutate(ID = row_number())

# Move ID to first position
survey_data <- survey_data |>
  relocate(ID)

View(survey_data)

# Save the dataset to preserve provenance
write_csv(survey_data, "js_survey-clean-identifiers.csv")

survey_data <- read_csv("data/survey-cleaning-workshop/js_survey-clean-identifiers.csv")

View(survey_data)

## Step 2: Remove identifiers and unnecessary columns

# Remove a single column - timestamp
survey_data <- survey_data |>
  select(-timestamp)

# Remove multiple columns - identifiers
survey_data <- survey_data |>
  select(-c(Name, Email))

# Save dataset as ready for processing
write_csv(survey_data, "survey-data_clean-cols_no-ID")

survey_data <- read_csv("data/survey-cleaning-workshop/js_survey-clean-id.csv")

## Step 3: Clean 'platforms' variable with tidy data principles

View(survey_data)

head(survey_data$platforms)


# Separate each platform into its own row, by participant ID
survey_data_long <- survey_data |>
  separate_longer_delim(cols = platforms, delim = ",") |> 
  mutate(platforms = trimws(platforms)) 


write_csv(survey_data, "survey_data_long.csv")
# Take a peak
View(survey_data_long)

survey_data_longer <- survey_data_long |>
  pivot_longer(
    cols = starts_with("feel-"),
    names_to = "feel_question",
    values_to = "feel_response"
  )

View(survey_data_long)

survey_data_double_long <- survey_data_longer |>
  pivot_longer(
  cols = starts_with("usage-"),
  names_to = "usage_question",
  values_to = "usage_response"
)

# Take another peak
View(survey_data_double_long)


# Save a copy of this dataset, as the cleaning is done and we can start poking around at it!
write_csv(js_survey_wide, "js_survey_analysis.csv")




