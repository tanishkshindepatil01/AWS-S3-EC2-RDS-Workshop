-- Step 18. These queries do not change data.
SELECT COUNT(*) AS amazon_rows, MIN(`date`) AS first_date,
       MAX(`date`) AS last_date
FROM finance_db.amazon_prices;
SELECT COUNT(*) AS water_rows, MIN(`date`) AS first_date,
       MAX(`date`) AS last_date,
       SUM(disch_spec IS NULL) AS missing_disch_spec,
       SUM(disch_vol IS NULL) AS missing_disch_vol
FROM water_db.water_data;
-- Expected raw imports: 251 finance rows and 16,436 water rows.
-- Each discharge field has 9,170 NULLs before the example Water UPDATE.
-- A committed update on 1970-10-01 reduces each NULL count to 9,169.
SELECT * FROM finance_db.amazon_prices WHERE `date` = '2021-10-15';
SELECT * FROM water_db.water_data WHERE `date` = '1970-10-01';
