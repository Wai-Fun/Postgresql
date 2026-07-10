--Subquery (aka inner query or nested query) is a SQL query inside another SQL query
-- Inner query run first, and then outer query.

-- Example 1: Scalar Subquery (return one value)
SELECT
    patient_id,
    treatment_cost,
    (
        SELECT AVG(treatment_cost)
        FROM patient_billing
    ) AS average_cost
FROM patient_billing;

--Example 2: Subquery with WHERE (subquery return 1 row)
SELECT *
FROM patient_metrics
WHERE visit_type =
(
    SELECT visit_type
    FROM patient_metrics
    WHERE patient_id = 111
);

--Example 3: Subquery with IN (subquery return multiple row)
SELECT *
FROM patient_metrics
WHERE patient_id IN
(
    SELECT patient_id
    FROM patient_billing
);

--Example 4: Subquery use as Temporary table
SELECT *
FROM
(
    SELECT
        payer_type,
        AVG(treatment_cost) AS avg_cost
    FROM patient_billing
    GROUP BY payer_type
) AS payer_summary
WHERE avg_cost > 50000;

