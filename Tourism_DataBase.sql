---------------------------------------------------
-- Tourism Facilities and Employees Analysis
-- Purpose: Combine tourism facilities and employee data by region.
-- INNER JOIN matches regions between both tables.
-- Results are sorted by total employees in descending order.
---------------------------------------------------
USE TourismDB;

INSERT INTO TourismFacilities
(Region, ServicedFacilities, Hotels, TotalFacilities)
VALUES
('Ar Riyadh', 1020, 261, 1281),
('Makkah Al Mukarramah', 681, 1684, 2365),
('Al Madinah Al Munawwarah', 199, 496, 695),
('Al Qaseem', 106, 32, 138),
('Eastern region', 390, 159, 549),
('Aseer', 338, 112, 450),
('Tabuk', 92, 90, 182),
('Hail', 86, 17, 103),
('Northern Borders', 28, 18, 46),
('Jazan', 116, 88, 204),
('Najran', 71, 36, 107),
('Al Bahah', 74, 15, 89),
('Al Jawf', 57, 12, 69);

SELECT * FROM TourismFacilities;
----------------
USE TourismDB;
GO
SELECT
F.Region,
F.Hotels,
F.TotalFacilities,
E.TotalEmployees,
E.SaudiParticipation
FROM TourismFacilities AS F
INNER JOIN TourismEmployees AS E
  ON F.Region = E.Region
ORDER BY E.TotalEmployees DESC;

----------------------

USE TourismDB;
 GO
SELECT Region, COUNT(*) AS RegionCount 
FROM TourismFacilities 
GROUP BY Region
HAVING COUNT(*) > 1;



