/*
- Both HAVING AND WHERE are used to filter data 
- WHERE filter rows (individual rows) before GROUP BY 
- HAVING filter aggregated groups after group by 
*/

SELECT visit_type, COUNT(*) AS total_visits
FROM patient_metrics
GROUP BY visit_type
HAVING COUNT(*) > 5;

SELECT visit_type, COUNT(*) AS total_visits
FROM patient_metrics
WHERE bmi > 30
GROUP BY visit_type
HAVING COUNT(*) > 3;

-- example: Find payers where insurance visits over $100,000 happened more than 3 times
SELECT payer_type, COUNT(*) AS expensive_visits
FROM patient_billing
WHERE treatment_cost > 100000
GROUP BY payer_type
HAVING COUNT(*) > 3;
