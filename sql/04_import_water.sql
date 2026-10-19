-- Step 16. Run only after confirming that water_data is empty.
-- CSV positions map discharge_spec -> disch_spec, discharge_vol -> disch_vol,
-- shortwave_rad -> short_rad and longwave_rad -> long_rad.
USE water_db;
LOAD DATA LOCAL INFILE '/home/ec2-user/Water.csv'
INTO TABLE water_data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    `date`, precipitation, pet, temperature,
    @disch_spec, @disch_vol, peti, humidity,
    short_rad, long_rad, windspeed
)
SET
    disch_spec = NULLIF(@disch_spec, ''),
    disch_vol = NULLIF(@disch_vol, '');
SHOW WARNINGS LIMIT 10;
SELECT COUNT(*) AS water_rows FROM water_data;
SELECT * FROM water_data ORDER BY `date` LIMIT 10;
