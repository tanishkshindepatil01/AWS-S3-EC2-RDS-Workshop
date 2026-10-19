-- Optional demonstration for Steps 15 and 17.
-- ROLLBACK restores the values that existed when this transaction began.
-- To keep the workshop edits instead, deliberately change ROLLBACK to COMMIT.
START TRANSACTION;
SELECT * FROM finance_db.amazon_prices WHERE `date` = '2021-10-15';
UPDATE finance_db.amazon_prices
SET `open` = 1000.00, `close` = 1100.00
WHERE `date` = '2021-10-15';
SELECT * FROM finance_db.amazon_prices WHERE `date` = '2021-10-15';

SELECT * FROM water_db.water_data WHERE `date` = '1970-10-01';
UPDATE water_db.water_data
SET disch_spec = 10.00, disch_vol = -10.00
WHERE `date` = '1970-10-01';
SELECT * FROM water_db.water_data WHERE `date` = '1970-10-01';
ROLLBACK;
-- The demonstration values are artificial, not corrected source measurements.
