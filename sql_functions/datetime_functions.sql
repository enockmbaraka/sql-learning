/* 
=============================================================
DATETIME FUNCTIONS
=============================================================
*/

/* 
=============================================================
we will use the Water_consumption_data_sa table that represents the amount of water (liters) consumed within South African cities,
as well as the date, time, and timestamp of their recording.
=============================================================
*/

USE water_sources;

/* ============================================================
   WATER CONSUMPTION DATA - SOUTH AFRICA
   ============================================================ */

-- Create the table
CREATE TABLE water_consumption_data_sa (
    City VARCHAR(50) NOT NULL,
    Water_consumption INT NOT NULL,
    Date_recorded DATE NOT NULL,
    Time_recorded TIME NOT NULL,
    Timestamp_recorded DATETIME NOT NULL
);

-- Populate the table
INSERT INTO water_consumption_data_sa
    (City, Water_consumption, Date_recorded, Time_recorded, Timestamp_recorded)
VALUES
    ('Johannesburg', 150000, '2022-08-10', '08:45:00', '2023-06-26 08:45:00'),
    ('Cape Town',     100000, '2022-07-25', '09:15:00', '2023-06-26 09:15:00'),
    ('Durban',        120000, '2022-09-02', '10:30:00', '2023-06-26 10:30:00'),
    ('Pretoria',      140000, '2022-08-15', '11:45:00', '2023-06-26 11:45:00'),
    ('Port Elizabeth', 80000, '2022-09-01', '12:15:00', '2023-06-26 12:15:00'),
    ('Bloemfontein',   60000, '2022-07-30', '13:30:00', '2023-06-26 13:30:00');

-- Verify the data
SELECT *
FROM water_consumption_data_sa;

/*
=================================================
DATETIME FUNCTIONS MANIPULATION
=================================================
*/
-- CURRENT_DATE()
SELECT
CURRENT_DATE() AS TodaysDate;

-- NOW()
SELECT
NOW() AS TodaysTimestamp;

-- CURRENT_TIMESTAMP()
SELECT
CURRENT_TIMESTAMP() AS CurrentTimestamp;

-- DAY()
SELECT
City,
Date_recorded,
DAY(Date_recorded) AS DayRecorded
FROM water_consumption_data_sa;

-- MONTH()
SELECT
City,
Date_recorded,
MONTH(Date_recorded) AS MonthRecorded
FROM water_consumption_data_sa;

-- YEAR()
SELECT
City,
Date_recorded,
YEAR(Date_recorded) AS YearRecorded
FROM water_consumption_data_sa;

-- DATEDIFF()
SELECT
City,
Date_recorded,
DATEDIFF(NOW(), Date_recorded) AS Days_elapsed
FROM water_consumption_data_sa;
-- OR
SELECT
City,
Date_recorded,
DATEDIFF(CURRENT_DATE(), Date_recorded) AS Days_elapsed
FROM water_consumption_data_sa;

-- DATE_ADD()
SELECT
City,
Date_recorded,
DATE_ADD(Date_recorded, INTERVAL 7 DAY) AS Next_Review
FROM water_consumption_data_sa;