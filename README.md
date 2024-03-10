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

### Dependencies
- SQL environment (e.g., MySQL, PostgreSQL, SQL Server)
- Access to the dataset to perform cleaning operations.

### Contributors
- [@shrvnbht](https://github.com/shrvnbht)
