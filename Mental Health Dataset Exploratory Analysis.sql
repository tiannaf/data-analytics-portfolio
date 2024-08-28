# Mental Health Data (2014)
# Purpose of this project is to explore the dataset and draw insights
# Source: https://www.kaggle.com/datasets/bhavikjikadara/mental-health-dataset/data


# Read raw data file and create new table to clean and explore:
SELECT *
FROM `mental health dataset`;

CREATE TABLE mental_health_data
LIKE `mental health dataset`;

SELECT * 
FROM mental_health_data;

INSERT mental_health_data
SELECT *
FROM `mental health dataset`;

# Cleaning - deleted blanks, no nulls found in dataset:
SELECT *
FROM mental_health_data
WHERE self_employed = '';

DELETE FROM mental_health_data
WHERE self_employed = '';

# Exploratory Data Analysis

SELECT *
FROM mental_health_data;

# Total records found in data: 287,162:
SELECT COUNT(*) AS total_records FROM mental_health_data;

# Number of records by gender (female: 51,212. male: 235,590). Data set is mostly male:
SELECT Gender, COUNT(*) AS count_per_gender 
FROM mental_health_data
GROUP BY Gender;

# Number of records by country - U.S. with the highest:
SELECT Country, COUNT(*) AS count_per_country 
FROM mental_health_data
GROUP BY Country 
ORDER BY count_per_country DESC;

# Distribution of self-employment status. 29,168 are self-employed:
SELECT self_employed, COUNT(*) AS count_per_status 
FROM mental_health_data
GROUP BY self_employed;

# Distribution of family history of mental health and treatment:
# The majority of people who seek treatment have a family history,
# suggesting that family experience plays a crucial role in influencing treatment-seeking behavior.

SELECT family_history, treatment, COUNT(*) AS count_per_combination 
FROM mental_health_data
GROUP BY family_history, treatment;

# Distribution of Days Indoors:
# Most individuals (62,429) spent 1-14 days indoors
SELECT Days_Indoors, COUNT(*) AS count_per_days 
FROM mental_health_data
GROUP BY Days_Indoors;

# Cross-tabulation between Self-Employment and Treatment:
# Overall, non-self-employed individuals dominate the dataset
# Self-employed individuals are less likely to seek treatment
SELECT self_employed, treatment, COUNT(*) AS count 
FROM mental_health_data
GROUP BY self_employed, treatment;

# Correlation Between Stress and Mental Health History:
# High stress is closely linked to mental health history, though some stressed individuals report no history.
# Uncertainty in stress correlates with unclear mental health history, indicating a need for further support.
SELECT Growing_Stress, Mental_Health_History, COUNT(*) AS count 
FROM mental_health_data
GROUP BY Growing_Stress, Mental_Health_History;

# Comparison of Mood Swings Based on Coping Strategies:
# Mood swings (low, medium, or high) significantly impact coping abilities,
# with high mood swings most closely associated with coping struggles.
SELECT Mood_Swings, Coping_Struggles, COUNT(*) AS count 
FROM mental_health_data
GROUP BY Mood_Swings, Coping_Struggles;

# Comparison of Mental Health History by Occupation:
# "Maybe" responses are prevalent, especially among housewives, corporate workers, + students
# High "Maybe" and "Yes" responses can suggest these groups may be at a higher risk for mental health concerns
SELECT Occupation, Mental_Health_History, COUNT(*) AS count 
FROM mental_health_data
GROUP BY Occupation, Mental_Health_History 
ORDER BY count DESC;

# Patterns of Mental Health Treatment Across Countries:
# US leads in treatment/varied treatment patterns in Europe
# Lower counts in countries like Brazil, Russia, + South Africa suggest potential treatment gaps 
SELECT Country, treatment, COUNT(*) AS count_per_treatment 
FROM mental_health_data
GROUP BY Country, treatment 
ORDER BY count_per_treatment DESC;

# Stress Levels and Changes in Habits:
# Strong correlation between rising stress levels and behavioral changes
# significant # of people report growing stress without changing habits (27,281)
SELECT Growing_Stress, Changes_Habits, COUNT(*) AS count 
FROM mental_health_data
GROUP BY Growing_Stress, Changes_Habits;