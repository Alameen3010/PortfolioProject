
-- Standardize Date Format
SELECT saleDateConverted, CONVERT(Date, SaleDate)
FROM dbo.OttawaHousing;

-- Update SaleDate
UPDATE dbo.OttawaHousing
SET SaleDate = CONVERT(Date, SaleDate);

-- Alter Table to Add New Column
ALTER TABLE dbo.OttawaHousing
ADD SaleDateConverted Date;

-- Update New Column with Converted Dates
UPDATE dbo.OttawaHousing
SET SaleDateConverted = CONVERT(Date, SaleDate);



--Populate Property Address data

SELECT *
FROM dbo.OttawaHousing
--Where PropertyAddress is null
order by ParcelID


SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM dbo.OttawaHousing a
JOIN dbo.OttawaHousing b
	on a.ParcelID = b.ParcelID 
	AND a.[UniqueID] <> b.[UniqueID]
Where a.PropertyAddress is null 

Update a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM dbo.OttawaHousing a
JOIN dbo.OttawaHousing b
	on a.ParcelID = b.ParcelID 
	AND a.[UniqueID] <> b.[UniqueID]
Where a.PropertyAddress is null 


--Breaking out Address into Individual Columns(Address, City, State)


SELECT PropertyAddress
FROM dbo.OttawaHousing
--Where PropertyAddress is null

SELECT
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress , CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress)) as Address
FROM dbo.OttawaHousing


ALTER TABLE dbo.OttawaHousing
ADD	PropertySplitAddress NvarChar(255);


UPDATE dbo.OttawaHousing
SET PropertySplitAddress =SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )

ALTER TABLE dbo.OttawaHousing
ADD	PropertySplitCity NvarChar(255);


UPDATE dbo.OttawaHousing
SET PropertySplitCity =SUBSTRING(PropertyAddress , CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress))


Select * 
FROM dbo.OttawaHousing
