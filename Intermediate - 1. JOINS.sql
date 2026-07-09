/* 
JOINS 
- used to combine data from two or more tables. 
- combine tables horizontally (adds columns)
Note: Both tables, patiet_metrics and pateint_billing has composite primary key
*/

-- INNER JOIN / JOIN 
SELECT *
FROM patient_demographics pd
INNER JOIN patient_billing pb
ON pd.patient_id = pb.patient_id
ORDER BY first_name;


-- LEFT JOIN
SELECT *
FROM patient_demographics pd
LEFT JOIN patient_billing pb
ON pd.patient_id = pb.patient_id
ORDER BY first_name;


-- RIGHT JOIN
SELECT *
FROM patient_demographics pd
RIGHT JOIN patient_billing pb
ON pd.patient_id = pb.patient_id
ORDER BY first_name;


-- FULL OUTER JOIN
SELECT *
FROM patient_demographics pd
FULL OUTER JOIN patient_billing pb
ON pd.patient_id = pb.patient_id
ORDER BY first_name;


/*
-- CROSS JOIN: creates every possible combination of rows between two tables.
-- e.g.
patient_demographics has 12 patients
patient_metrics has 22 visit records 
CROSS JOIN of both tables will return 12 x 22 = 264 rows
*/

SELECT *
FROM patient_demographics
CROSS JOIN patient_metrics;


-- Join more than 2 tables
SELECT
    pd.patient_id,
    pd.first_name,
    pd.last_name,
    pm.visit_date,
    pm.visit_type,
    pm.bmi,
    pb.treatment_cost,
    pb.payer_type
FROM patient_demographics pd
JOIN patient_metrics pm
    ON pd.patient_id = pm.patient_id
JOIN patient_billing pb
    ON pm.patient_id = pb.patient_id
   AND pm.visit_date = pb.visit_date;
   

-- Common use cases
-- 1. Who has the three most expensive visits?
SELECT
    pd.first_name,
    pd.last_name,
    pb.treatment_cost
FROM patient_demographics pd
JOIN patient_billing pb
ON pd.patient_id = pb.patient_id
ORDER BY pb.treatment_cost DESC
LIMIT 3; 

-- 2. What's the average cost by payer type? 
SELECT
    payer_type,
    AVG(treatment_cost) AS avg_cost
FROM patient_billing
GROUP BY payer_type;

--3. Patients with high BMI (>30) and high treatment cost (>100000)
SELECT
    pm.patient_id,
    pm.bmi,
    pb.treatment_cost
FROM patient_metrics pm
JOIN patient_billing pb
ON pm.patient_id = pb.patient_id
AND pm.visit_date = pb.visit_date
WHERE pm.bmi > 30
AND pb.treatment_cost > 100000;

-- 4 SELF JOIN: How did the patient's BMI change from their first visit to their second visit?
SELECT
    pm1.patient_id,
    pm1.visit_date AS first_visit,
    pm2.visit_date AS second_visit,
    pm1.bmi AS first_bmi,
    pm2.bmi AS second_bmi,
    pm2.bmi - pm1.bmi AS bmi_change
FROM patient_metrics pm1
JOIN patient_metrics pm2
ON pm1.patient_id = pm2.patient_id
AND pm1.visit_date < pm2.visit_date;

