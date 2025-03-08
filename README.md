# United States National Highway Research

## 📌 Overview

This project analyzes highway accident data collected by the National Highway Traffic Safety Administration (NHTSA) for the year 2021. The goal is to identify patterns, risk factors, and potential improvements to enhance road safety in the United States.

## 📊 Data Collection

The dataset is provided in a .sql file and contains various details about each accident, including location, crash conditions, casualties, vehicle involvement, and people affected.

## 🔍 Key Data Fields

- Location & Time: State, city, land use type, road classification, specific mile point, and timestamp.

- Crash Details: Type of collision, intersection type, lighting conditions, weather conditions.

- Casualties & Injury Data: Number of fatalities and involvement of drunk drivers.

- Vehicle Information: Total vehicles involved, motor vehicles in transport, parked or working vehicles.

- People Involved: Occupants and non-occupants (e.g., pedestrians, cyclists).

- Unique Identifier: Consecutive record number.

## 🛠️ Data Processing

- Cleaning: Used PostgreSQL to remove inconsistencies such as "unknown" values in land_use_name and "not reported" in manner_of_collision_name.

- Time Zone Handling: Created a separate table to standardize time zones across different U.S. regions.

## 📈 Exploratory Data Analysis (EDA)

We performed an in-depth analysis to identify key trends:

- Conditions Increasing Accident Risk – Examined intersection type, lighting conditions, and weather.

- Top 10 States with the Most Accidents – Identified high-risk states.

- Hourly Crash Patterns – Analyzed crash frequency by hour.

- Drunk Driving Impact – Measured percentage of accidents caused by impaired driving.

- Urban vs. Rural Accidents – Compared crash occurrences in different land use types.

- Daily Accident Trends – Determined the most accident-prone days.

## 📊 Key Findings

- Accidents are most frequent during the day (especially between 10:00 AM - 4:00 PM), highlighting the need for better signage, road markings, and speed regulation.

- Top 3 states with the highest accidents: Texas, California, and Florida.

- Drunk driving is a significant factor – Stricter enforcement and public awareness campaigns are needed.

- Accidents peak on Sundays at 5:00 PM (average 7.78 accidents), suggesting a need for traffic regulation adjustments during weekends and holidays.

## 🚦 Recommendations

✔️ Enhance Traffic Signs & Road Markings – Improve visibility in both day and night conditions.
✔️ Stricter Law Enforcement – Increase traffic patrols, especially in high-risk states and accident-prone hours.
✔️ Regulate Weekend & Holiday Traffic – Implement open-close road systems or speed control policies.
✔️ Strengthen Drunk Driving Regulations – Conduct stricter roadside checks and increase penalties.
✔️ Improve Urban Driving Policies – Adapt road safety measures for high-traffic areas.

## 📌 Conclusion

By implementing these measures, we can significantly reduce highway accidents and create a safer road environment for all users.

📍 This analysis is part of a group project conducted during our bootcamp.
