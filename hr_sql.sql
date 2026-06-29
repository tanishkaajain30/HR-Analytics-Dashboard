CREATE DATABASE hr_analysis;
USE hr_analysis;

CREATE TABLE hr_data (
Age INT,
Attrition VARCHAR(10),
BusinessTravel VARCHAR(50),
DailyRate INT,
Department VARCHAR(50),
DistanceFromHome INT,
Education INT,
EducationField VARCHAR(50),
EmployeeCount INT,
EmployeeNumber INT,
EnvironmentSatisfaction INT,
Gender VARCHAR(20),
HourlyRate INT,
JobInvolvement INT,
JobLevel INT,
JobRole VARCHAR(100),
JobSatisfaction INT,
MaritalStatus VARCHAR(30),
MonthlyIncome INT,
MonthlyRate INT,
NumCompaniesWorked INT,
Over18 VARCHAR(10),
OverTime VARCHAR(10),
PercentSalaryHike INT,
PerformanceRating INT,
RelationshipSatisfaction INT,
StandardHours INT,
StockOptionLevel INT,
TotalWorkingYears INT,
TrainingTimesLastYear INT,
WorkLifeBalance INT,
YearsAtCompany INT,
YearsInCurrentRole INT,
YearsSinceLastPromotion INT,
YearsWithCurrManager INT,
Age_Group VARCHAR(20),
Income_Group VARCHAR(20),
Experience_Group VARCHAR(20),
Distance_Group VARCHAR(20),
Promotion_Status VARCHAR(50)
);

-- Check Data 
SELECT * 
FROM hr_data
LIMIT 5;

-- Total employees (KPI)
SELECT COUNT(*) AS Total_Employees
FROM hr_data;

-- Attrition count
SELECT Attrition,
COUNT(*) AS Employee_Count
FROM hr_data
GROUP BY Attrition; 

-- Attrition Rate %
SELECT 
ROUND(
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100/COUNT(*),
2
) AS Attrition_Rate
FROM hr_data;

-- Attrition by Department
SELECT Department, Attrition,
COUNT(*) AS Count 
FROM hr_data
GROUP BY Department, Attrition
ORDER BY Department;

-- Attrition by Gender
SELECT Gender, Attrition,
COUNT(*) AS Count
FROM hr_data
GROUP BY Gender, Attrition;

-- Attrition by Job Role
SELECT JobRole,
COUNT(*) AS Attrition_Count
FROM hr_data
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY Attrition_Count DESC;

-- Overtime Analysis
SELECT OverTime, Attrition,
COUNT(*) AS Count
FROM hr_data
GROUP BY OverTime, Attrition;

-- Average Income
SELECT ROUND(AVG(MonthlyIncome),2) AS Avg_monthly_Income
FROM hr_data;

-- Age Group Analysis
SELECT Age_Group, Attrition, 
COUNT(*) AS Count
FROM hr_data
GROUP BY Age_Group, Attrition;