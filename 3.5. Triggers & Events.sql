-- Triggers and Events 
-- A trigger is a piece of code that runs automatically when a specified event occurs on a table.
-- An event is an action performed on a table.
-- 2 type-- Trigger event; or Schedule event. 
-- in Postgresql: Database >> Schemas >> public >> Trigger Functions
____________________________________________________________________________________________________________________________________________________________

--Example 1: Audit Logging Trigger 
-- Who changed a patient's clinical measurements, what was changed, and when? 
-- This is common audit in EHR system, to ensure traceable changes for compliance, quality assurance and patient safety. 

-- Step 1: Create an Audit Table 
DROP TABLE IF EXISTS patient_metrics_audit;

CREATE TABLE patient_metrics_audit
(
    audit_id SERIAL PRIMARY KEY,
    patient_id INT,
    visit_date DATE,

    old_bmi NUMERIC(3,1),
    new_bmi NUMERIC(3,1),

    old_blood_pressure INT,
    new_blood_pressure INT,

    changed_at TIMESTAMP
);

--Step 2: Create Trigger Function 
DROP FUNCTION IF EXISTS audit_patient_metrics();

CREATE FUNCTION audit_patient_metrics()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO patient_metrics_audit
    (
        patient_id,
        visit_date,

        old_bmi,
        new_bmi,

        old_blood_pressure,
        new_blood_pressure,

        changed_at
    )
    VALUES
    (
        NEW.patient_id,
        NEW.visit_date,

        OLD.bmi,
        NEW.bmi,

        OLD.blood_pressure,
        NEW.blood_pressure,

        NOW()
    );

    RETURN NEW;

END;
$$;

-- *Step 3: Create Trigger 
DROP TRIGGER IF EXISTS trg_patient_metrics_audit
ON patient_metrics;

CREATE TRIGGER trg_patient_metrics_audit
AFTER UPDATE
ON patient_metrics
FOR EACH ROW
EXECUTE FUNCTION audit_patient_metrics();

--Step 4: Tesing -- Update a patient
UPDATE patient_metrics
SET bmi = 25.8,
    blood_pressure = 145
WHERE patient_id = 101
AND visit_date = '2026-05-13';

--Step 5: Trace output -- View Audit Log 
SELECT *
FROM patient_metrics_audit;

