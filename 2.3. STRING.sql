-- Commonly used STRING functions (Only work if the datatype == string)

--1. CONCAT() :Combines strings together.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM patient_demographics; 

--2. CONCAT_WS() :Combines strings together, with separator
SELECT CONCAT_WS(' - ', first_name, last_name, gender) AS patient_info
FROM patient_demographics;

--3. ||, another way to do CONCAT()
SELECT first_name || ' ' || last_name AS full_name
FROM patient_demographics;

-- 4. UPPER() :Converts text to uppercase.
SELECT UPPER(first_name) AS first_name
FROM patient_demographics;

--5. LOWER() :Converts text to lowercase.
SELECT LOWER(first_name) AS first_name
FROM patient_demographics;

--6. INITCAP() :Capitalizes the first letter of each word.
SELECT INITCAP(first_name || ' ' || last_name) AS patient_name
FROM patient_demographics;
 
--7. LENGTH() :Returns the number of characters.
SELECT first_name, LENGTH(first_name) AS name_length
FROM patient_demographics;

--8. LEFT() :Returns characters from the left.
SELECT first_name, LEFT(first_name, 3) AS initials
FROM patient_demographics;

--9. RIGHT() :Returns characters from the right.
SELECT last_name, RIGHT(last_name, 3) AS suffix
FROM patient_demographics; 

--10**. SUBSTRING() : Extracts part of a string. 
-- This is a useful STRING function! 
SELECT first_name, SUBSTRING(first_name, 1, 3) AS short_name
FROM patient_demographics;

--11. POSITION() Finds where a character/string occurs.
SELECT first_name, POSITION('a' IN LOWER(first_name)) AS pos
FROM patient_demographics;

--12. REPLACE() :Replaces text.
SELECT REPLACE(visit_type, 'OPD', 'Outpatient') AS visit_type
FROM patient_metrics;

--13. TRIM() : Removes leading and trailing spaces.
SELECT patient_id,TRIM(first_name) AS clean_first_name,
FROM patient_demographics;

--14. LPAD() :Pads text on the left.
SELECT LPAD(patient_id::TEXT, 5, '0') -- output has 5 char, pad with '0'
FROM patient_demographics;

--15. 17. RPAD() : Pads text on the right.
SELECT RPAD(first_name, 10, '.') -- output has 10 char, pad with '.'
FROM patient_demographics;

--16. REVERSE() :Reverses text.
SELECT REVERSE(first_name)
FROM patient_demographics; 

-- Example of a use case: 
SELECT
    INITCAP(TRIM(first_name)) AS first_name,
    INITCAP(TRIM(last_name)) AS last_name,
    UPPER(TRIM(gender)) AS gender
FROM patient_demographics;



