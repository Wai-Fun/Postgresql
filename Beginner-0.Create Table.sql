-- The following SQL statements create three relational tables that will serve as the foundation for the subsequent analysis and discussion.

--Table 1
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


--Table 2
DROP TABLE IF EXISTS patient_metrics;

CREATE TABLE patient_metrics (
  patient_id INTEGER NOT NULL,
  visit_date DATE NOT NULL,
  bmi NUMERIC(3,1),
  blood_pressure INT,
  blood_glucose INT,
  cholesterol INT,
  having_condition INT,
  visit_type VARCHAR(20),
  PRIMARY KEY (patient_id, visit_date)
);

INSERT INTO patient_metrics 
(patient_id, visit_date, bmi, blood_pressure, blood_glucose, cholesterol, having_condition, visit_type)
VALUES
(101, '2026-05-01', 34.7, 102, 155, 259, 1, 'OPD'),
(102, '2026-05-02', 36.0, 122, 88, 177, 0, 'Emergency'),
(103, '2026-05-03', 23.6, 113, 170, 208, 0, 'OPD'),
(104, '2026-05-04', 28.4, 100, 215, 282, 1, 'IPD'),
(105, '2026-05-05', 20.4, 106, 164, 200, 0, 'OPD'),
(106, '2026-05-06', 32.4, 157, 170, 298, 1, 'IPD'),
(107, '2026-05-07', 32.2, 136, 99, 161, 0, 'OPD'),
(108, '2026-05-08', 25.5, 114, 102, 199, 0, 'IPD'),
(109, '2026-05-09', 27.1, 162, 81, 281, 0, 'OPD'),
(110, '2026-05-10', 26.5, 110, 187, 262, 0, 'IPD'),
(111, '2026-05-11', 18.9, 101, 163, 163, 0, 'Emergency'),
(112, '2026-05-12', 34.7, 126, 206, 181, 0, 'IPD'),
(101, '2026-05-13', 23.2, 131, 218, 288, 1, 'OPD'),
(102, '2026-05-14', 23.2, 106, 145, 295, 1, 'Emergency'),
(103, '2026-05-15', 26.2, 137, 98, 204, 1, 'OPD'),
(104, '2026-05-16', 32.0, 117, 186, 269, 0, 'IPD'),
(105, '2026-05-17', 24.0, 130, 84, 224, 0, 'Emergency'),
(106, '2026-05-18', 17.2, 136, 71, 170, 0, 'OPD'),
(107, '2026-05-19', 22.6, 107, 186, 282, 1, 'OPD'),
(108, '2026-05-20', 29.1, 167, 87, 236, 0, 'OPD'),
(109, '2026-05-21', 37.9, 160, 72, 208, 1, 'IPD'),
(110, '2026-05-22', 20.7, 102, 204, 238, 0, 'IPD');

--Table 3
DROP TABLE IF EXISTS patient_billing;

CREATE TABLE patient_billing (
  patient_id INTEGER NOT NULL,
  visit_date DATE NOT NULL,
  treatment_cost INT,
  payer_type VARCHAR(20),
  PRIMARY KEY (patient_id, visit_date)
);

INSERT INTO patient_billing
(patient_id, visit_date, treatment_cost, payer_type)
VALUES
(101, '2026-05-01', 135932, 'Insurance'),
(102, '2026-05-02', 20023, 'Corporate'),
(103, '2026-05-03', 134608, 'Insurance'),
(104, '2026-05-04', 70803, 'Insurance'),
(105, '2026-05-05', 72148, 'Corporate'),
(106, '2026-05-06', 23457, 'Self-Pay'),
(107, '2026-05-07', 15534, 'Self-Pay'),
(108, '2026-05-08', 143643, 'Self-Pay'),
(109, '2026-05-09', 128375, 'Insurance'),
(110, '2026-05-10', 26662, 'Corporate'),
(111, '2026-05-11', 117252, 'Insurance'),
(112, '2026-05-12', 126409, 'Corporate'),
(101, '2026-05-13', 66623, 'Corporate'),
(102, '2026-05-14', 22047, 'Self-Pay'),
(103, '2026-05-15', 25959, 'Corporate'),
(104, '2026-05-16', 72840, 'Insurance'),
(105, '2026-05-17', 97264, 'Corporate'),
(106, '2026-05-18', 54859, 'Insurance'),
(107, '2026-05-19', 110081, 'Insurance'),
(108, '2026-05-20', 128249, 'Insurance'),
(109, '2026-05-21', 43384, 'Self-Pay'),
(110, '2026-05-22', 137121, 'Insurance');
