DROP TABLE IF EXISTS patient_demographics;

CREATE TABLE patient_demographics (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    birth_date DATE
);

INSERT INTO patient_demographics
(patient_id, first_name, last_name, age, gender, birth_date)
VALUES
(101, 'Emma', 'Carter', 44, 'Female', '1979-09-25'),
(103, 'Michael', 'Reed', 36, 'Male', '1987-03-04'),
(104, 'Sophia', 'Bennett', 29, 'Female', '1994-03-27'),
(105, 'William', 'Hayes', 61, 'Male', '1962-08-28'),
(106, 'Olivia', 'Foster', 46, 'Female', '1977-07-30'),
(107, 'Charlotte', 'Morgan', 35, 'Female', '1988-12-01'),
(108, 'James', 'Turner', 43, 'Male', '1980-11-11'),
(109, 'Benjamin', 'Coleman', 38, 'Male', '1985-07-26'),
(110, 'Daniel', 'Parker', 34, 'Male', '1989-03-25'),
(111, 'Ethan', 'Brooks', 40, 'Male', '1983-06-14'),
(112, 'Logan', 'Sullivan', 37, 'Male', '1986-07-27');



