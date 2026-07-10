--CASE is used to create conditional logic inside a SQL query

--Example 1
SELECT
    patient_id,
    bmi,
    CASE
        WHEN bmi >= 30 THEN 'Obese'
        WHEN bmi >= 25 THEN 'Overweight'
        WHEN bmi >= 18.5 THEN 'Normal'
        ELSE 'Underweight'
    END AS bmi_category
FROM patient_metrics; 

--Example 2
SELECT
    patient_id,
    blood_pressure,
    CASE
        WHEN blood_pressure >= 140 THEN 'High'
        WHEN blood_pressure >= 120 THEN 'Elevated'
        ELSE 'Normal'
    END AS bp_category
FROM patient_metrics;

--Example 3
SELECT
    patient_id,
    CASE
        WHEN having_condition = 1 THEN 'Yes'
        WHEN having_condition = 0 THEN 'No'
    END AS condition_status
FROM patient_metrics;

--Example 4
SELECT
    patient_id,
    treatment_cost,
    CASE
        WHEN treatment_cost >= 100000 THEN 'Very High'
        WHEN treatment_cost >= 50000 THEN 'High'
        WHEN treatment_cost >= 10000 THEN 'Medium'
        ELSE 'Low'
    END AS cost_category
FROM patient_billing;

--Example 5 : CASE with aggregation
SELECT
    COUNT(*) AS total_patients,
    SUM(
        CASE
            WHEN having_condition = 1 THEN 1
            ELSE 0
        END
    ) AS patients_with_condition
FROM patient_metrics;

-- Example 6. CASE inside ORDER BY 
SELECT *
FROM patient_metrics
ORDER BY
CASE
    WHEN visit_type = 'Emergency' THEN 1
    WHEN visit_type = 'IPD' THEN 2
    WHEN visit_type = 'OPD' THEN 3
END;



