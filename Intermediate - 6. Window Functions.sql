--Window FUnctions :One of the MOST POWERFUL SQL features. 


--Example 1 :ROW_NUMBER()OVER()
--Use Case Example- Number each visit for each patient.
SELECT
    patient_id,
    visit_date,
    ROW_NUMBER() OVER (
        PARTITION BY patient_id
        ORDER BY visit_date
    ) AS visit_number
FROM patient_metrics;

--Use Case Example: Latest visit for each patient
SELECT *
FROM (
    SELECT
        patient_id,
        visit_date,
        ROW_NUMBER() OVER (
            PARTITION BY patient_id
            ORDER BY visit_date DESC
        ) AS rn
    FROM patient_metrics
) t
WHERE rn = 1;

--EXAMPLE 2 : RANK()OVER()
--Use Case Example: Ranks rows, allowing ties.-- Rank the treatment cost for each patient
SELECT
    patient_id,
    treatment_cost,
    RANK() OVER (
        ORDER BY treatment_cost DESC
    ) AS cost_rank
FROM patient_billing;

--Use Case Example: The most expensive visit for each patient
SELECT *
FROM (
    SELECT
        patient_id,
        visit_date,
        treatment_cost,
        RANK() OVER (
            PARTITION BY patient_id
            ORDER BY treatment_cost DESC
        ) AS cost_rank
    FROM patient_billing
) t
WHERE cost_rank = 1;

-- Example 3. NTILE() OVER() 
-- Divide rows into groups (e.g. as quartiles) 
SELECT
    patient_id,
    treatment_cost,
    NTILE(4) OVER (
        ORDER BY treatment_cost DESC
    ) AS quartile
FROM patient_billing;

--Example 4 : Window Function WITH Aggregate Function 
-- AVG()OVER() similart to AVG() with GROUP BY BUT... 
-- perform calculations across a set of rows while still keeping every individual row

SELECT
    patient_id,
    payer_type,
    treatment_cost,
    AVG(treatment_cost) OVER (PARTITION BY payer_type) AS avg_cost_by_payer
FROM patient_billing;


--Example 5 : RUNNING TOTAL using Window Function WITH SUM()OVER()
-- perform calculations across a set of rows while still keeping every individual row
SELECT
    visit_date,
    treatment_cost,
    SUM(treatment_cost)
        OVER (ORDER BY visit_date)
        AS running_total
FROM patient_billing;



-- EXAMPLE 6 : MIN()OVER() and MAX()OVER() 
--Show each patient's cost alongside the highest cost.
SELECT
    patient_id,
    treatment_cost,
    MAX(treatment_cost) OVER () AS highest_cost,
	MIN (treatment_cost) OVER () AS lowest_cost
FROM patient_billing;

-- EXAMPLE 7 : LAG()OVER()
-- Look at the previous row 
SELECT
    patient_id,
    visit_date,
    bmi,
    LAG(bmi) OVER (
        PARTITION BY patient_id
        ORDER BY visit_date
    ) AS previous_bmi
FROM patient_metrics;


--EXAMPLE 8 : LEAD()OVER()
-- Look at the next row 
SELECT
    patient_id,
    visit_date,
    bmi,
    LEAD(bmi) OVER (
        PARTITION BY patient_id
        ORDER BY visit_date
    ) AS next_bmi
FROM patient_metrics;
