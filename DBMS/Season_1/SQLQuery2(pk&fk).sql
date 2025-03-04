-- Step 1: Create HRDB and CompanyDB databases
CREATE DATABASE HRDB;
CREATE DATABASE CompanyDB;
GO

-- Step 2: Create Departments table in HRDB
USE HRDB;
GO
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,  -- Unique ID for each department
    DepartmentName VARCHAR(50) NOT NULL -- Name of the department
);
GO

-- Step 3: Insert sample departments into HRDB
INSERT INTO Departments (DepartmentID, DepartmentName) 
VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');
GO

-- Step 4: Create Employees table in CompanyDB with a foreign key reference to HRDB
USE CompanyDB;
GO
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY, -- Unique Employee ID
    Name VARCHAR(100) NOT NULL, -- Employee Name
    DepartmentID INT, -- Foreign Key references HRDB.dbo.Departments
    FOREIGN KEY (DepartmentID) REFERENCES HRDB.dbo.Departments(DepartmentID) -- Default foreign key
);
GO

-- Step 5: Insert sample employees into CompanyDB
INSERT INTO Employees (EmployeeID, Name, DepartmentID)
VALUES (101, 'Alice', 1),  -- Alice works in HR
       (102, 'Bob', 2),    -- Bob works in IT
       (103, 'Charlie', NULL); -- Charlie has no assigned department
GO

-- Step 6: Try deleting a department without CASCADE (Should Fail)
USE HRDB;
GO
PRINT 'Attempting to delete Department 1 (HR) - Expected to fail';
DELETE FROM Departments WHERE DepartmentID = 1;
-- ❌ This will fail because Employee Alice (ID 101) is still linked to HR.

-- Step 7: Modify the Foreign Key to ON DELETE CASCADE (Auto-delete employees)
USE CompanyDB;
GO
PRINT 'Updating foreign key to ON DELETE CASCADE';
ALTER TABLE Employees DROP CONSTRAINT Employees_DepartmentID_FK;
ALTER TABLE Employees
ADD CONSTRAINT Employees_DepartmentID_FK
FOREIGN KEY (DepartmentID) REFERENCES HRDB.dbo.Departments(DepartmentID)
ON DELETE CASCADE;
GO

-- Step 8: Test CASCADE delete (Deleting IT Department should delete Bob)
USE HRDB;
GO
PRINT 'Deleting Department 2 (IT) - Employee Bob should be deleted';
DELETE FROM Departments WHERE DepartmentID = 2;
GO

-- Step 9: Modify the Foreign Key to ON DELETE SET NULL (Keep employees but remove reference)
USE CompanyDB;
GO
PRINT 'Updating foreign key to ON DELETE SET NULL';
ALTER TABLE Employees DROP CONSTRAINT Employees_DepartmentID_FK;
ALTER TABLE Employees
ADD CONSTRAINT Employees_DepartmentID_FK
FOREIGN KEY (DepartmentID) REFERENCES HRDB.dbo.Departments(DepartmentID)
ON DELETE SET NULL;
GO

-- Step 10: Test SET NULL delete (Deleting HR Department should set Alice's DepartmentID to NULL)
USE HRDB;
GO
PRINT 'Deleting Department 1 (HR) - Alice should remain but have NULL DepartmentID';
DELETE FROM Departments WHERE DepartmentID = 1;
GO

-- Step 11: View final Employees table in CompanyDB
USE CompanyDB;
GO
PRINT 'Final Employees Table:';
SELECT * FROM Employees;
GO
