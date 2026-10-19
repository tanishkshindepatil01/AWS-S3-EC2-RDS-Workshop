-- Step 14. Run only after confirming that amazon_prices is empty.
-- The client must run on EC2, where /home/ec2-user/AMZN.csv is stored.
USE finance_db;
LOAD DATA LOCAL INFILE '/home/ec2-user/AMZN.csv'
INTO TABLE amazon_prices
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(`date`, `open`, `high`, `low`, `close`, adj, volume);
SHOW WARNINGS LIMIT 10;
SELECT COUNT(*) AS amazon_rows FROM amazon_prices;
SELECT * FROM amazon_prices ORDER BY `date` LIMIT 10;
