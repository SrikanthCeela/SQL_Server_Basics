--Table 1 creating table fields
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 2 creating table fields
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)

--Table 1 Insert
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

--Table 2 Insert
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

--SQL Basics

/*

Select Statement
*, TOP, DISTINCT, COUNT, AS, MAX, MIN, AVG

*/

--Get all data from table
USE [SQL Tutorial]
SELECT * 
FROM EmployeeDemographics;

--Get Top 5 data from table
--to check the sample of table fields and values which has millions of data
SELECT TOP 5 * 
FROM EmployeeDemographics;

--Get unique gender values
SELECT DISTINCT(Gender) 
FROM EmployeeDemographics;

-- how many non null values in LastName column
SELECT COUNT(LastName) 
FROM EmployeeDemographics;

-- give a column name for the above question as LastNameCount
SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics;

-- get the maximum salary from employee salary table
SELECT MAX(Salary)
FROM EmployeeSalary;

-- get the minimum salary
SELECT MIN(Salary)
FROM EmployeeSalary;

-- Average salary of all the employees
SELECT AVG(Salary)
FROM EmployeeSalary;

/*
Where Statement
=, <>, <, >, AND, OR, LIKE, NULL, NOT NULL, IN
*/

--where statement will helps to limit the amount of data and specify what data you want

-- get details whose age is greater than 30
SELECT *
FROM EmployeeDemographics
WHERE Age > 30;

-- get details of Male candidates and whose age is less than and include 32.
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male';

-- get details of Male candidates or whose age is less than and include 30.
SELECT *
FROM EmployeeDemographics
WHERE Age <= 30 OR Gender = 'Male';

--Wild Cards
-- get details of everybody whose last name starts with 'S'.
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%';

-- get details of everybody whose last name has 'S','O'
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%';

--get all the details of firstname without any nulls
SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NOT NULL;

-- get all the details of Jim and Toby
SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim','Toby');

/*
Group by, Order By
*/

SELECT Gender, COUNT(Gender) as CountGender
FROM EmployeeDemographics
GROUP BY Gender
ORDER BY CountGender DESC;

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC, Gender ASC;
