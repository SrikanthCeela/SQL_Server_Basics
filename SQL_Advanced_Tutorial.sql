/*
CTEs (Common Table Expression)
*/

WITH CTE_Employee as
	(
	SELECT FirstName, LastName, Gender, Salary
	,COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
	,AVG(Salary) OVER ( PARTITION BY Gender) AS AvgSalary
	FROM EmployeeDemographics ed
	JOIN EmployeeSalary es ON ed.EmployeeID=es.EmployeeID
	WHERE es.Salary > '45000'
	)

SELECT *
FROM CTE_Employee


/*
Temp Tables
*/

CREATE TABLE #temp_Employee (
EmployeeID INT,
JobTitle VARCHAR(100),
Salary INT
)

SELECT * FROM #temp_Employee

INSERT INTO #temp_Employee VALUES(
'1001', 'HR', '45000')

SELECT * FROM #temp_Employee

INSERT INTO #temp_Employee
SELECT * FROM EmployeeSalary

SELECT * FROM #temp_Employee


/*
String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower
*/


CREATE TABLE EmployeeErrors(
EmployeeID VARCHAR(50)
,FirstName VARCHAR(50)
,LastName VARCHAR(50)
)

INSERT INTO EmployeeErrors VALUES
('1001  ','Jimbo','Halbert')
,('  1002','Pamela','Beasely')
,('1005','TOby','Flenderson - Fired')



SELECT * FROM EmployeeErrors

--Using TRIM, LTRIM, RTRIM
SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors


-- Using Replace
SELECT LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors


-- Using Substring
SELECT FirstName, SUBSTRING(FirstName,1,3)
FROM EmployeeErrors

SELECT FirstName, SUBSTRING(FirstName,3,3)
FROM EmployeeErrors


-- Using UPPER and lower
SELECT FirstName
			,LOWER(FirstName) as lower_names
			,UPPER(FirstName) as upper_names
FROM EmployeeErrors


/*
Stored Procedures
*/

CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics

EXEC TEST --Executes the procedure

/*
Subqueries (in the select, from, and where statement)
*/

SELECT *
FROM EmployeeSalary

--Subquery in select statement
SELECT EmployeeID
			, Salary
			, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllavgSalary
FROM EmployeeSalary


-- How to do it with partition by
SELECT EmployeeID
			, Salary
			, AVG(Salary) OVER() AS AllavgSalary
FROM EmployeeSalary


--Subquery in FROM
SELECT a.EmployeeID, a.AllavgSalary
FROM (SELECT EmployeeID
						, Salary
						, AVG(Salary) OVER() AS AllavgSalary
			FROM EmployeeSalary) a

-- Subquery in WHERE
SELECT *
FROM EmployeeSalary
WHERE EmployeeID in (
										SELECT EmployeeID
										FROM EmployeeDemographics
										WHERE Age > 30
										)