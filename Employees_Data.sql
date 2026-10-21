-- Create a table to store tourism employee data by region.
-- Includes male and female employees, total employees,
-- and Saudi participation percentage.
-------------------------------------------
USE TourismDB
GO

CREATE TABLE TourismEmployees (
Region VARCHAR(100),
Males INT,
Females INT,
TotalEmployees INT,
SaudiParticipation DECIMAL(5,2)
);


INSERT INTO TourismEmployees
(Region, Males, Females, TotalEmployees, SaudiParticipation)
VALUES
('Ar Riyadh', 53676, 48760, 102436, 28.94),
('Makkah Al Mukarramah', 45855, 32855, 78710, 26.30),
('Al Madinah Al Munawwarah', 7857, 5893, 13750, 21.60),
('Al Qaseem', 3298, 2662, 5960, 16.90),
('Eastern region', 16146, 19101, 35247, 22.20),
('Aseer', 3719, 3870, 7589, 15.10),
('Tabuk', 2785, 2352, 5137, 17.90),
('Hail', 982, 803, 1785, 12.80),
('Northern Borders', 431, 430, 861, 11.30),
('Jazan', 1522, 1716, 3238, 11.00),
('Najran', 517, 718, 1235, 9.60),
('Al Bahah', 546, 493, 1039, 14.40),
('Al Jawf', 568, 488, 1056, 12.30);



SELECT * FROM TourismEmployees; 