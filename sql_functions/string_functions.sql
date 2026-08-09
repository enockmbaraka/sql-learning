/* 
===============================================
STRING FUNCTIONS
================================================ 
*/

 /* 
 ==================================================
 We will use a table, called water_sources_sa_2022, that represents water sources in South Africa for the year 2022, 
 their types (surface water or groundwater), and their availability levels (high, medium, or low).
=================================================== 
*/
CREATE DATABASE IF NOT EXISTS water_sources;

USE water_sources;

/* ============================================================
   WATER SOURCES SOUTH AFRICA - 2022
   ============================================================ */

-- Create the table
CREATE TABLE water_sources_sa_2022 (
    Source_id INT PRIMARY KEY,
    Source_name VARCHAR(100) NOT NULL,
    Water_type VARCHAR(50) NOT NULL,
    Availability VARCHAR(20) NOT NULL
);

-- Populate the table
INSERT INTO water_sources_sa_2022
    (Source_id, Source_name, Water_type, Availability)
VALUES
    (1, 'Orange River', 'Surface Water', 'High'),
    (2, 'Karoo Aquifer', 'Groundwater', 'Medium'),
    (3, 'Vaal Dam', 'Surface Water', 'Medium'),
    (4, 'Table Mountain Spring', 'Groundwater', 'Low'),
    (5, 'Kruger National Park River', 'Surface Water', 'High'),
    (6, 'Cape Town Reservoir', 'Surface Water', 'Low');

-- Verify the data
SELECT *
FROM water_sources_sa_2022;


/* 
=====================================================
STRIMG MANIPULATION
=====================================================
*/
USE water_sources;

SHOW TABLES; 

-- UPPER() and LOWER() functions

SELECT 
UPPER(Source_name) AS Upper_source_name,
LOWER(Source_name) AS Lower_source_name
FROM water_sources_sa_2022;

-- LTRIM() and RTRIM()
SELECT 
LTRIM(RTRIM(Water_type)) AS Trimmed_water_type
FROM 
water_sources_sa_2022;

SELECT 
RTRIM(LTRIM(Water_type)) AS Trimmed_water_type
FROM 
water_sources_sa_2022;

-- LENGTH()
SELECT
Source_name,
LENGTH(Source_name) AS Name_length
FROM water_sources_sa_2022;

-- SUBSTRING()/SUBSTR()
SELECT
Source_name,
SUBSTRING(Source_name, 1, 5) AS Extracted_string
FROM water_sources_sa_2022;

-- CONCAT()
SELECT *
FROM water_sources_sa_2022;

SELECT
CONCAT(Source_name, ' water availability is ', Availability) AS Availability_status
FROM water_sources_sa_2022;

-- REPLACE()
SELECT
Source_name,
REPLACE(Source_name, 'Orange River', 'River Limpopo') AS Modified_name
FROM water_sources_sa_2022;

SELECT
Source_name,
REPLACE(Source_name, 'River', 'Lake') AS Modified_name
FROM water_sources_sa_2022;