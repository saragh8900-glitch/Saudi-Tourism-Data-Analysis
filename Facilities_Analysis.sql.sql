USE TourismDB;
GO

SELECT Region , Hotels  FROM TourismFacilities 

WHERE Hotels > 100

ORDER BY Hotels DESC;
-- Display regions with more than 100 hotels, sorted from highest to lowest.

---------------

SELECT Region , ServicedFacilities  FROM TourismFacilities 

WHERE ServicedFacilities > 500

ORDER BY ServicedFacilities DESC;

-- Display regions with more than 500 serviced facilities.
----------------

SELECT COUNT(*) AS TotalRegion 

FROM TourismFacilities
-- Count the total number of regions in the TourismFacilities table.

------------------
SELECT SUM(TotalFacilities) AS TourismFacilitiesServisedFacilites 

FROM TourismFacilities
-- Calculate the total number of tourism facilities across all regions.
------------------
SELECT AVG(Hotels) AS AverageHotel

FROM TourismFacilities
-- Calculate the average number of hotels across all regions.

-------------------
SELECT 

MAX(Hotels) AS HaighstHotels,
MIN(Hotels) AS LowestHotels

FROM TourismFacilities;

------------------
SELECT Region , TotalFacilities FROM TourismFacilities
WHERE TotalFacilities > 500 
ORDER BY TotalFacilities DESC;
-- Display regions with more than 500 total tourism facilities.
-----------------------
