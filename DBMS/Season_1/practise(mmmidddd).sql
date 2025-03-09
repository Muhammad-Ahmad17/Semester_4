create database jan_db
use jan_db

--____________A____________--
create table patient_tb(
	PatientID INT PRIMARY KEY
   ,FirstName VARCHAR(50)
   ,LastName VARCHAR(50)
   ,Gender CHAR(1)
   ,BirthDate DATE
   ,Phone VARCHAR(15)
   ,Email VARCHAR(100) UNIQUE
);
-- ADD CONSTRAIN PRIMARY KEY FOR PatientID , UNIQUE FOR EAMIL
-- 1: FIRST MAKE IT NULL
ALTER TABLE patient_tb 
ALTER COLUMN PatientID INT NOT NULL;
-- 2: AND THEN ADD CONSTRAIN PRIMARY KEY
--a
ALTER TABLE patient_tb 
ADD CONSTRAINT Pk_PatientId PRIMARY KEY (PatientID);
--b
ALTER TABLE patient_tb 
ADD CONSTRAINT Uk_Email UNIQUE(Email);
-- 3: DROP A CONSTRAIN
ALTER TABLE patient_tb 
DROP CONSTRAINT Pk_PatientId;
--DROP TABLE patient_tb
--____________B____________--
create table department_tb(
	DepartmentID INT PRIMARY KEY,
	DepartmentName VARCHAR(100),
);

--____________C____________--
--1
create table doctor_tb(
	DoctorID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Specialty VARCHAR(100),
	DepartmentID INT FOREIGN KEY REFERENCES department_tb(DepartmentID)
);
--2
create table doctor1_tb(
	DoctorID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Specialty VARCHAR(100),
	DepartmentID INT ,
	CONSTRAINT FK_DEP_ID FOREIGN KEY(DepartmentID) REFERENCES department_tb(DepartmentID)
);
DROP TABLE doctor1_tb
--3
create table doctor2_tb(
	DoctorID INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Specialty VARCHAR(100),
	DepartmentID INT
);
ALTER TABLE doctor2_tb
ADD CONSTRAINT FK_DEP_ID FOREIGN KEY(DepartmentID) REFERENCES department_tb(DepartmentID)
DROP table doctor2_tb

--____________D____________--

create table treatment_tb(
	TreatmentID INT PRIMARY KEY,
	PatientID INT FOREIGN KEY REFERENCES patient_tb(PatientID),
	DoctorID INT  FOREIGN KEY REFERENCES doctor_tb(DoctorID),
	TreatmentDate DATE,
	Diagnosis VARCHAR(50),
	Treatment VARCHAR(100)
);

------------------------------------------------------------------------------------------------------------------------
INSERT INTO patient_tb values 
(101, 'John', 'Doe', 'M', '1985-07-20', '555-1234', 'john.doe@example.com'), 
(102, 'Jane', 'Smith', 'F', '1990-02-14', '555-5678', 'jane.smith@example.com'), 
(103, 'Robert', 'Brown', 'M', '1978-09-30', '555-8765', 'robert.brown@example.com'), 
(104, 'Emily', 'White', 'F', '2000-01-05', '555-4321', 'emily.white@example.com'), 
(105, 'Michael', 'Green', 'M', '1995-12-18', '555-9876', 'michael.green@example.com');

INSERT INTO doctor_tb values 
(201, 'Alice', 'Johnson', 'Cardiology', 2),
(202, 'Bob', 'Williams', 'Pediatrics', 3), 
(203, 'Charlie', 'Miller', 'Neurology', 5),
(204, 'Diana', 'Clark', 'Orthopedics', 4),
(205, 'Ethan', 'Taylor', 'Surgery', 1);


INSERT INTO department_tb values 
(1, 'Surgery'), 
(2, 'Cardiology'),
(3, 'Pediatrics'),
(4, 'Orthopedics'),
(5, 'Neurology');

INSERT INTO treatment_tb values 
 (301, 101, 205, '2024-01-10', 'Appendicitis', 'Appendectomy'),
 (302, 102, 201, '2024-02-15', 'Heart Disease', 'Cardiac Surgery'), 
(303, 103, 202, '2024-03-12', 'Bronchitis', 'Antibiotics'), 
(304, 104, 203,'2024-04-20', 'Migraine', 'Medication'), 
 (305, 105, 204, '2024-05-25', 'Fractured Leg', 'Surgery');


--B
SELECT FirstName+ ' ' +LastName [Full Name] FROM doctor_tb 

select * 

--D
SELECT count(PatientID) FROM treatment_tb
group by Treatment ;

--E
SELECT * FROM treatment_tb
order by TreatmentDate;


SELECT * FROM patient_tb;
SELECT * FROM department_tb;
SELECT * FROM doctor_tb;
SELECT * FROM treatment_tb








---

SELECT * FROM INFORMATION_SCHEMA.TABLES;
SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;
EXEC sp_help 'patient_tb';
SELECT * FROM sys.messages WHERE message_id = 156;
SELECT name FROM sys.procedures;

---