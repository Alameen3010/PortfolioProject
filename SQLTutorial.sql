INSERT INTO EmployeeDemographics  VALUES
(1001, 'Him', 'Himothy', 23, 'Male'),
(1002, 'Pam', 'Schan', 29, 'Female'),
(1003, 'Dean', 'Mart', 30, 'Male'),
(1004, 'Dave', 'Tank', 34, 'Male'),
(1005, 'Tom', 'Scott', 23, 'Male'),
(1006, 'Kev', 'Pete', 27, 'Male'),
(1007, 'Nat', 'Hay', 29, 'Female'),
(1008, 'Justin', 'Jake', 31, 'Male'),
(1009, 'Stan', 'Louis', 35, 'Male'),
(1010, 'Kevin', 'Malone', 22, 'Male'),
(NULL, 'Ryan', 'Howard', NULL, NULL),
(1012, 'Hollly', 'Flax', 28, 'Female'),
(1013, 'Beth', 'Becky', NULL, 'Female');

DELETE EmployeeSalary


INSERT INTO EmployeeSalary VALUES
(1001, 'SalesMan', 7000),
(1002, 'UberDriver', 4000),
(1003, 'Receptionist', 5000),
(1004, 'Engineer', 15000),
(1005, 'HR', 4000),
(1006, 'SalesMan', 7000),
(1007, 'Accountant', 10000),
(1008, 'UberDriver', 4000),
(1009, 'SalesMan', 6000),
(1010, NULL, 8000),
(NULL, 'SalesMan', 6000),
(1012, NULL, 7000)



/*
Select Statement
Top,Distinct,Count,As, Max, Min, Avg
*/


--SELECT AVG(Salary)
--FROM EmployeeSalary


/*
Where Statement
=, <>, <, >, And, Or, Like
*/


Select *
FROM EmployeeSalary
WHERE JobTitle = 'SalesMan'

Select *
FROM EmployeeSalary
WHERE JobTitle = 'SalesMan' AND Salary = 7000

Select * 
FROM EmployeeDemographics
WHERE Age = 32 OR Gender = 'Male' 

Select *
FROM EmployeeDemographics
Where LastName LIKE 'S%O%'

/*
Group By, Order By
*/

SELECT *
FROM EmployeeDemographics
ORDER BY Age, FirstName


SELECT Gender,Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender, Age

SELECT Gender,Age, COUNT(Gender)
FROM EmployeeDemographics
Where Age = 23
GROUP BY Gender, Age


SELECT Gender, COUNT(Gender) As CountGender
FROM EmployeeDemographics
Where Age > 23
GROUP BY Gender
Order By Gender 


/*
Inner Joins, Full/Left/Right Outer Joins
*/

Select *
FROM EmployeeDemographics
Inner Join EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


Select *
FROM EmployeeDemographics
Right Outer Join EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select EmployeeDemographics.EmployeeID, FirstName, LastName,JobTitle, Salary
FROM EmployeeDemographics
left outer Join EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

Select EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM EmployeeDemographics
inner Join EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Kev'
ORDER BY Salary DESC

/*
 Union, Union All
*/

/*
 Case Statement
*/

SELECT FirstName, LastName, Age,
CASE	
	WHEN Age > 30 THEN 'Old'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age


Select FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .00001)
	ELSE Salary + (Salary * .03)
	END AS SalaryAfterRaise
FROM EmployeeDemographics
 Join EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID



/*
 Having Clause
*/
Select JobTitle, COUNT(JobTitle)
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) >1 

Select JobTitle, AVG(Salary)
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary)> 4500
ORDER BY AVG(Salary)

/*
Updating/Deleting Data
*/
SELECT *
FROM EmployeeDemographics

UPDATE EmployeeDemographics
SET EmployeeID = 1011
WHERE FirstName = 'Ryan'

UPDATE EmployeeDemographics
SET Age = 31, Gender = 'Male'
WHERE FirstName = 'Ryan'

DELETE FROM EmployeeDemographics
WHERE EmployeeID = 1013

/*
Aliasing
*/