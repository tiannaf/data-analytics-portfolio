# Data Science Jobs and Salaries Dataset
# Purpose of this project is to explore the dataset and draw insights
# This dataset sparked my interest learning and growing in this field!
# Source: https://www.kaggle.com/datasets/ritiksharma07/data-science-jobs-and-salaries-indeed/data

# Read raw data file and create new table to clean and explore:
SELECT *
FROM `indeed-data science jobs list`;

CREATE TABLE data_science_jobs
LIKE `indeed-data science jobs list`;

SELECT * 
FROM data_science_jobs;

INSERT data_science_jobs
SELECT *
FROM `indeed-data science jobs list`;

# Data Cleaning - removed blank salary rows not needed

SELECT * 
FROM data_science_jobs
WHERE salary = ""
;

DELETE FROM data_science_jobs
WHERE salary = ""
;

SELECT `Job Title`
FROM data_science_jobs;

# Frequency by Job Title AND location
# Most common job title in the data is a Data Scientist
SELECT 
    `Job Title`, 
    COUNT(*) AS Frequency 
FROM 
    data_science_jobs 
GROUP BY 
	`Job Title` 
ORDER BY 
    Frequency DESC;

# Job Posting Density by Location
SELECT 
    Location, 
    COUNT(*) AS Posting_Count
FROM 
    data_science_jobs
GROUP BY 
    Location;
    
# Remote and hybrid (NY) jobs opportunities in data science
# Major urban centers on both coasts of the US continue to be hotspots for data science opportunities
SELECT Location,
COUNT(*) AS Frequency 
FROM 
    data_science_jobs 
GROUP BY 
	Location
ORDER BY 
    Frequency DESC;

# Most in Demand Job Titles Analysis
# Top 3: Data Scientist, Senior Data Scientist, Sr. Data Scientist
SELECT 
    `Job Title`, 
    COUNT(*) AS Posting_Count
FROM 
    data_science_jobs
GROUP BY 
    `Job Title`
ORDER BY 
    Posting_Count DESC;

# Salary Analysis: Min, Max
SELECT `Job Title`, MAX(Salary), MIN(Salary)
FROM data_science_jobs
GROUP BY `Job Title`;


# Average Salary by Job Title Analysis
# Executive, Data Scientist has the highest average salary
SELECT 
    `Job Title`,
    AVG((CAST(REPLACE(SUBSTRING_INDEX(Salary, ' - ', 1), '$', '') AS UNSIGNED) + 
         CAST(REPLACE(SUBSTRING_INDEX(Salary, ' - ', -1), '$', '') AS UNSIGNED)) / 2) AS Avg_Salary
FROM 
    data_science_jobs
GROUP BY 
    `Job Title`
ORDER BY 
    Avg_Salary DESC;

# Average Salary by Location Analysis
# Highest = remote in San Antonio, TX
SELECT 
    Location,
    AVG((CAST(REPLACE(SUBSTRING_INDEX(Salary, ' - ', 1), '$', '') AS UNSIGNED) + 
         CAST(REPLACE(SUBSTRING_INDEX(Salary, ' - ', -1), '$', '') AS UNSIGNED)) / 2) AS Avg_Salary
FROM 
    data_science_jobs
GROUP BY 
    Location
ORDER BY 
    Avg_Salary DESC;
    
# Query analyzes how job postings are distributed across different locations to identify emerging tech hubs/regions with growing demand.
SELECT 
    Location, 
    COUNT(*) AS Posting_Count
FROM 
    data_science_jobs
GROUP BY 
    Location
ORDER BY 
    Posting_Count DESC;

#Comparing Salary Ranges by Company
# USAA has the highest across all metrics
SELECT 
    Company,
    MIN(CAST(REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(Salary, '-', 1), '$', -1), ',', '') AS UNSIGNED)) AS Min_Salary,
    MAX(CAST(REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(Salary, '-', -1), '$', -1), ',', '') AS UNSIGNED)) AS Max_Salary,
    AVG(CAST(REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(Salary, '-', 1), '$', -1), ',', '') AS UNSIGNED)) AS Avg_Salary_Min,
    AVG(CAST(REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(Salary, '-', -1), '$', -1), ',', '') AS UNSIGNED)) AS Avg_Salary_Max
FROM 
    data_science_jobs
GROUP BY 
    Company
ORDER BY 
    Avg_Salary_Min DESC;

# Comparing Salary Ranges by Remote vs. On-Site Jobs
# Remote and hybrid offer higher salaries across all metrics compared to on-site only roles
SELECT 
    CASE 
        WHEN Location LIKE '%Remote%' THEN 'Remote'
        WHEN Location LIKE '%Hybrid%' THEN 'Hybrid'
        ELSE 'On-Site'
    END AS Work_Type,
    MIN(CAST(REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(Salary, '-', 1), '$', -1), ',', '') AS UNSIGNED)) AS Min_Salary,
    MAX(CAST(REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(Salary, '-', -1), '$', -1), ',', '') AS UNSIGNED)) AS Max_Salary,
    AVG(CAST(REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(Salary, '-', 1), '$', -1), ',', '') AS UNSIGNED)) AS Avg_Salary_Min,
    AVG(CAST(REPLACE(SUBSTRING_INDEX(SUBSTRING_INDEX(Salary, '-', -1), '$', -1), ',', '') AS UNSIGNED)) AS Avg_Salary_Max
FROM 
    data_science_jobs
GROUP BY 
    Work_Type
ORDER BY 
    Avg_Salary_Min DESC;

# Looking at job description keywords
# Machine learning appears 17 times, suggesting it's a critical skill
# Interesting/suprising to note SQL is not mentioned at all
SELECT 
    'Python' AS Skill,
    COUNT(*) AS Frequency
FROM 
    data_science_jobs
WHERE 
    `Short Description` LIKE '%Python%'
UNION ALL
SELECT 
    'SQL' AS Skill,
    COUNT(*) AS Frequency
FROM 
    data_science_jobs
WHERE 
    `Short Description` LIKE '%SQL%'
UNION ALL
SELECT 
    'Machine Learning' AS Skill,
    COUNT(*) AS Frequency
FROM 
    data_science_jobs
WHERE 
    `Short Description` LIKE '%Machine Learning%';
    
# Companies with the Most Job Postings
# Top 4: Booz Allen, PayPal,Greystones Consulting Group LLC, Adobe
SELECT 
    Company, 
    COUNT(*) AS Posting_Count
FROM 
    data_science_jobs
GROUP BY 
    Company
ORDER BY 
    Posting_Count DESC;


