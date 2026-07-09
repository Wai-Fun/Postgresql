/*
- The WHERE clause is used to filter rows and return only records that meet a specific condition.
- The WHERE clause can be used with different operators and conditions, such as comparison operators 
(>, <, =, !=, >=, <=), logical operators (AND, OR, IN), and pattern matching operators (LIKE, %, _).
*/

SELECT *
FROM patient_demographics
WHERE gender = 'Male';


-- Where with numbers (>, <, =, !=, >=, <=)
SELECT *
FROM patient_demographics
WHERE age > 50;


-- Where with 'text'
SELECT *
FROM patient_demographics
WHERE first_name = 'James';


-- WHERE & 'AND' 
SELECT *
FROM patient_demographics
WHERE age > 50
AND gender = 'Male';


-- WHERE & 'OR' 
SELECT *
FROM patient_metrics
WHERE visit_type = 'OPD'
OR visit_type = 'Emergency';


--WHERE & 'IN'
SELECT *
FROM patient_metrics
WHERE visit_type IN ('OPD', 'IPD', 'Emergency');


-- Where & 'LIKE', '%', '_'  
SELECT *
FROM patient_demographics
WHERE first_name  Like 'J%';


SELECT *
FROM patient_demographics
WHERE first_name  Like 'J____';


SELECT *
FROM patient_demographics
WHERE first_name  Like 'J_%';


