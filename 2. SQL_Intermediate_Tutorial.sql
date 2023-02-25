

--Table 1 Insert extra records 
Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL,NULL),
(1013, 'Darryl', 'Philbin', NULL,'Male')

SELECT *
FROM EmployeeDemographics


--Table 2 Insert extra records 
Insert into EmployeeSalary VALUES
(1010,NULL,47000),
(NULL,'Salesman',43000)

SELECT *
FROM EmployeeSalary

/*
Inner Joins, Full/Left/Right/Outer Joins
*/

-- A join is way to combine multiple tables into a single output


-- Inner Join based on the Empoyee ID common
/* Inner Join is gonna show everything that is in common or overlapping between table a and table b */

SELECT *
FROM EmployeeDemographics ed
JOIN EmployeeSalary es ON es.EmployeeID=ed.EmployeeID

--Full Outer Join
/*  its gonna show everything from table a and table b regardless of if it has a match based on what we were joining them */
SELECT *
FROM EmployeeDemographics ed
FULL OUTER JOIN EmployeeSalary es ON es.EmployeeID=ed.EmployeeID


--Left Outer Join
SELECT *
FROM EmployeeDemographics ed
LEFT JOIN EmployeeSalary es ON es.EmployeeID=ed.EmployeeID

--Right Outer Join
SELECT *
FROM EmployeeDemographics ed
RIGHT JOIN EmployeeSalary es ON es.EmployeeID=ed.EmployeeID



--Table 3 creating table fields
Create Table WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

--Table 3 Insert
Insert into WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')




/* 
UNION, UNION ALL
*/

--Full Outer join of both tables

SELECT * FROM EmployeeDemographics ed
FULL OUTER JOIN WareHouseEmployeeDemographics wed
ON ed.EmployeeID=wed.EmployeeID

-- UNION
--joins two tables without duplicates, but should have same columns(data type columns)

SELECT * FROM EmployeeDemographics
UNION
SELECT * FROM WareHouseEmployeeDemographics

--UNION ALL , will get duplicate records, but should have same columns(data type columns)
SELECT * FROM EmployeeDemographics
UNION ALL
SELECT * FROM WareHouseEmployeeDemographics


/*
CASE STATEMENT
*/

SELECT  FirstName,LastName,Age,
CASE
		WHEN Age > 30 THEN 'Old'
		WHEN Age BETWEEN 27 AND 30 THEN 'Young'
		ELSE 'Baby'
END AS Criteria
FROM EmployeeDemographics
WHERE Age  IS NOT NULL
ORDER BY Age


SELECT FirstName, LastName, JobTitle, Salary,
CASE
			WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
			WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
			WHEN JobTitle = 'HR' THEN Salary + (Salary * .001)
			ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM EmployeeDemographics ed
JOIN EmployeeSalary es ON es.EmployeeID=ed.EmployeeID


/*
HAVING CLAUSE
*/

SELECT JobTitle, COUNT(JobTitle)
FROM EmployeeDemographics ed
JOIN EmployeeSalary es ON es.EmployeeID=ed.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

/*
PARTITION BY
*/

SELECT FirstName, LastName, Gender, Salary
,ROW_NUMBER() OVER (PARTITION BY Gender ORDER BY Salary) AS TotalGender
FROM EmployeeDemographics ed
JOIN EmployeeSalary es
ON ed.EmployeeID=es.EmployeeID
