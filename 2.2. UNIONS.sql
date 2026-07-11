/*
- UNIONS -- Joins all the rows from 2 or more tables 

Union RUle: 
- The tables must have same number of columns
- Columns must be in the same position
- UNION removes duplicates
- UNION ALL keeps duplicates



Example of a use case:
This query creates a consolidated patient alert report by combining
patients who are obese (BMI > 30), have high blood pressure
(BP > 130), or have high treatment costs (> 10,000).

UNION is used to stack the results from multiple criteria into
a single output, making it easier to identify patients who
require clinical or financial attention.
*/

SELECT patient_id, bmi AS measures, 'Obese'AS LABEL 
FROM patient_metrics
WHERE bmi>30
UNION   
SELECT patient_id, blood_pressure, 'High_blood_pressure'AS LABEL 
FROM patient_metrics
WHERE blood_pressure>130
UNION
SELECT patient_id, treatment_cost, 'High_cost'
FROM patient_billing
WHERE treatment_cost>10000
ORDER BY patient_id;



