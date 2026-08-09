/* =========================================================
   HOUSEHOLDS_INDIVIDUALS
   household survey data
   ========================================================= */

-- 1. Create the database
CREATE DATABASE IF NOT EXISTS miscellaneous;

USE miscellaneous;


-- 2. Remove the table if it already exists
DROP TABLE IF EXISTS households_individuals;


-- 3. Create the table
CREATE TABLE households_individuals (
    ID              INT PRIMARY KEY,
    Sex             VARCHAR(10),
    D_0_B           DATETIME,
    Age             INT,
    Weight          DECIMAL(6,2),
    Highest_ed      VARCHAR(50),
    Ed_institution  VARCHAR(50),
    Marital_status  VARCHAR(20),
    Spouse          VARCHAR(10),
    Spouse_ID       INT
);


-- 4. Insert sample data
--
-- IMPORTANT:
-- The spouse IDs below all exist in this sample dataset.
-- 3961 <-> 3331
-- 3661 <-> 3891

INSERT INTO households_individuals
    (
        ID,
        Sex,
        D_0_B,
        Age,
        Weight,
        Highest_ed,
        Ed_institution,
        Marital_status,
        Spouse,
        Spouse_ID
    )
VALUES
    -- Single individuals
    (3901, 'Male',   '2020-06-30 00:00:00', 0,  7.24,
        NULL,       NULL,      'Single',  'N/A', NULL),

    (3821, 'Female', '1998-05-21 00:00:00', 22, 67.00,
        'Diploma',  'Public',  'Single',  'N/A', NULL),

    (3741, 'Female', '2012-01-09 00:00:00', 8,  45.22,
        'Primary',  'Private', 'Single',  'N/A', NULL),

    (63921, 'Female', '2004-06-30 00:00:00', 16, 45.99,
        'Secondary', 'Public', 'Single', 'N/A', NULL),

    -- Married individuals
    (3961, 'Male',   '1970-11-15 00:00:00', 49, 59.00,
        'Masters',  NULL,      'Married', 'Yes', 3331),

    (3331, 'Female', '1975-03-20 00:00:00', 45, 62.50,
        'Diploma',  'Public',  'Married', 'Yes', 3961),

    (3661, 'Male',   '1989-10-04 00:00:00', 30, 77.00,
        'PHD',      NULL,      'Married', 'Yes', 3891),

    (3891, 'Female', '1991-07-12 00:00:00', 28, 68.40,
        'Masters',  'Private', 'Married', 'Yes', 3661);


-- 5. Check the data
SELECT *
FROM households_individuals;


-- 6. Add the self-referencing foreign key
ALTER TABLE households_individuals
ADD CONSTRAINT fk_spouse
FOREIGN KEY (Spouse_ID)
REFERENCES households_individuals(ID);