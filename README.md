# **United States National Highway Research**

Analysis of National Highway Traffic Safety Administration in the United States based on group project on our bootcamp

## **Background**

National Highway Traffic Safety Administration (NTHSA) is a Goverment department that focused on reducing highway accidents in the United States. NTHSA is currently on reducing the number of traffic accidents on higways.

We are one of the representatives of the company that was asked to analyze the data collected during 2021. This data is completed about accidents that occured during 2021

## **Data Collections**

The dataset I got in a .sql file

- Location & Time Identification
  - state_name: Name of the state where the crash occured
  - city_name: Name of city where the crash occured
  - land_use_name: Type of land use (e.g., urban area, rural area)
  - functional_system_name: Road type or classification (e.g., highway, arterial      road).
  - milepoint: specific mile point on the road where the crash happened
  - timestamp_of_crash: date and time of the crash

- Crash Details
  - manner_of_collision_name: Type of collision (e.g., head-on, side-impact)
  - type_of_intersection_name: Type of intersection at the crash (e.g., daylight,     dark-not lighted, dark-lighted, dusk)
  - atmospheric_conditions_1_name: weather conditions at the time of the crash        (e.g., clear, rain, cloudy, not reported)
    
- Casualties and Injury Data 
  - number_of_fatalities: Number of fatalities resulting from the crash
  - number_of_drunk_drivers: Number of drivers under the influence of alcohol         involved in the crash

- Vehicle Information
  - number_of_vehicle_forms_submitted_all: Total number of vehicle forms 
    submitted for all vehicle involved
  - number_of_motor_vehicle_in_transport_mvit: Number of motor vehicle in             transport (MVIT) involved in the crash
  - number_of_parked_working_vehicles: Number of parked or working vehicles           involved at the crash site

- People Involved (Occupants & Non-Occupants)
  - number_of_forms_submitted_for_persons_not_in_motor_vehicles: Number of people     submitted for non-motor vehicle occupants involved
  - number_of_persons_in_motor_vehicle_in_transport_mvit: Number of people inside     motor vehicle involved in the crash
  - numer_of_persons_not_in_motor_vehicle_in_transport_mvit: Number of people         involved who were not inside motor vehicle (e.g., pedestrians, cyclists)

- Unique Identification:
  - consecutive_number: Unique identifier for each crash record

## **Data Inspection**

In this process, we cleaned the data using SQL (PostgreSQL). There are several columns that we cleaned, such as the 'unknow' part in the land_use_name column and not reported in the manner_of_collison_name column. 
These columns were removed because they had a small amount of null data, so we decided to clean the data.

## **Exploratory Data Analysis (EDA)**
Exploratory Data Analysis with SQL and Spreadsheet for Data Visualization

Before we go to the EDA, another thing to note is the **timestamp_of_crash** column. In this column, we're see a lot of different timezones in different regions of the United States. 

Therefore, we created a new table for timezone so that the data for each state can be clearly distinguished. 

After the new table was created, we brainstormed teh data and found seeral things that needed to be analyzed. The things we analyzed were as follows:

1. Conditions that increase the risk of accidents
2. Top 10 states where the most accidents occur
3. Average number of crashes per day by hour of crash occurence
4. Percentage of crashes caused by drunk drivers
5. Percentage of crashes in rural and urban areas
6. Number of accidents by day

### **Conditions that increaces the risk of accidents**
![image](https://github.com/user-attachments/assets/21f41b73-9ade-42f3-81de-63c83db6328f)

From sum the risk of accidents by type_of_intersection_name, light_condition_name and atmospheric_condition_1_name 

### **Top 10 states where the most accidents occur**
![image](https://github.com/user-attachments/assets/436ef993-1e2a-440b-a9e7-3168fb0a97db)

From sum of the state where the most accidents occur, **order by state** and limit 10

### **Average number of crashes per day by hour of crash occurence**

![image](https://github.com/user-attachments/assets/f51fba91-2cfd-4737-8812-ddec3738993b)

Average of total accidents per day by hour (24H)

### **Percentage of crashes caused by drunk drivers**

![image](https://github.com/user-attachments/assets/20a4219c-5c57-4bab-bfff-67ae8507c495)

Percentage of crashes caused by drunk drivers and not caused by drunk drivers

### **Percentage of crashes in rural and urban areas**

![image](https://github.com/user-attachments/assets/0aae5343-cf2e-4530-9c53-1137558f8565)

Percentage of crashes in rural and urban areas

### **Number of accidents by day**

![image](https://github.com/user-attachments/assets/5ea4b1aa-737c-42b4-9b61-b11e82881b48)

from the sum of accident risk by day

## **Conclusion**
1. Data shows that accidents occur most often during the day, so we need to make traffic signs that can be seen both during the day and at night. In addition, we also need to make road markings and speed bumps so that they can be applied to drivers to increase their vigilance in driving.
   
2. We need to make new regulations on traffic procedures such as strengthening road rules, especially in the top 3 states with the most accidents, namely Texas, California, and Florida, regulating driving speed, forming policies related to the prohibition of distracted driving. Distracted driving can be caused by texting, eating and drinking, and even drunk driving.

3. Need to increase the number of police personnel and traffic officers at times of frequent accidents starting from 10.00 to 16.00 with the number of cases above 5.

4. We need to make new regulations on driving requirements, especially in urban areas, check and prohibit if found drunk drivers to continue driving on the road.

5. The data shows that accidents occur most often on Sundays at 17.00 with an average number of accidents of 7.78 so we need to make new regulations regarding traffic rules (especially on Saturdays and Sundays) such as making an open and close road system at certain hours and days (seen from the conduciveness of the road), for example during school holidays, thanksgiving day, religious holidays, labor days, and others.
