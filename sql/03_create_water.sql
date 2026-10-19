-- Step 15. Empty discharge fields are allowed to remain NULL.
CREATE DATABASE IF NOT EXISTS water_db;
USE water_db;
CREATE TABLE IF NOT EXISTS water_data (
    `date` DATE PRIMARY KEY,
    precipitation DECIMAL(12,4) NOT NULL,
    pet DECIMAL(12,4) NOT NULL,
    temperature DECIMAL(12,4) NOT NULL,
    disch_spec DECIMAL(12,4) NULL,
    disch_vol DECIMAL(12,4) NULL,
    peti DECIMAL(12,4) NOT NULL,
    humidity DECIMAL(12,4) NOT NULL,
    short_rad DECIMAL(12,4) NOT NULL,
    long_rad DECIMAL(12,4) NOT NULL,
    windspeed DECIMAL(12,4) NOT NULL
);
DESCRIBE water_data;
SELECT COUNT(*) AS existing_rows FROM water_data;
