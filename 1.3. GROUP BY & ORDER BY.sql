/*
- GROUP BY → combines rows into groups so you can perform calculations on each group
- ORDER BY → sorts the final result set
*/ 


-- Group by & Aggrerate functions 
SELECT gender, COUNT(gender)
FROM patient_demographics
GROUP BY gender;


SELECT gender, avg(age), MIN(age), MAX(age)
FROM patient_demographics
GROUP BY gender;


SELECT payer_type, SUM(treatment_cost) AS total_cost
FROM patient_billing
GROUP BY payer_type;


-- ORDER BY (sort accending)
SELECT *
FROM patient_demographics
ORDER BY age;


-- ORDER BY and DESC (sort decending)
SELECT *
FROM patient_demographics
ORDER BY age DESC;


-- ORDER BY multiple columns
SELECT *
FROM patient_demographics
ORDER BY gender, age;  


-- GROUP BY & ORDER BY, with DESC and LIMIT
SELECT visit_type, COUNT(*) AS total_visits
FROM patient_metrics
GROUP BY visit_type
ORDER BY total_visits DESC
LIMIT 3;
