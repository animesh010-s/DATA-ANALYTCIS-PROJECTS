CREATE TABLE Housing (
    UniqueID INT,
    ParcelID VARCHAR(50),
    LandUse VARCHAR(50),
    PropertyAddress VARCHAR(255),
    SaleDate DATE,
    SalePrice DECIMAL(10, 2),
    LegalReference VARCHAR(50),
    SoldAsVacant VARCHAR(3),
    OwnerName VARCHAR(255),
    OwnerAddress VARCHAR(255),
    Acreage DECIMAL(5, 2),
    TaxDistrict VARCHAR(50),
    LandValue DECIMAL(10, 2),
    BuildingValue DECIMAL(10, 2),
    TotalValue DECIMAL(10, 2),
    YearBuilt INT,
    Bedrooms INT,
    FullBath INT,
    HalfBath INT
);

-----------------------------------------------------------------------------------------------------------------------------------
COPY Housing
FROM 'G:\data analyst\Projects\sql\Housing_data_Cleaning.csv'
DELIMITER ','
CSV HEADER;

-------------------------------------------------------------------------------------------------------------------------------------

-- Q.1 Total number of properties
SELECT COUNT(*) AS TotalProperties FROM Housing;

-- Q.2 Average sale price of properties
SELECT AVG(SalePrice) AS AverageSalePrice FROM Housing;

-- Q.3 Properties sold as vacant
SELECT COUNT(*) AS VacantProperties FROM Housing WHERE SoldAsVacant = 'Yes';

-- Q.4 Average land value
SELECT AVG(LandValue) AS AverageLandValue FROM Housing;

-- Q.5 Average building value
SELECT AVG(BuildingValue) AS AverageBuildingValue FROM Housing;

-- Q.6 Average total value of properties
SELECT AVG(TotalValue) AS AverageTotalValue FROM Housing;

-- Q.7 Distribution of properties by land use
SELECT LandUse, COUNT(*) AS PropertyCount FROM Housing GROUP BY LandUse;

-- Q.8 Number of properties sold each year
SELECT EXTRACT(YEAR FROM SaleDate) AS SaleYear, COUNT(*) AS PropertiesSold FROM Housing GROUP BY SaleYear;

-- Q.9 Average sale price by year
SELECT EXTRACT(YEAR FROM SaleDate) AS SaleYear, AVG(SalePrice) AS AverageSalePrice FROM Housing GROUP BY SaleYear;

-- Q.10 Properties with more than 3 bedrooms
SELECT COUNT(*) AS PropertiesWithMoreThan3Bedrooms FROM Housing WHERE Bedrooms > 3;

-- Q.11 Properties built before 2000
SELECT COUNT(*) AS PropertiesBuiltBefore2000 FROM Housing WHERE YearBuilt < 2000;

-- Q.12 Average acreage of properties
SELECT AVG(Acreage) AS AverageAcreage FROM Housing;

-- Q.13 Properties with no full bathrooms
SELECT COUNT(*) AS PropertiesWithNoFullBathrooms FROM Housing WHERE FullBath = 0;

-- Q.14 Properties with no half bathrooms
SELECT COUNT(*) AS PropertiesWithNoHalfBathrooms FROM Housing WHERE HalfBath = 0;

-- Q.15 Properties by tax district
SELECT Tax District, COUNT(*) AS PropertyCount FROM Housing GROUP BY TaxDistrict;

-- Q.16 Top 5 most expensive properties
SELECT * FROM Housing ORDER BY SalePrice DESC LIMIT 5;

-- Q.17 Top 5 least expensive properties
SELECT * FROM Housing ORDER BY SalePrice ASC LIMIT 5;

-- Q.18 Properties owned by a specific owner
SELECT * FROM Housing WHERE OwnerName LIKE '%[COLE, DEBORAH K]%';

-- Q.19 Average value of properties by land use
SELECT LandUse, AVG(TotalValue) AS AverageValue FROM Housing GROUP BY LandUse;

-- Q.20 Properties with sale price above average
SELECT * FROM Housing WHERE SalePrice > (SELECT AVG(SalePrice) FROM Housing);

-- Q.21 Properties with land value below average
SELECT * FROM Housing WHERE LandValue < (SELECT AVG(LandValue) FROM Housing);

-- Q.22 Average number of bedrooms by land use
SELECT LandUse, AVG(Bedrooms) AS AverageBedrooms FROM Housing GROUP BY LandUse;

-- Q.23 Properties with building value above a certain threshold
SELECT * FROM Housing WHERE BuildingValue > 200000;

-- Q.24 Properties in a specific tax district
SELECT * FROM Housing WHERE TaxDistrict = '[TaxDistrictName]';

-- Q.25 Distribution of properties by sale price range
SELECT
    CASE
        WHEN SalePrice < 100000 THEN '< 100k'
        WHEN SalePrice BETWEEN 100000 AND 200000 THEN '100k-200k'
        WHEN SalePrice BETWEEN 200000 AND 300000 THEN '200k-300k'
        ELSE '> 300k'
    END AS PriceRange,
    COUNT(*) AS PropertyCount
FROM Housing
GROUP BY PriceRange;

-- Q.26 Properties with missing property address
SELECT * FROM Housing WHERE PropertyAddress IS NULL;

-- Q.27 Properties sold in the last 5 years
SELECT * FROM Housing WHERE SaleDate >= CURRENT_DATE - INTERVAL '5 years';

-- Q.28 Properties with owner address containing 'GOODLETTSVILLE
SELECT * FROM Housing WHERE OwnerAddress LIKE '%GOODLETTSVILLE%';

-- Q.29 Properties built in the last 10 years
SELECT * FROM Housing WHERE YearBuilt >= EXTRACT(YEAR FROM CURRENT_DATE) - 10;






























