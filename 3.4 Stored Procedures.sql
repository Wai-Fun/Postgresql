/*
Stored Procedure and scheduled procedure. 
- a named block of SQL code that can be executed whenever needed.
- A procedure is a reusable workflow that performs actions. 
- Procedure does not simplify the query, but it standadize the work flow. 
- A procedure can be automated using cron.schedule

Usage example: 
- Monthly report: e.g. create summary table
- Business procedure: e.g. Patients admitted, create billing record, create room assignment, create audit log
- Identify high-risk patients, insert alert, update patient status, record audit log, send notifications. 
*/

--Basic Syntax
CREATE OR REPLACE PROCEDURE procedure_name()
LANGUAGE plpgsql
AS $$
BEGIN
    -- SQL statements
END;
$$;
____________________________________________________________________________________________________________________________________________________________

-- Example 1: Generate Obesity Alert

DROP TABLE IF EXISTS pateint_alerts;
CREATE TABLE patient_alerts (
    patient_id INT,
    visit_date DATE,
    alert_type VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE generate_obesity_alerts()
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO patient_alerts
    (
        patient_id,
        visit_date,
        alert_type
    )
    SELECT
        patient_id,
        visit_date,
        'Obese'
    FROM patient_metrics
    WHERE bmi > 30;

END;
$$;

--Call the procedure
CALL generate_obesity_alerts();

--View the report: 
SELECT *
FROM patient_alerts; 

_______________________________________________________________________________________________________________________________________________________

--Example 2. Generate Monthly Report 

-- Create report table 
DROP TABLE IF EXISTS patient_risk_alerts;
CREATE TABLE patient_risk_alerts (
    patient_id INT,
    visit_date DATE,
    risk_level VARCHAR(20)
);

-- Create the Procedure
DROP PROCEDURE IF EXISTS generate_monthly_high_risk_report();
CREATE PROCEDURE generate_monthly_high_risk_report()
LANGUAGE plpgsql
AS $$
BEGIN

    INSERT INTO patient_risk_alerts
    (
        patient_id,
        visit_date,
        risk_level
    )
    SELECT
        patient_id,
        visit_date,
        'High Risk'
    FROM patient_metrics
    WHERE bmi > 25
       OR blood_pressure > 130
       OR blood_glucose > 120;

END;
$$;

--Call the procedure -- report will be updated and stored 
CALL generate_monthly_high_risk_report();

--View the Report
SELECT *
FROM patient_risk_alerts;

____________________________________________________________________________
--Automated the procedure: 

SELECT cron.schedule(
    'monthly report',
    '0 0 1 * *',
    'CALL generate_monthly_high_risk_report();'
);

/*
At midnight
on the first day
of every month

run:
CALL generate_monthly_high_risk_report()
*/








