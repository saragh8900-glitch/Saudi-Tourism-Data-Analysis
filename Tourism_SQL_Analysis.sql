USE TourismDB;
GO

-- Show tourism facilities in each region, from highest to lowest.
SELECT
Region,
ServicedFacilities,
Hotels,
TotalFacilities
FROM TourismFacilities
ORDER BY TotalFacilities DESC;

--------------------------------------------------

-- Calculate the percentage of hotels in each region.
SELECT
Region,
Hotels,
TotalFacilities,
CAST(Hotels * 100.0 / TotalFacilities AS DECIMAL(5,2)) AS HotelPercentage
FROM TourismFacilities
ORDER BY HotelPercentage DESC;

--------------------------------------------------

-- Show the number of employees in each region.
SELECT
Region,
Males,
Females,
TotalEmployees
FROM TourismEmployees
ORDER BY TotalEmployees DESC;

--------------------------------------------------

-- Compare male and female employees in each region.
SELECT
Region,
Males,
Females,
Males - Females AS GenderDifference,
 CASE
WHEN Males > Females THEN 'Males Higher'
WHEN Females > Males THEN 'Females Higher'
ELSE 'Equal'
END AS Comparison
FROM TourismEmployees
ORDER BY ABS(Males - Females) DESC;

--------------------------------------------------

-- Show Saudi participation percentages by region.
SELECT
Region,
SaudiParticipation
FROM TourismEmployees
ORDER BY SaudiParticipation DESC;

--------------------------------------------------

-- Calculate the number of employees per facility in each region.
SELECT
F.Region,
F.TotalFacilities,
E.TotalEmployees,
CAST(
E.TotalEmployees * 1.0 / NULLIF(F.TotalFacilities, 0)
AS DECIMAL(10,2)) AS EmployeesPerFacility
FROM TourismFacilities AS F
INNER JOIN TourismEmployees AS E
    ON F.Region = E.Region
ORDER BY EmployeesPerFacility DESC;

--------------------------------------------------

-- Classify Saudi participation as High, Medium, or Low.
SELECT
Region,
TotalEmployees,
SaudiParticipation,
CASE
WHEN SaudiParticipation >= 25 THEN 'High'
WHEN SaudiParticipation >= 15 THEN 'Medium'
ELSE 'Low'
END AS ParticipationCategory
FROM TourismEmployees
ORDER BY SaudiParticipation DESC;

--------------------------------------------------

-- Calculate total employees and male and female percentages.
SELECT
SUM(Males) AS TotalMales,
SUM(Females) AS TotalFemales,
SUM(TotalEmployees) AS TotalEmployees,
CAST(SUM(Males) * 100.0 / SUM(TotalEmployees) AS DECIMAL(5,2)) AS MalePercentage,
CAST(SUM(Females) * 100.0 / SUM(TotalEmployees) AS DECIMAL(5,2)) AS FemalePercentage
FROM TourismEmployees;

--------------------------------------------------

-- Compare Saudi participation in each region with the overall average.
SELECT
E.Region,
E.SaudiParticipation,
CASE
WHEN E.SaudiParticipation > A.AverageParticipation
 THEN 'Above Average'

WHEN E.SaudiParticipation < A.AverageParticipation
 THEN 'Below Average'

ELSE 'Equal to Average'
END AS ComparisonWithAverage
FROM TourismEmployees AS E

CROSS JOIN (SELECT AVG(SaudiParticipation) AS AverageParticipation
    FROM TourismEmployees) AS A
ORDER BY E.SaudiParticipation DESC;

-----------------------------------------
-- Compare the number of employees in each region with the average.

SELECT
Region,
TotalEmployees,
CAST((SELECT AVG(TotalEmployees * 1.0)FROM TourismEmployees)AS DECIMAL(10,2)) AS AverageEmployees,
CASE
WHEN TotalEmployees > (SELECT AVG(TotalEmployees * 1.0)FROM TourismEmployees ) 
THEN 'Above Average'

WHEN TotalEmployees < (SELECT AVG(TotalEmployees * 1.0)FROM TourismEmployees ) 
THEN 'Below Average'
ELSE 'Equal to Average'

END AS EmployeeComparison
FROM TourismEmployees
ORDER BY TotalEmployees DESC;

------------------------------
-- Check for missing values in the employee data.

SELECT
    SUM(CASE WHEN Region IS NULL THEN 1 ELSE 0 END) AS MissingRegions,
    SUM(CASE WHEN Males IS NULL THEN 1 ELSE 0 END) AS MissingMales,
    SUM(CASE WHEN Females IS NULL THEN 1 ELSE 0 END) AS MissingFemales,
    SUM(CASE WHEN TotalEmployees IS NULL THEN 1 ELSE 0 END) AS MissingTotalEmployees,
    SUM(CASE WHEN SaudiParticipation IS NULL THEN 1 ELSE 0 END) AS MissingParticipation
FROM TourismEmployees;  