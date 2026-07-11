-- CTE, Common Table Expression
-- CTE is a temporary named result set that exists only for the duration of a query.
-- CTE has the similar function as subquery, BUT easier to read. 

--Example 1: Filter a summarized result

WITH patient_avg_cost AS (
    SELECT
        patient_id,
        AVG(treatment_cost) AS avg_cost
    FROM patient_billing
    GROUP BY patient_id
)
SELECT *
FROM patient_avg_cost
WHERE avg_cost > 50000;


-- Example 2: Join a CTE back to a table
WITH patient_avg_cost AS (
    SELECT
        patient_id,
        AVG(treatment_cost) AS avg_cost
    FROM patient_billing
    GROUP BY patient_id
)
SELECT
    pb.patient_id,
    pb.visit_date,
    pb.treatment_cost,
    pac.avg_cost
FROM patient_billing pb
JOIN patient_avg_cost pac
ON pb.patient_id = pac.patient_id;


-- Example 3: CTE + Window Function
WITH ranked_visits AS (
    SELECT
        patient_id,
        visit_date,
        treatment_cost,
        ROW_NUMBER() OVER (
            PARTITION BY patient_id
            ORDER BY treatment_cost DESC
        ) AS rn
    FROM patient_billing
)
SELECT *
FROM ranked_visits
WHERE rn = 1;


--Example 4: Multiple CTEs
WITH patient_avg_cost AS (
    SELECT
        patient_id,
        AVG(treatment_cost) AS avg_cost
    FROM patient_billing
    GROUP BY patient_id
),
high_cost_patients AS (
    SELECT *
    FROM patient_avg_cost
    WHERE avg_cost > 50000
)
SELECT *
FROM high_cost_patients;


--Example 5: Combining tables: Show patients who have both high BMI and high treatment costs.
WITH high_bmi AS (
    SELECT
        patient_id,
        visit_date,
        bmi
    FROM patient_metrics
    WHERE bmi > 30
),
high_cost AS (
    SELECT
        patient_id,
        visit_date,
        treatment_cost
    FROM patient_billing
    WHERE treatment_cost > 100000
)
SELECT
    hb.patient_id,
    hb.visit_date,
    hb.bmi,
    hc.treatment_cost
FROM high_bmi hb
JOIN high_cost hc
ON hb.patient_id = hc.patient_id
AND hb.visit_date = hc.visit_date;





