# Car Sales Database Analysis

This repository contains SQL scripts and analysis for a car sales database. The database consists of information about car sales, including details such as car ID, date, customer name, gender, annual income, car company and model, engine, transmission, color, price of car, dealer number, body style, phone number, and dealer region.

## Analysis Conducted

The following analysis has been carried out on the car sales database:

1. **Standardize Date**: Date formats in the database are standardized to ensure consistency.

2. **Concatenate Company and Model**: Company and model fields are concatenated to create a unified identifier for each car.

3. **Distinct Dealers**: Identification of distinct dealers within the database.

4. **Sales by Region**: Analysis of car sales by region to understand geographical trends.

5. **Yearly and Monthly Sales Data**: Aggregation of sales data to analyze yearly and monthly sales trends.

6. **Price Variation of Car Price**: Analysis of price variation to identify price trends over time.

7. **Total Sales of Dealers**: Calculation of total sales for each dealer.

8. **Car Sales by Type in Different Dealer Regions**: Analysis of car sales by type (e.g., sedan, SUV) in different dealer regions.

9. **Top 3 Selling Cars in Each Region**: Identification of the top 3 selling cars in each region.

10. **Total Gender Divide**: Analysis of the gender distribution among customers.

11. **Preference of Transmission for Male and Female**: Determination of transmission preferences (e.g., automatic, manual) among male and female customers.

12. **Body Style Preferences**: Analysis of body style preferences among male and female customers.

## Visualization

Explore interactive visualizations of the car sales insights on Tableau: [Car Sales Insights Dashboard](https://public.tableau.com/app/profile/shravan.bhat2216/viz/CarSalesInsightsDashboard/Dashboard1)

## Usage

1. Clone the repository to your local machine.
2. Execute the SQL scripts in your preferred SQL environment, ensuring proper connections to your database.
3. Customize the scripts as needed for your specific dataset and analysis requirements.
4. Review the analysis results to gain insights into car sales trends, customer preferences, and dealership performance.


## Data Cleaning Using SQL

This repository contains SQL queries for a data exploration and cleaning project. The project aimed to standardize data formats, populate missing values, separate address fields, update column values for uniformity, remove duplicates, and drop unused columns.

### Key Features

1. **Standardizing Date Format**
   - The SQL query [SQLQuery3.sql#L3](https://github.com/shrvnbht/Data-Cleaning-Using-SQL/blob/main/SQLQuery3.sql#L3) standardizes the date format across the dataset.

2. **Populating Property Addresses**
   - Missing property addresses are populated with relevant information. See [SQLQuery3.sql#L17](https://github.com/shrvnbht/Data-Cleaning-Using-SQL/blob/main/SQLQuery3.sql#L17) for details.

3. **Separating Property Address**
   - Property addresses are separated into street and city components using the SUBSTRING function. Refer to [SQLQuery3.sql#L40](https://github.com/shrvnbht/Data-Cleaning-Using-SQL/blob/main/SQLQuery3.sql#L40).

4. **Separating Owner's Address**
   - The owner's address is divided into street, city, and state using the PARSENAME function. See [SQLQuery3.sql#L66](https://github.com/shrvnbht/Data-Cleaning-Using-SQL/blob/main/SQLQuery3.sql#L66).

5. **Updating Column Values**
   - Columns containing 'Y' and 'N' values are updated to 'Yes' and 'No' for uniformity. View [SQLQuery3.sql#L92](https://github.com/shrvnbht/Data-Cleaning-Using-SQL/blob/main/SQLQuery3.sql#L92) for the query.

6. **Removing Duplicate Items**
   - Duplicate items in the table are removed using a Common Table Expression (CTE). See [SQLQuery3.sql#L114](https://github.com/shrvnbht/Data-Cleaning-Using-SQL/blob/main/SQLQuery3.sql#L114).

7. **Removing Unused Columns**
   - Unused columns are dropped from the dataset using the Drop function. Refer to [SQLQuery3.sql#L128](https://github.com/shrvnbht/Data-Cleaning-Using-SQL/blob/main/SQLQuery3.sql#L128) for implementation details.

### Usage
1. Clone the repository to your local machine.
2. Execute the SQL queries in your preferred SQL environment, ensuring proper connections to your database.
3. Customize the queries as needed for your specific dataset and cleaning requirements.

# COVID Data Analysis Project

## Overview

This project involves exploratory analysis of global COVID-19 data using SQL. The objective is to derive critical insights into various factors such as death rates, infection rates, vaccination rates, and regional trends. The analysis provides insights into the impact of the pandemic on different geographical locations.

## Key Insights

1. **Possibility of Death in India**: Analysis of mortality rates in India.
2. **Percentage of Population Infected**: Estimation of the percentage of population infected by the virus in India.
3. **Highest Infection Rate by Population**: Identification of regions with the highest infection rates per capita.
4. **Countries with Highest Death Count by Population**: Ranking countries based on death count per capita.
5. **Death Count by Continent**: Categorizing death counts by continent.
6. **Global Numbers**: Tracking global statistics such as new cases and deaths.
7. **Vaccination Rates**: Assessing the number of people vaccinated relative to the population in different locations.

## Usage

1. Access the provided SQL database containing COVID-19 data.
2. Run SQL queries to extract relevant data for analysis.
3. Analyze the retrieved data to derive insights and trends.
4. Visualize the findings using appropriate charts or graphs.
5. Document the insights obtained and share the analysis report.

### Dependencies
- SQL environment (e.g., MySQL, PostgreSQL, SQL Server)
- Access to the dataset to perform cleaning operations.

### Contributors
- [@shrvnbht](https://github.com/shrvnbht)
