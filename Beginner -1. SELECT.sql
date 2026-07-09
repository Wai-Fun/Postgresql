-- SELECT everthing (all the columns) from a table
SELECT *
FROM patient_demographics
  

-- SELECT a specific column from a table
SELECT patient_id
FROM patient_demographics;


-- SELECT 2 specific columns from a table
SELECT patient_id, gender
FROM patient_demographics;


-- Use SELECT to reorder the columns in the table
SELECT gender, age, birth_date, first_name, last_name, patient_id
FROM patient_demographics;


-- Use DISTICT for only unique value
SELECT DISTINCT gender
FROM patient_demographics;
