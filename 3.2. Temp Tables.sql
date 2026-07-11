-- Temp Table 

-- A temporary table is a table that exists only for the current database session.
-- It is A real table that is temporary.
-- Like CTE, but usually use in more complex queries

-- Example 1: Create a Temporary Table
DROP TABLE IF EXISTS high_bmi_patients; 

CREATE TEMP TABLE high_bmi_patients AS
SELECT *
FROM patient_metrics
WHERE bmi > 30;

-- query the temp table 
SELECT *
FROM high_bmi_patients
WhERE blood_pressure >= 155;

-- Multiple queries to the same temp table 
SELECT *
FROM high_bmi_patients
WhERE cholesterol >= 205;


-- Example 2: Join Temp Tables

-- Create temp table 1
DROP TABLE IF EXISTS high_bmi;
CREATE TEMP TABLE high_bmi AS
SELECT
    patient_id,
    visit_date,
    bmi
FROM patient_metrics
WHERE bmi > 30;

--Create temp table 2
DROP TABLE IF EXISTS high_cost;
CREATE TEMP TABLE high_cost AS
SELECT
    patient_id,
    visit_date,
    treatment_cost
FROM patient_billing
WHERE treatment_cost > 100000;

--Join both temp tables
SELECT
    hb.patient_id,
    hb.visit_date,
    hb.bmi,
    hc.treatment_cost
FROM high_bmi hb
JOIN high_cost hc
ON hb.patient_id = hc.patient_id
AND hb.visit_date = hc.visit_date;


--Example 3: Create temp table from scratch, and update it: 

--Create table 
DROP TABLE IF EXISTS patient_alerts ;
CREATE TEMP TABLE patient_alerts (
    patient_id INT,
    alert_type VARCHAR(50)
);

--Insert data
INSERT INTO patient_alerts
VALUES
(101, 'Obese'),
(106, 'High Blood Pressure');

--Query
SELECT *
FROM patient_alerts;

-- Update Temp table
UPDATE patient_alerts
SET alert_type = 'High BMI'
WHERE alert_type = 'Obese';

--Query
SELECT *
FROM patient_alerts
WHERE alert_type = 'Obese';
