 -- Functions --a reusable calculation or query that you can call whenever you need it.
 

-- Example 1: Function returning a table 
-- Patient with bmi>30 (include pt id, visit date and bmi) 
DROP FUNCTION IF EXISTS high_risk_patients();

CREATE FUNCTION high_risk_patients()
RETURNS TABLE (
    patient_id INT,
    visit_date DATE,
    bmi NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN

    RETURN QUERY
    SELECT
        pm.patient_id,
        pm.visit_date,
        pm.bmi
    FROM patient_metrics pm
    WHERE pm.bmi > 30;

END;
$$;

-- Run the function: 
SELECT *
FROM high_risk_patients(); 



--Example 2: Function with PARAMETER that return a value: 
-- What's the age of a particular patient? 

DROP FUNCTION IF EXISTS get_patient_age(INT);

CREATE FUNCTION get_patient_age(p_patient_id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
	patient_age INT;

BEGIN

    SELECT age
    INTO patient_age
    FROM patient_demographics
    WHERE patient_id = p_patient_id;

    RETURN 
		patient_age;

END;
$$;

--Run the function
SELECT get_patient_age(101);


--Example 3 - Functions WITHOUT PARAMETERS that return a value
-- What's the total patients? 

DROP FUNCTION IF EXISTS total_patients();

CREATE FUNCTION total_patients()
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    patient_count INT;

BEGIN

    SELECT COUNT(*)
    INTO patient_count
    FROM patient_demographics;

    RETURN patient_count;

END;
$$;

-- Run the function 
SELECT total_patients();


--Example 4: Functions + IF statement
-- What's bmi category base on paitent ID and visit date? 

DROP FUNCTION IF EXISTS bmi_category(INT);

CREATE FUNCTION bmi_category(p_patient_id INT)
RETURNS VARCHAR(20)
LANGUAGE plpgsql
AS $$
DECLARE
    patient_bmi NUMERIC;

BEGIN

    -- Get BMI from the patient's latest visit
    SELECT pm.bmi
    INTO patient_bmi
    FROM patient_metrics pm
    WHERE pm.patient_id = p_patient_id
    ORDER BY pm.visit_date DESC
    LIMIT 1;

    -- Categorize BMI
    IF patient_bmi >= 30 THEN
        RETURN 'Obese';

    ELSIF patient_bmi >= 25 THEN
        RETURN 'Overweight';

    ELSE
        RETURN 'Normal';

    END IF;

END;
$$;

-- Run the function
